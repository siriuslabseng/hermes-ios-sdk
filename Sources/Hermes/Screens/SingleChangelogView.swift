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
    var changelogViewModel = ChangelogViewModel()
    
    
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
        
        switch (reaction) {
        case .HEART:
            if (changelog.heartReaction == previousChangelog.heartReaction){
                addReaction(reaction: .HEART, completion: { value in
                    changelog.heartReaction += 1
                    disableReactions.toggle()
                })
            } else {
                removeReaction(reaction: .HEART, completion: { value in
                    changelog.heartReaction -= 1
                    disableReactions.toggle()
                })
            }
        case .SMILE:
            if (changelog.smileReaction == previousChangelog.smileReaction){
                addReaction(reaction: .SMILE, completion: { value in
                    changelog.smileReaction += 1
                    disableReactions.toggle()
                })
            } else {
                removeReaction(reaction: .SMILE, completion: { value in
                    changelog.smileReaction -= 1
                    disableReactions.toggle()
                })
            }
        case .FIRE:
            if (changelog.fireReaction == previousChangelog.fireReaction){
                addReaction(reaction: .FIRE, completion: { value in
                    changelog.fireReaction += 1
                    disableReactions.toggle()
                })
            } else {
                removeReaction(reaction: .FIRE, completion: { value in
                    changelog.fireReaction -= 1
                    disableReactions.toggle()
                })
            }
        case .THUMBSUP:
            if (changelog.thumbsUpReaction == previousChangelog.thumbsUpReaction){
                addReaction(reaction: .THUMBSUP, completion: { value in
                    changelog.thumbsUpReaction += 1
                    disableReactions.toggle()
                })
            } else {
                removeReaction(reaction: .THUMBSUP, completion: { value in
                    changelog.thumbsUpReaction -= 1
                    disableReactions.toggle()
                })
            }
        case .THUMBSDOWN:
            if (changelog.thumbsDownReaction == previousChangelog.thumbsDownReaction){
                addReaction(reaction: .THUMBSDOWN, completion: { value in
                    changelog.thumbsDownReaction += 1
                    disableReactions.toggle()
                })
            } else {
                removeReaction(reaction: .THUMBSDOWN, completion: { value in
                    changelog.thumbsDownReaction -= 1
                    disableReactions.toggle()
                })
            }
        case .SOB:
            if (changelog.sobReaction == previousChangelog.sobReaction){
                addReaction(reaction: .SOB, completion: { value in
                    changelog.sobReaction += 1
                    disableReactions.toggle()
                })
            } else {
                removeReaction(reaction: .SOB, completion: { value in
                    changelog.sobReaction -= 1
                    disableReactions.toggle()
                })
            }
        }
        
    }
    
    private func addReaction(reaction: Reaction, completion: @escaping (Bool) -> Void) {
        changelogViewModel.addReaction(company: changelog.company, app_id: changelog.app, changelog_id: changelog.id, reaction: reaction.rawValue) { result in
            switch result {
            case .success(_):
                completion(true)
            case .failure(_):
                completion(false)
            }
        }
    }
    
    
    private func removeReaction(reaction: Reaction, completion: @escaping (Bool) -> Void) {
        changelogViewModel.removeReaction(company: changelog.company, app_id: changelog.app, changelog_id: changelog.id, reaction: reaction.rawValue) { result in
            switch result {
            case .success(_):
                completion(true)
            case .failure(_):
                completion(false)
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
