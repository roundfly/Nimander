//
//  NimanderApp.swift
//  Nimander
//
//  Created by Nikola Stojanovic on 14.12.20..
//

import SwiftUI
import AppModels

@main
struct NimanderApp: App {

    @StateObject var store = BookmarkStore()
    @State private var selectedFolder: String? = "All"
    @State private var selectedBookmark: Bookmark?

    var body: some Scene {
        WindowGroup {
            NavigationView {
                BookmarkSidebar(store: store,
                                selectedFolder: $selectedFolder,
                                selectedBookmark: $selectedBookmark)
                if let folder = selectedFolder {
                    BookmarkListView(title: folder,
                                     bookmarks: store.bookmarkFolders[folder, default: []],
                                     selectedBookmark: $selectedBookmark)
                }
                if let bookmark = selectedBookmark {
                    BookmarkView(bookmark: bookmark)
                }

            }
        }.commands {
            SidebarCommands()
        }
    }
}
