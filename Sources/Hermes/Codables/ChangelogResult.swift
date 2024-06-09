//
//  ChangelogResult.swift
//  hermes-widget-ios
//
//  Created by Bezaleel Ashefor on 15/01/2023.
//

import Foundation

// MARK: - ChangelogResult
struct ChangelogResult: Codable {
    let status: Int
    let method, message: String
    let data: DataClass
}

// MARK: - DataClass
struct DataClass: Codable {
    let page, pages, count: Int
    let changelogs: [Changelog]
}

// MARK: - Changelog
struct Changelog: Codable {
    let id, status, title, content: String
    let app, company: String
    let author: Author
    let createdAt, updatedAt: String
    var fireReaction, heartReaction, smileReaction, sobReaction, thumbsDownReaction, thumbsUpReaction: Int
    let v: Int

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case status, title, content, app, company, author, createdAt, updatedAt
        case fireReaction, heartReaction, smileReaction, sobReaction, thumbsDownReaction, thumbsUpReaction
        case v = "__v"
    }
}

// MARK: - Author
struct Author: Codable {
    let id: String
    let avartar: String
    let name: String

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case avartar, name
    }
}
