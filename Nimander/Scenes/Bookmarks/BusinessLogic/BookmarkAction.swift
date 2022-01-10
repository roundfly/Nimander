//
//  BookmarkAction.swift
//  Nimander
//
//  Created by Nikola Stojanovic on 8.1.22..
//

import BookmarkClient

enum BookmarkAction {
    case openFolder(Browser?)
    case openBookmark(Bookmark?)
    case requestAuthorization
    case openPrivacyAndSecurity
}
