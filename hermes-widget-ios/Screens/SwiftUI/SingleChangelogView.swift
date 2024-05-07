//
//  SingleChangelogView.swift
//  hermes-widget-ios
//
//  Created by Bezaleel Ashefor on 07/05/2024.
//

import SwiftUI
import MarkdownUI

struct SingleChangelogView: View {
    @State var changelog : Changelog
    
    var body: some View {
        VStack(alignment: .leading){
            Text(changelog.title).font(.custom(FontsManager.fontBold, size: 24))
            Spacer().frame(height: 1)
            Text(getStringFromDate(thisDate: changelog.updatedAt)).font(.custom(FontsManager.fontRegular, size: 14)).opacity(0.8)
            Spacer().frame(height: 15)
            let content = MarkdownContent(changelog.content)
            Markdown(content).font(.custom(FontsManager.fontRegular, size: 16))
          
            HStack{
                
            }.frame(width: 50, height: 1).background(Color.gray)
            Spacer().frame(height: 15)
        }
    }
    
    func getStringFromDate(thisDate: String) -> String {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        
        let dateFormatterPrint = DateFormatter()
        let date: Date? = dateFormatterGet.date(from: thisDate)
        
        dateFormatterPrint.timeZone = TimeZone.current
        dateFormatterPrint.locale = Locale(identifier: "en_US_POSIX")
        dateFormatterPrint.dateFormat = "EEEE, dd MMMM YY"
        print(thisDate)
        return dateFormatterPrint.string(from: date ?? Date())
    }
}

#Preview {
    SingleChangelogView(changelog: Changelog(id: "", status: "", title: "", content: "", app: "", company: "", author: Author(id: "", avartar: "Sinestro", name: "Sinestro"), createdAt: "", updatedAt: "", v: 0))
}
