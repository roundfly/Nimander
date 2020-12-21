//
//  BookmarkStore.swift
//  Nimander
//
//  Created by Nikola Stojanovic on 15.12.20..
//

import Foundation
import AppModels
import Core

final class BookmarkStore: ObservableObject {

    @Published var bookmarkFolders: [String: [Bookmark]] = [
        "All": {
            do {
                return try BookmarkParser<Safari, BookmarkList>().parseSafariPlist().all
            } catch {
                print(error)
            }
            return []
        }()
    ]
}
