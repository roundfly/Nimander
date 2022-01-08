//
//  SafariBookmark.swift
//
//
//  Created by Nikola Stojanovic on 14.12.20..
//
import Foundation

struct SafariBookmark: Decodable, Identifiable, Hashable {
    let id = UUID()
    var title: String
    var url: URL?
    var children: [SafariBookmark]

    var all: [SafariBookmark] {
        children + children.flatMap(\.all)
    }

    enum CodingKeys: String, CodingKey {
        case title = "URIDictionary"
        case url = "URLString"
        case children = "Children"
    }

    init(title: String, url: URL?, children: [SafariBookmark]) {
        self.title = title
        self.url = url
        self.children = children
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.title = try container.decodeIfPresent([String: String].self, forKey: .title)?["title"] ?? ""
        self.url = URL(string: try container.decodeIfPresent(String.self, forKey: .url) ?? "")
        self.children = try container.decodeIfPresent([SafariBookmark].self, forKey: .children) ?? []
    }
}

struct SafariBookmarkList: Decodable {
    var children: [SafariBookmark]

    var all: [SafariBookmark] {
        children + children.flatMap(\.all)
    }

    enum CodingKeys: String, CodingKey {
        case children = "Children"
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.children = try container.decode([SafariBookmark].self, forKey: .children)
    }
}
