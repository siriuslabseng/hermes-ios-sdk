//
//  ChangelogView.swift
//  hermes-widget-ios
//
//  Created by Bezaleel Ashefor on 15/01/2023.
//

import SwiftUI

struct ChangelogView: View {
    
    @ObservedObject var viewObserver : ViewObserver
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack{
            HStack(spacing: 0){
                Button(action: {presentationMode.wrappedValue.dismiss()}){
                    Image(systemName: "multiply")
                        .font(.system(size: 22, weight: .bold))
                        .foregroundColor(.primary)
                }
                Spacer()
            }.padding([.horizontal], 18).padding([.leading], 6).padding([.top, .bottom], 18).background(Color("Ravage").edgesIgnoringSafeArea(.all))
            HStack{
                Text("Changelog").font(.system(size: 32, weight: .bold))
                Spacer()
            }.padding([.horizontal], 18)
            ScrollView(showsIndicators: false){
                LazyVStack(alignment: .center){
                    ForEach(viewObserver.changelogResult.data.changelogs, id: \.id) { changelog in
                        VStack(alignment: .leading){
                            Text(changelog.title).font(.system(size: 24, weight: .bold))
                            Text(changelog.createdAt).font(.system(size: 10, weight: .regular))
                            Text(changelog.content).font(.system(size: 14, weight: .regular))
                        }.padding(.vertical, 12).padding(.horizontal, 14).background(Color.white).cornerRadius(6)
                    }
                }.padding([.horizontal], 14)
            }
            Spacer()
        }.background(Color(.systemGray5).ignoresSafeArea())
    }
}

struct ChangelogView_Previews: PreviewProvider {
    static var viewObserver = ViewObserver()
    
    static var previews: some View {
        ChangelogView(viewObserver: viewObserver)
    }
}
