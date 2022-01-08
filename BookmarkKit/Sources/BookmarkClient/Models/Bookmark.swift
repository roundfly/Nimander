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
