//
//  BookmarkClient.swift
//  
//
//  Created by Nikola Stojanovic on 7.1.22..
//

import Foundation
import UserNotifications
import AppKit

public enum BookmarkLoadingError: Error {
    case nonElevatedAccessControl
}

public struct BookmarkClient {
    // MARK: - Instance variables
    private let safariPath = "Library/Safari/Bookmarks.plist"
    private let googlePath = "Library/Application Support/Google/Chrome/Default/Bookmarks"
    private let fileManager: FileManager

    // MARK: - Initialization

    public init(fileManager: FileManager = .default) {
        self.fileManager = fileManager
    }

    // MARK: - API

    public func load(for source: BookmarkSource) throws -> [Bookmark] {
        let safariParser: Parser = .safari, googleParser: Parser = .google
        if source.contains(.google) && source.contains(.safari) {
            return try googleParser.parse(try readGoogleData()) + safariParser.parse(try readSafariData())
        }
        else if source.contains(.google) {
            return try googleParser.parse(try readGoogleData())
        }
        else if source.contains(.safari) {
            return try safariParser.parse(try readSafariData())
        }
        return []
    }

    // MARK: - Implementation details

    private func homeDirectory(with path: String) -> String {
        "\(NSHomeDirectory())/\(path)"
    }

    func readGoogleData() throws -> Data {
        guard let data = fileManager.contents(atPath: homeDirectory(with: googlePath)) else {
            throw BookmarkLoadingError.nonElevatedAccessControl
        }
        return data
    }

    func readSafariData() throws -> Data {
        guard let data = fileManager.contents(atPath: homeDirectory(with: safariPath)) else {
            throw BookmarkLoadingError.nonElevatedAccessControl
        }
        return data
    }
}
