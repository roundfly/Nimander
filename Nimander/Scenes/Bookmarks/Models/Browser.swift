//
//  Browser.swift
//  Nimander
//
//  Created by Nikola Stojanovic on 8.1.22..
//

struct Folder: Hashable {
    var name: String
    var icon: String

    static let google = Self(name: "Google", icon: "g.circle")
    static let safari = Self(name: "Safari", icon: "safari")
}

enum Browser: String, CaseIterable, Identifiable {
    case safari, google

    var id: String {
        rawValue
    }

    var name: String {
        rawValue.capitalized
    }

    var symbolName: String {
        switch self {
        case .safari:
            return rawValue
        case .google:
            return "g.circle"
        }
    }
}
