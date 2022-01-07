//
//  ChromeBookmark.swift
//  
//
//  Created by Nikola Stojanovic on 3.1.22..
//

import Foundation

public struct ChromeBookmark: Decodable, Identifiable, Hashable {
    public let id: UUID
    public var title: String
    public var url: URL?


    enum RootCodingKeys: String, CodingKey {
        case roots
    }

    enum BookmarkBarCodingKeys: String, CodingKey {
        case bookmarkBar = "bookmark_bar"
    }

    enum BookmarkCodingKeys: String, CodingKey {
        case title = "name"
        case url
        case id = "guid"
    }


    public init(from decoder: Decoder) throws {
        let rootContainer = try decoder.container(keyedBy: RootCodingKeys.self)
        let bookmarkBarContainer = try rootContainer.nestedContainer(keyedBy: BookmarkBarCodingKeys.self, forKey: .roots)
        let container = try bookmarkBarContainer.nestedContainer(keyedBy: BookmarkCodingKeys.self, forKey: .bookmarkBar)
        guard let id = UUID(uuidString: try container.decode(String.self, forKey: .id)) else { preconditionFailure() }
        self.id = id
        self.title = try container.decode(String.self, forKey: .title)
        self.url = URL(string: try container.decode(String.self, forKey: .url))
    }
}
