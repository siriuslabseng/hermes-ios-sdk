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
    var fontRegular = "TTInterfaces-Regular.ttf"
    var fontMedium = "TTInterfaces-Medium.ttf"
    var fontBold = "TTInterfaces-Bold.ttf"
    var fontBlack = "TTInterfaces-Black.ttf"
    
    
    var body: some View {
        VStack{
            VStack{
                HStack(spacing: 0){
                    Text("Changelog").font(.custom(fontBold, size: 26))
                    Spacer()
                    Button(action: {presentationMode.wrappedValue.dismiss()}){
                        Image(systemName: "multiply")
                            .font(.system(size: 22, weight: .bold))
                            .foregroundColor(.primary)
                    }
                }
                Spacer().frame(height: 2)
                HStack{
                    Text("Powered by Hermes").font(.custom(fontRegular, size: 14))
                    Spacer()
                }
            }.padding([.horizontal], 18).padding([.top], 18)
            ScrollView(showsIndicators: false){
                LazyVStack(alignment: .center, spacing: 14){
                    ForEach(viewObserver.changelogResult.data.changelogs, id: \.id) { changelog in
                        VStack(alignment: .leading){
                            Text(changelog.title).font(.system(size: 24, weight: .bold))
                            Spacer().frame(height: 5)
                            Text(changelog.createdAt).font(.system(size: 10, weight: .regular))
                            Spacer().frame(height: 10)
                            Text(changelog.content).font(.system(size: 14, weight: .regular))
                        }.padding(.vertical, 12).padding(.horizontal, 14).background(Color.white).cornerRadius(6)
                    }
                }.padding([.horizontal], 16)
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
