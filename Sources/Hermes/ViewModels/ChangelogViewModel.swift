//
//  ChangelogViewModel.swift
//  hermes-widget-ios
//
//  Created by Bezaleel Ashefor on 15/01/2023.
//

import Foundation


class ChangelogViewModel {
    
    func fetchStuff(slug_id : String, public_key: String, completion: @escaping (Result<ChangelogResult, Error>) -> Void){
        let url = URL(string:  "\(Constants.base_url)/changelog/slug/\(slug_id)/")!
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = [
            "x-hermes-public-key": "\(public_key)",
            "origin": "*",
            "Content-Type": "application/json"
        ]
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(error!))
                return
            }
            
            do {
                // Parse the JSON data
                let changelogResult = try JSONDecoder().decode(ChangelogResult.self, from: data)
                completion(.success(changelogResult))
            } catch {
                completion(.failure(error))
            }
        }
        
        task.resume()
    }
}
