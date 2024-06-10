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
    @State var previousChangelog : Changelog
    var verticalPadding : CGFloat = 7
    var horizontalPadding : CGFloat = 8
    var spacing : CGFloat = 5
    var cornerRadius : CGFloat = 20
    @State var disableReactions = false
    
    
    var body: some View {
        VStack(alignment: .leading){
            Text(changelog.title).font(.custom(FontsManager.fontBold, size: 24))
            Spacer().frame(height: 1)
            Text(getStringFromDate(thisDate: changelog.updatedAt)).font(.custom(FontsManager.fontRegular, size: 14)).opacity(0.8)
            Spacer().frame(height: 15)
            Markdown(changelog.content).font(.custom(FontsManager.fontRegular, size: 16))
            Spacer().frame(height:15)
            HStack(spacing: 0){
                Button(action: {
                    toggleReaction(reaction: .HEART)
                }){
                    HStack(spacing: spacing){
                        Text("❤️")
                        Text("\(changelog.heartReaction)")
                    }
                }.padding(.vertical, verticalPadding)
                    .padding(.horizontal, horizontalPadding)
                    .background(Color(.systemGray4))
                    .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
                    .disabled(disableReactions)
                    .opacity(disableReactions ? 0.6 : 1.0)
                Spacer()
                Button(action: {
                    toggleReaction(reaction: .SMILE)
                }){
                    HStack(spacing: spacing){
                        Text("😀")
                        Text("\(changelog.smileReaction)")
                    }
                    
                }.padding(.vertical, verticalPadding)
                    .padding(.horizontal, horizontalPadding)
                    .background(Color(.systemGray4))
                    .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
                    .disabled(disableReactions)
                    .opacity(disableReactions ? 0.6 : 1.0)
                Spacer()
                Button(action: {
                    toggleReaction(reaction: .FIRE)
                }){
                    HStack(spacing: spacing){
                        Text("🔥")
                        Text("\(changelog.fireReaction)")
                    }
                }.padding(.vertical, verticalPadding)
                    .padding(.horizontal, horizontalPadding)
                    .background(Color(.systemGray4))
                    .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
                    .disabled(disableReactions)
                    .opacity(disableReactions ? 0.6 : 1.0)
                Spacer()
                Button(action: {
                    toggleReaction(reaction: .THUMBSUP)
                }){
                    HStack(spacing: spacing){
                        Text("👍🏼")
                        Text("\(changelog.thumbsUpReaction)")}
                }.padding(.vertical, verticalPadding)
                    .padding(.horizontal, horizontalPadding)
                    .background(Color(.systemGray4))
                    .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
                    .disabled(disableReactions)
                    .opacity(disableReactions ? 0.6 : 1.0)
                Spacer()
                Button(action: {
                    toggleReaction(reaction: .THUMBSDOWN)
                }){
                    HStack(spacing: spacing){
                        Text("👎🏼")
                        Text("\(changelog.thumbsDownReaction)")
                    }
                    
                }.padding(.vertical, verticalPadding)
                    .padding(.horizontal, horizontalPadding)
                    .background(Color(.systemGray4))
                    .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
                    .disabled(disableReactions)
                    .opacity(disableReactions ? 0.6 : 1.0)
                Spacer()
                Button(action: {
                    toggleReaction(reaction: .SOB)
                }){
                    HStack(spacing: spacing){
                        Text("😢")
                        Text("\(changelog.sobReaction)")
                    }
                    
                }.padding(.vertical, verticalPadding)
                    .padding(.horizontal, horizontalPadding)
                    .background(Color(.systemGray4))
                    .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
                    .disabled(disableReactions)
                    .opacity(disableReactions ? 0.6 : 1.0)
            }.font(.custom(FontsManager.fontRegular, size: 14))
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
        print("Formatted Date \(date)")
        print("")
        return dateFormatterPrint.string(from: date ?? Date())
    }
    
    private func toggleReaction(reaction: Reaction){
        disableReactions.toggle()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5){
            disableReactions.toggle()
            switch (reaction) {
            case .HEART:
                if (changelog.heartReaction == previousChangelog.heartReaction){
                    changelog.heartReaction += 1
                } else {
                    changelog.heartReaction -= 1
                }
            case .SMILE:
                if (changelog.smileReaction == previousChangelog.smileReaction){
                    changelog.smileReaction += 1
                } else {
                    changelog.smileReaction -= 1
                }
            case .FIRE:
                if (changelog.fireReaction == previousChangelog.fireReaction){
                    changelog.fireReaction += 1
                } else {
                    changelog.fireReaction -= 1
                }
            case .THUMBSUP:
                if (changelog.thumbsUpReaction == previousChangelog.thumbsUpReaction){
                    changelog.thumbsUpReaction += 1
                } else {
                    changelog.thumbsUpReaction -= 1
                }
            case .THUMBSDOWN:
                if (changelog.thumbsDownReaction == previousChangelog.thumbsDownReaction){
                    changelog.thumbsDownReaction += 1
                } else {
                    changelog.thumbsDownReaction -= 1
                }
            case .SOB:
                if (changelog.sobReaction == previousChangelog.sobReaction){
                    changelog.sobReaction += 1
                } else {
                    changelog.sobReaction -= 1
                }
            }
        }
    }
}

#Preview {
    @State var changelog = Changelog(id: "",
                                     status: "",
                                     title: "Litur 5 - v48",
                                     content: "",
                                     app: "Litur",
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
                                     v: 0)
    return SingleChangelogView(changelog:
                                $changelog, previousChangelog: changelog)
}
