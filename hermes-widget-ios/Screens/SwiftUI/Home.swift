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
    
    @State var showChangelogView = false
    
    var body: some View {
        ZStack(alignment: .bottom){
            VStack(spacing: 30){
                VStack(alignment: .leading){
                    Text("Widget Slug").font(.custom(FontsManager.fontRegular, size: 16))
                    TextField("Type or paste slug_id here", text: $slug_id)
                        .keyboardType(.default)
                        .font(.custom(FontsManager.fontRegular, size: 16))
                    //.textInputAutocapitalization(.sentences)
                        .padding(.vertical, 15)
                        .padding(.horizontal, 12)
                        .autocapitalization(.none)
                        .background(Color(.systemGray5))
                        .cornerRadius(8)
                    
                }
                VStack(alignment: .leading){
                    Text("Your Hermes Public Key").font(.custom(FontsManager.fontRegular, size: 16))
                    TextField("Type or paste public key here", text: $public_key)
                        .keyboardType(.default)
                        .font(.custom(FontsManager.fontRegular, size: 16))
                    //.textInputAutocapitalization(.sentences)
                        .padding(.vertical, 15)
                    
                        .padding(.horizontal, 12)
                        .autocapitalization(.none)
                        .background(Color(.systemGray5))
                        .cornerRadius(8)
                }
                Button(action: {
                    showChangelogView = true
                }){
                    Text("Show Changelog").foregroundColor(Color.white).font(.custom(FontsManager.fontBold, size: 16))
                }.padding(.vertical, 10).padding(.horizontal, 16).background(Color(.systemBlue)).cornerRadius(6).padding(.top, 10)
            }
            .padding(.horizontal, 20).frame(minHeight: 0, maxHeight: .infinity).background(Color(UIColor.systemBackground))
        }.overlay(loading ?  VStack{
            ProgressView().progressViewStyle(CircularProgressViewStyle(tint: Color.primary))
                .frame(width: 20, height: 20)
                .scaleEffect(1.0, anchor: .center)
        }  : nil, alignment: .bottom).sheet(isPresented: $showChangelogView){
            ChangelogView(viewObserver: viewObserver)
        }
        
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

