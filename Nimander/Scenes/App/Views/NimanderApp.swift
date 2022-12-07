//
//  NimanderApp.swift
//  Nimander
//
//  Created by Nikola Stojanovic on 14.12.20..
//

import SwiftUI
import BookmarkClient

@main
struct NimanderApp: App {
    @StateObject private var viewModel: BookmarkViewModel = .production
    @State private var visibility: NavigationSplitViewVisibility = .all
    @Environment(\.dismiss) var dismiss

    var body: some Scene {
        WindowGroup {
            splitView
                .sheet(isPresented: viewModel.requestAuthorization,
                       onDismiss: { dismiss() },
                       content: RequestAuthorizationDialog.init)
                .environmentObject(viewModel)

        }
        .windowStyle(HiddenTitleBarWindowStyle())
        .commands {
            SidebarCommands()
        }
    }

    private var splitView: some View {
        NavigationSplitView(columnVisibility: $visibility) {
            BookmarkSidebar()
        } content: {
            if let folder = viewModel.selectedFolder.wrappedValue {
                BookmarkListView(bookmarks: viewModel.folders[folder, default: []])
            }
        } detail: {
            if let bookmark = viewModel.selectedBookmark.wrappedValue {
                BookmarkView(bookmark: bookmark)
            }
        }

    }
}
