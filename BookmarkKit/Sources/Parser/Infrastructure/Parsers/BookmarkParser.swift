//
//  BookmarkParser.swift
//  
//
//  Created by Nikola Stojanovic on 14.12.20..
//
import Foundation
import AppModels

public struct BookmarkParser<Source, Output: Decodable> {
    
    public var parse: (Data) throws -> Output = {
        try PropertyListDecoder().decode(Output.self, from: $0)
    }

    public init() {}

    internal init(parser: @escaping (Data) throws -> Output) {
        self.parse = parser
    }
}

public extension BookmarkParser where Source == Safari, Output == SafariBookmarkList {

    func parseSafariPlist(
        at path: String = ("~/Library/Safari/Bookmarks.plist" as NSString).expandingTildeInPath,
        using fileManager: FileManager = .default
    ) throws -> SafariBookmarkList {
        guard let data = fileManager.contents(atPath: path) else { throw BookmarkParseError.invalidPath }
        return try parse(data)
    }
}

public struct Parser<Output: Decodable> {
    public var parse: (Data) throws -> Output

    public static var safari: Parser<SafariBookmarkList> {
        Parser<SafariBookmarkList> { output in
            let path = ("~/Library/Safari/Bookmarks.plist" as NSString).expandingTildeInPath
            guard let data = FileManager.default.contents(atPath: path) else { throw BookmarkParseError.invalidPath }
            return try PropertyListDecoder().decode(SafariBookmarkList.self, from: data)
        }
    }
}
