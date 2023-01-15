//
//  Home.swift
//  hermes-widget-ios
//
//  Created by Bezaleel Ashefor on 15/01/2023.
//

import SwiftUI

struct Home: View {
    
    @AppStorage("slug_id") var slug_id = ""
    @AppStorage("public_key") var public_key = ""
    @Environment(\.colorScheme) var colorScheme
    @StateObject var viewObserver = ViewObserver()
    var changeViewModel = ChangelogViewModel()
    @State var loading = false
    @State var showChangelogView = false
    
    var body: some View {
        ZStack(alignment: .bottom){
            VStack(spacing: 30){
                VStack(alignment: .leading){
                    Text("Widget Slug")
                    TextField("Type or paste slud_id here", text: $slug_id)
                        .keyboardType(.default)
                    //.textInputAutocapitalization(.sentences)
                        .padding(.vertical, 15)
                        .padding(.horizontal, 12)
                        .autocapitalization(.none)
                        .background(Color(.systemGray5))
                        .cornerRadius(8)
                    
                }
                VStack(alignment: .leading){
                    Text("Your Hermes Public Key")
                    TextField("Type or paste public key here", text: $public_key)
                        .keyboardType(.default)
                    //.textInputAutocapitalization(.sentences)
                        .padding(.vertical, 15)
                    
                        .padding(.horizontal, 12)
                        .autocapitalization(.none)
                        .background(Color(.systemGray5))
                        .cornerRadius(8)
                }
                Button(action: {
                    fetchChangelog()
                }){
                    Text("Show Changelog").foregroundColor(Color.white)
                }.padding(10).background(Color(.systemBlue)).cornerRadius(8).padding(.top, 10)
            }
            .padding(.horizontal, 20).frame(minHeight: 0, maxHeight: .infinity)
        }.overlay(loading ?  VStack{
            ProgressView().progressViewStyle(CircularProgressViewStyle(tint: Color.primary))
                .frame(width: 20, height: 20)
                .scaleEffect(1.0, anchor: .center)
        }  : nil, alignment: .bottom).sheet(isPresented: $showChangelogView){
            ChangelogView(viewObserver: viewObserver)
        }
        
    }
    
    func fetchChangelog(){
        loading = true
        changeViewModel.fetchStuff(slug_id: slug_id, public_key: public_key, completion: { result in
            switch result {
            case .success(let httpResults):
                DispatchQueue.main.async {
                    viewObserver.changelogResult = httpResults
                    showChangelogView = true
                    loading = false
                }
            case .failure(let error):
                print("Request failed with error: \(error)")
            }
        })
    }
    
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

class HomeHostingController: UIHostingController<Home> {
    
    @objc required dynamic init?(coder: NSCoder) {
        super.init(coder: coder, rootView: Home())
    }
}

