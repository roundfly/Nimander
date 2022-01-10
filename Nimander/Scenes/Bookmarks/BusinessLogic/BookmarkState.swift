//
//  BookmarkState.swift
//  Nimander
//
//  Created by Nikola Stojanovic on 8.1.22..
//

import BookmarkClient

// MARK- Utiliy types

typealias Folders = [Browser: [Bookmark]]

/// App state
struct BookmarkState {
    var folders: Folders
    var selectedFolder: Browser?
    var selectedBookmark: Bookmark?
    var requestAuthorization = false
}
