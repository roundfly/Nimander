//
//  BookmarkListView.swift
//  Nimander
//
//  Created by Nikola Stojanovic on 15.12.20..
//

import SwiftUI
import BookmarkClient

struct BookmarkListView: View {
    let title: String
    let bookmarks: [Bookmark]
    @Binding var selectedBookmark: Bookmark?

    var body: some View {
        List(selection: $selectedBookmark) {
            ForEach(bookmarks) { bookmark in
                NavigationLink(
                    destination: BookmarkView(bookmark: bookmark),
                    tag: bookmark,
                    selection: $selectedBookmark,
                    label: {
                        VStack(alignment: .leading) {
                            Text(bookmark.title)
                            Text(bookmark.url?.absoluteString ?? "")
                        }
                    })
            }
        }
    }
}
