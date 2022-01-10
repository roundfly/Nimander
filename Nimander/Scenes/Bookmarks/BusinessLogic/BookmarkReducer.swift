//
//  BookmarkReducer.swift
//  Nimander
//
//  Created by Nikola Stojanovic on 8.1.22..
//

typealias Reducer<State, Action, Environment> = (inout State, Action, Environment) -> Void

let bookmarkReducer: Reducer<BookmarkState, BookmarkAction, BookmarkEnvironment> = { state, action, env in
    switch action {
    case .openBookmark(let bookmark):
        state.selectedBookmark = bookmark
    case .openFolder(let folder):
        state.selectedFolder = folder
    case .requestAuthorization:
        state.requestAuthorization = true
    case .openPrivacyAndSecurity:
        state.requestAuthorization = false
        env.opener.open(.securityAndPrivacy)
    }
}
