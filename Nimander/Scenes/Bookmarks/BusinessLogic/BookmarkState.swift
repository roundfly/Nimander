//
//  BookmarkState.swift
//  Nimander
//
//  Created by Nikola Stojanovic on 8.1.22..
//

import BookmarkClient

// MARK- Utiliy types

typealias Folders = [Browser: [Bookmark]]

extension Folders {
    var areIncomplete: Bool {
        self[.safari]?.isEmpty == true || self[.google]?.isEmpty == true
    }
}

/// App state
struct BookmarkState {
    var folders: Folders
    var selectedFolder: Browser?
    var selectedBookmark: Bookmark?
    var requestAuthorization = false
}
