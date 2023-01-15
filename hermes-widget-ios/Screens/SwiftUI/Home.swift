//
//  Home.swift
//  hermes-widget-ios
//
//  Created by Bezaleel Ashefor on 15/01/2023.
//

import SwiftUI

struct Home: View {
    
    @State var slug_id = ""
    @State var public_key = ""
    @Environment(\.colorScheme) var colorScheme
    var changeViewModel = ChangelogViewModel()
    @State var loading = false
    @State var showChangelogView = false
    
    var body: some View {
        ZStack(alignment: .bottom){
            VStack(spacing: 15){
                TextField("Type or paste slud_id here", text: $slug_id)
                    .keyboardType(.default)
                    .textInputAutocapitalization(.sentences)
                    .padding(.vertical, 15)
                    .padding(.horizontal, 12)
                    .autocapitalization(.none)
                    .background(Color(.systemGray5))
                    .cornerRadius(8)
                TextField("Type or paste public key here", text: $public_key)
                    .keyboardType(.default)
                    .textInputAutocapitalization(.sentences)
                    .padding(.vertical, 15)
                    
                    .padding(.horizontal, 12)
                    .autocapitalization(.none)
                    .background(Color(.systemGray5))
                    .cornerRadius(8)
                Button(action: {}){
                    Text("Show Changelog").foregroundColor(Color.white)
                }.padding(10).background(Color(.systemBlue)).cornerRadius(8).padding(.top, 20)
            }
                .padding(.horizontal, 20)
            if (loading){
                VStack{
                    ProgressView().progressViewStyle(CircularProgressViewStyle(tint: Color.primary))
                        .frame(width: 20, height: 20)
                        .scaleEffect(1.0, anchor: .center)
                }
            }
        }.sheet(isPresented: $showChangelogView){
            ChangelogView()
        }
        
    }
    
    func fetchChangelog(){
        loading = true
        changeViewModel.fetchStuff(slug_id: slug_id, public_key: public_key, completion: { result in
            loading = false
            
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

