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
    
    func addReaction(company: String, app_id: String, changelog_id: String, reaction: String, completion: @escaping (Result<Bool, Error>) -> Void){
        let url = URL(string:  "\(Constants.base_url)/changelog/\(company)/\(app_id)/\(changelog_id)/\(reaction)")!
        
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        request.allHTTPHeaderFields = [
            "Content-Type": "application/json"
        ]
        
        
        let jsonReaction = "{\"reaction\": \"\(reaction)\"}".data(using: .utf8)
        print(jsonReaction)
//        let jsonData = try? JSONSerialization.data(withJSONObject: jsonReaction)
//        print(jsonData)
        print("Ade")
        request.httpBody = jsonReaction//jsonData
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                completion(.failure(error!))
                return
            }
            
            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            if let responseJSON = responseJSON as? [String: Any] {
                print(responseJSON)
                completion(.success(true))
            }
        }
        
        task.resume()
    }
    
    
    func removeReaction(company: String, app_id: String, changelog_id: String, reaction: String, completion: @escaping (Result<Bool, Error>) -> Void){
        let url = URL(string:  "\(Constants.base_url)/changelog/\(company)/\(app_id)/\(changelog_id)/\(reaction)")!
        
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
        request.allHTTPHeaderFields = [
            "Content-Type": "application/json"
        ]
        
        let jsonData = try? JSONSerialization.data(withJSONObject: reaction)
        request.httpBody = jsonData
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                completion(.failure(error!))
                return
            }
            
            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            if let responseJSON = responseJSON as? [String: Any] {
                print(responseJSON)
                completion(.success(true))
            }
        }
        
        task.resume()
    }
    
}
