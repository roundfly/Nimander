//
//  BookmarkSidebar.swift
//  Nimander
//
//  Created by Nikola Stojanovic on 15.12.20..
//

import SwiftUI
import BookmarkClient

@available(macOS 12.0, *)
struct BookmarkSidebar: View {
    @EnvironmentObject var viewModel: BookmarkViewModel

    var body: some View {
        List(selection: viewModel.selectedFolder) {
            Section("Browsers") {
                ForEach(viewModel.browsers) { browser in
                    NavigationLink(
                        destination: BookmarkListView(bookmarks: viewModel.state.folders[browser, default: []]),
                        label: {
                            Label(browser.name, systemImage: browser.symbolName).font(.headline)
                        })
                }
            }
            .listItemTint(.red)
        }
        .listStyle(SidebarListStyle())
    }
}
