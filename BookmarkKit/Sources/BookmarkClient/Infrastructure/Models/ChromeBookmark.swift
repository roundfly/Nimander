//
//  ChromeBookmark.swift
//  
//
//  Created by Nikola Stojanovic on 7.1.22..
//

import Foundation

typealias JSON = [String: Any]

struct ChromeBookmarkList {
    struct ChromeBookmark {
        let id: UUID
        var title: String
        var url: URL?
    }
    var bookmarks: [ChromeBookmark]

    init?(from json: JSON) {
        guard
            let roots = json["roots"] as? JSON,
            let bookmarkBar = roots["bookmark_bar"] as? JSON,
            let children = bookmarkBar["children"] as? [JSON]
        else {
            print("Failed decoding json")
            return nil
        }
        bookmarks = children.compactMap({ json in
            guard
                let guid = json["guid"] as? String,
                let uuid = UUID(uuidString: guid),
                let name = json["name"] as? String,
                let urlString = json["url"] as? String,
                let url = URL(string: urlString)
            else {
                return nil
            }
            return ChromeBookmark(id: uuid, title: name, url: url)
        })
    }
}
