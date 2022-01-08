//
//  BookmarkParser.swift
//  
//
//  Created by Nikola Stojanovic on 14.12.20..
//
import Foundation
import AppModels

struct Parser {
    var parse: (Data) throws -> [Bookmark]

    static var safari: Parser {
        Parser { input in
            let model = try PropertyListDecoder().decode(SafariBookmarkList.self, from: input)
            return model.all.map { Bookmark.init(id: $0.id, title: $0.title, url: $0.url) }
        }
    }

    static var google: Parser {
        Parser { input in
            let models = ChromeBookmarkList(from: try JSONSerialization.jsonObject(with: input) as? JSON ?? [:])
            return models?.bookmarks.compactMap { Bookmark.init(id: $0.id, title: $0.title, url: $0.url) } ?? []
        }
    }
}
