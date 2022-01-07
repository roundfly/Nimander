//
//  BookmarkStore.swift
//  Nimander
//
//  Created by Nikola Stojanovic on 15.12.20..
//

import Foundation
import AppModels
import Parser

final class BookmarkStore: ObservableObject {

    @Published var bookmarkFolders: [String: [SafariBookmark]] = [
        "Safari": {
            do {
                return try BookmarkParser<Safari, SafariBookmarkList>().parseSafariPlist().all
            } catch {
                print(error)
            }
            return []
        }()
    ]

    func addFolder() {
        
    }
}
