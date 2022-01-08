//
//  BookmarkClient.swift
//  
//
//  Created by Nikola Stojanovic on 7.1.22..
//

import Foundation

public struct BookmarkSource: OptionSet {
    public var rawValue: Int

    public init(rawValue: Int) {
        self.rawValue = rawValue
    }

    public static let safari = BookmarkSource(rawValue: 1 << 0)
    public static let google = BookmarkSource(rawValue: 1 << 1)
}

public struct BookmarkClient {

    private let safariPath = "Library/Safari/Bookmarks.plist"
    private let googlePath = "Library/Application Support/Google/Chrome/Default/Bookmarks"
    private let fileManager: FileManager

    private var googleData: Data {
        guard let data = fileManager.contents(atPath: homeDirectory(with: googlePath)) else { preconditionFailure() }
        return data
    }

    private var safariData: Data {
        guard let data = fileManager.contents(atPath: homeDirectory(with: safariPath)) else { preconditionFailure() }
        return data
    }

    public init(fileManager: FileManager = .default) {
        self.fileManager = fileManager
    }

    public func load(for source: BookmarkSource) throws -> [Bookmark] {
        let safariParser: Parser = .safari
        let googleParser: Parser = .google
        if source.contains(.google) && source.contains(.safari) {
            return try googleParser.parse(googleData) + safariParser.parse(safariData)
        }
        else if source.contains(.google) {
            return try googleParser.parse(googleData)
        }
        else if source.contains(.safari) {
            return try safariParser.parse(safariData)
        }
        return []
    }

    private func homeDirectory(with path: String) -> String {
        "\(NSHomeDirectory())/\(path)"
    }
}
