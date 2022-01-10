//
//  BookmarkListView.swift
//  Nimander
//
//  Created by Nikola Stojanovic on 15.12.20..
//

import SwiftUI
import BookmarkClient

@available(macOS 12.0, *)
struct BookmarkListView: View {
    @EnvironmentObject var viewModel: BookmarkViewModel
    let bookmarks: [Bookmark]

    var body: some View {
        List(selection: viewModel.selectedBookmark) {
            ForEach(bookmarks) { bookmark in
                NavigationLink(
                    destination: BookmarkView(bookmark: bookmark),
                    tag: bookmark,
                    selection: viewModel.selectedBookmark,
                    label: {
                        VStack(alignment: .leading) {
                            title(of: bookmark)
                        }
                    })
            }
        }
    }

    private func title(of bookmark: Bookmark) -> some View {
        Text(bookmark.title)
            .font(.title2)
            .multilineTextAlignment(.leading)
            .padding()
    }
}
