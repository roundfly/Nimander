//
//  Bookmark.swift
//  
//
//  Created by Nikola Stojanovic on 14.12.20..
//
import Foundation

public struct Bookmark: Decodable, Identifiable, Hashable {
    public let id = UUID()
    public var title: String
    public var url: URL?
    public var children: [Bookmark]

    var all: [Bookmark] {
        children + children.flatMap { $0.all }
    }

    enum CodingKeys: String, CodingKey {
        case title = "URIDictionary"
        case url = "URLString"
        case children = "Children"
    }

    public init(title: String, url: URL?, children: [Bookmark]) {
        self.title = title
        self.url = url
        self.children = children
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.title = try container.decodeIfPresent([String: String].self, forKey: .title)?["title"] ?? "No title"
        self.url = URL(string: try container.decodeIfPresent(String.self, forKey: .url) ?? "")
        self.children = try container.decodeIfPresent([Bookmark].self, forKey: .children) ?? []
    }
}

public struct BookmarkList: Decodable {
    public var children: [Bookmark]

    public var all: [Bookmark] {
        children + children.flatMap { $0.all }
    }

    enum CodingKeys: String, CodingKey {
        case children = "Children"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.children = try container.decode([Bookmark].self, forKey: .children)
    }
}
