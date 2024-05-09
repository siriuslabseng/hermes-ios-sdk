//
//  ChangelogView.swift
//  hermes-widget-ios
//
//  Created by Bezaleel Ashefor on 15/01/2023.
//

import SwiftUI
import MarkdownUI

struct ChangelogView: View {
    
    @ObservedObject var viewObserver : ViewObserver
    @Environment(\.presentationMode) var presentationMode
    @State var loading = false
    
    
    var body: some View {
        VStack(spacing: 0){
            VStack{
                HStack(spacing: 0){
                    Text("Changelog").font(.custom(FontsManager.fontBlack, size: 28))
                    Spacer()
                    Button(action: {presentationMode.wrappedValue.dismiss()}){
                        Image(systemName: "multiply")
                            .font(.system(size: 22, weight: .bold))
                            .foregroundColor(.primary)
                    }
                }
                Spacer().frame(height: 2)
                HStack(spacing: 0){
                    Text("Powered by ").font(.custom(FontsManager.fontRegular, size: 12))
                    Image("logo").resizable().scaledToFit().frame(width: 20).padding(.top, 3)
                    Text(" Hermes").font(.custom(FontsManager.fontRegular, size: 12))
                    Spacer()
                }
            }.padding([.horizontal], 18).padding([.top], 18).padding([.bottom], 16).background(Color(UIColor.systemBackground).ignoresSafeArea())
            ScrollView(showsIndicators: false){
                Spacer().frame(height: 20)
                LazyVStack(alignment: .center, spacing: 14){
                    ForEach(viewObserver.changelogResult.data.changelogs, id: \.id) { changelog in
//                        VStack(alignment: .leading){
//                            Text(changelog.title).font(.custom(FontsManager.fontBold, size: 24))
//                            Spacer().frame(height: 1)
//                            Text(getStringFromDate(thisDate: changelog.updatedAt)).font(.custom(FontsManager.fontRegular, size: 14)).opacity(0.8)
//                            Spacer().frame(height: 15)
//                            let content = MarkdownContent(changelog.content)
//                            Markdown(content).font(.custom(FontsManager.fontRegular, size: 16))
//                          
//                            HStack{
//                                
//                            }.frame(width: 50, height: 1).background(Color.gray)
//                            Spacer().frame(height: 15)
//                        }
                        SingleChangelogView(changelog: changelog)
                    }
                }.padding([.horizontal], 18)
            }
            Spacer()
        }.background(Color(.systemGray5).ignoresSafeArea())
    }
    
//    func getStringFromDate(thisDate: String) -> String {
//        let dateFormatterGet = DateFormatter()
//        dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
//        
//        let dateFormatterPrint = DateFormatter()
//        let date: Date? = dateFormatterGet.date(from: thisDate)
//        
//        dateFormatterPrint.timeZone = TimeZone.current
//        dateFormatterPrint.locale = Locale(identifier: "en_US_POSIX")
//        dateFormatterPrint.dateFormat = "EEEE, dd MMMM YY"
//        return dateFormatterPrint.string(from: date ?? Date())
//    }
    
    func fetchChangelog(){
        loading = true
        changeViewModel.fetchStuff(slug_id: slug_id, public_key: public_key, completion: { result in
            switch result {
            case .success(let httpResults):
                DispatchQueue.main.async {
                    viewObserver.changelogResult = httpResults
                    
                    loading = false
                }
            case .failure(let error):
                print("Request failed with error: \(error)")
            }
        })
    }
}

struct ChangelogView_Previews: PreviewProvider {
    static var viewObserver = ViewObserver()
    
    static var previews: some View {
        ChangelogView(viewObserver: viewObserver)
    }
}
