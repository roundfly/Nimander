//
//  Bookmark.swift
//  
//
//  Created by Nikola Stojanovic on 7.1.22..
//

import Foundation

public struct Bookmark: Identifiable, Hashable {
    public var id: UUID
    public var title: String
    public var url: URL?
}

public struct BookmarkSource: OptionSet {
    public var rawValue: Int

    public init(rawValue: Int) {
        self.rawValue = rawValue
    }

    public static let safari = BookmarkSource(rawValue: 1 << 0)
    public static let google = BookmarkSource(rawValue: 1 << 1)
}
