//
//  SingleChangelogView.swift
//  hermes-widget-ios
//
//  Created by Bezaleel Ashefor on 07/05/2024.
//

import SwiftUI
import MarkdownUI

struct SingleChangelogView: View {
    @Binding var changelog : Changelog
    var verticalPadding : CGFloat = 7
    var horizontalPadding : CGFloat = 8
    var cornerRadius : CGFloat = 20
    
    var body: some View {
        VStack(alignment: .leading){
            Text(changelog.title).font(.custom(FontsManager.fontBold, size: 24))
            Spacer().frame(height: 1)
            Text(getStringFromDate(thisDate: changelog.updatedAt)).font(.custom(FontsManager.fontRegular, size: 14)).opacity(0.8)
            Spacer().frame(height: 15)
            //let content = MarkdownContent(changelog.content)
            Markdown(changelog.content).font(.custom(FontsManager.fontRegular, size: 16))
            //MDText(markdown: changelog.content).font(.custom(FontsManager.fontRegular, size: 16))
            Spacer().frame(height:15)
            HStack(spacing: 0){
                Button(action: {}){
                    Text("❤️")
                    Text("\(changelog.heartReaction)")
                }.padding(.vertical, verticalPadding)
                    .padding(.horizontal, horizontalPadding)
                    .background(Color(.systemGray4))
                    .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
                Spacer()
                Button(action: {}){
                    Text("😀")
                    Text("\(changelog.smileReaction)")
                }.padding(.vertical, verticalPadding)
                    .padding(.horizontal, horizontalPadding)
                    .background(Color(.systemGray4))
                    .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
                Spacer()
                Button(action: {}){
                    Text("🔥")
                    Text("\(changelog.fireReaction)")
                }.padding(.vertical, verticalPadding)
                    .padding(.horizontal, horizontalPadding)
                    .background(Color(.systemGray4))
                    .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
                Spacer()
                Button(action: {}){
                    Text("👍🏼")
                    Text("\(changelog.thumbsUpReaction)")
                }.padding(.vertical, verticalPadding)
                    .padding(.horizontal, horizontalPadding)
                    .background(Color(.systemGray4))
                    .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
                Spacer()
                Button(action: {}){
                    Text("👎🏼")
                    Text("\(changelog.thumbsDownReaction)")
                }.padding(.vertical, verticalPadding)
                    .padding(.horizontal, horizontalPadding)
                    .background(Color(.systemGray4))
                    .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
                Spacer()
                Button(action: {}){
                    Text("😢")
                    Text("\(changelog.sobReaction)")
                }.padding(.vertical, verticalPadding)
                    .padding(.horizontal, horizontalPadding)
                    .background(Color(.systemGray4))
                    .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
            }.padding(.horizontal, 5).font(.custom(FontsManager.fontRegular, size: 14))
            Spacer().frame(height: 20)
        }.frame(minWidth: 0, maxWidth: .infinity, alignment: .leading).font(.custom(FontsManager.fontRegular, size: 16))
    }
    
    func getStringFromDate(thisDate: String) -> String {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        
        let date: Date? = dateFormatterGet.date(from: thisDate)
        
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.timeZone = TimeZone.current
        dateFormatterPrint.locale = Locale(identifier: "en_US_POSIX")
        dateFormatterPrint.dateFormat = "EEEE, dd MMMM YY"
        
        print("Gotten Date \(thisDate)")
        print("Formated Date \(date)")
        print("")
        return dateFormatterPrint.string(from: date ?? Date())
    }
}

#Preview {
    SingleChangelogView(changelog: 
            .constant(Changelog(id: "",
                                status: "",
                                title: "",
                                content: "",
                                app: "",
                                company: "",
                                author: Author(id: "",
                                               avartar: "Sinestro",
                                               name: "Sinestro"),
                                createdAt: "",
                                updatedAt: "",
                                fireReaction: 0,
                                heartReaction: 0,
                                smileReaction: 0,
                                sobReaction: 0,
                                thumbsDownReaction: 0,
                                thumbsUpReaction: 0,
                                v: 0)))
}