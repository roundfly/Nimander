//
//  BookmarkSidebar.swift
//  Nimander
//
//  Created by Nikola Stojanovic on 15.12.20..
//

import SwiftUI
import BookmarkClient

struct BookmarkSidebar: View {

    @ObservedObject var store: BookmarkStore
    @Binding var selectedFolder: String?
    @Binding var selectedBookmark: Bookmark?

    var body: some View {
        List(selection: $selectedFolder) {
            ForEach(Array(store.browsers), id: \.self) { title in
                NavigationLink(
                    destination: BookmarkListView(
                        title: title,
                        bookmarks: store.bookmarkFolders[title, default: []],
                        selectedBookmark: $selectedBookmark
                    ),
                    label: {
                        Label(title, systemImage: "bookmark").font(.headline)
                    })
            }
            .listItemTint(Color.red)
        }
        .listStyle(SidebarListStyle())
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Button(action: store.addFolder, label: {
                    Image(systemName: "plus")
                        .foregroundColor(.red)
                })
            }
        }
    }
}
