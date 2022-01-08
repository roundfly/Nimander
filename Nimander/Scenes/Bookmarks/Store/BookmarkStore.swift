//
//  BookmarkStore.swift
//  Nimander
//
//  Created by Nikola Stojanovic on 15.12.20..
//

import Foundation
import BookmarkClient

final class BookmarkStore: ObservableObject {

    var browsers: [String] {
        Array(bookmarkFolders.keys)
    }

    @Published var bookmarkFolders: [String: [Bookmark]] = [
        "Safari": {
            do {
                return try BookmarkClient().load(for: .safari)
            } catch {
                print(error)
            }
            return []
        }(),
        "Google": {
            do {
                return try BookmarkClient().load(for: .google)
            } catch {
                print(error)
            }
            return []
        }()
    ]

    func addFolder() {
        
    }
}
