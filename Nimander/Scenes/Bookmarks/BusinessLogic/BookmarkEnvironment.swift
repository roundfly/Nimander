//
//  BookmarkEnvironment.swift
//  Nimander
//
//  Created by Nikola Stojanovic on 10.1.22..
//

import Foundation

struct BookmarkEnvironment {
    var opener: URLOpener

    static var production: BookmarkEnvironment {
        Self(opener: .production)
    }
}
