//
//  Bookmark.swift
//  
//
//  Created by Nikola Stojanovic on 14.12.20..
//
import Foundation

public struct SafariBookmark: Decodable, Identifiable, Hashable {
    public let id = UUID()
    public var title: String
    public var url: URL?
    public var children: [SafariBookmark]

    var all: [SafariBookmark] {
        children + children.flatMap(\.all)
    }

    enum CodingKeys: String, CodingKey {
        case title = "URIDictionary"
        case url = "URLString"
        case children = "Children"
    }

    public init(title: String, url: URL?, children: [SafariBookmark]) {
        self.title = title
        self.url = url
        self.children = children
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.title = try container.decodeIfPresent([String: String].self, forKey: .title)?["title"] ?? "No title"
        self.url = URL(string: try container.decodeIfPresent(String.self, forKey: .url) ?? "")
        self.children = try container.decodeIfPresent([SafariBookmark].self, forKey: .children) ?? []
    }
}

public struct SafariBookmarkList: Decodable {
    public var children: [SafariBookmark]

    public var all: [SafariBookmark] {
        children + children.flatMap(\.all)
    }

    enum CodingKeys: String, CodingKey {
        case children = "Children"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.children = try container.decode([SafariBookmark].self, forKey: .children)
    }
}
