//
//  NimanderApp.swift
//  Nimander
//
//  Created by Nikola Stojanovic on 14.12.20..
//

import SwiftUI
import BookmarkClient

@available(macOS 12.0, *)
@main
struct NimanderApp: App {
    @StateObject private var viewModel: BookmarkViewModel = .production
    @Environment(\.dismiss) var dismiss

    var body: some Scene {
        WindowGroup {
                NavigationView {
                    BookmarkSidebar()
                    if let folder = viewModel.selectedFolder.wrappedValue {
                        BookmarkListView(bookmarks: viewModel.folders[folder, default: []])
                    }
                    if let bookmark = viewModel.selectedBookmark.wrappedValue {
                        BookmarkView(bookmark: bookmark)
                    }
                }
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
}
