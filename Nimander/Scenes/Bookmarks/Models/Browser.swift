//
//  Browser.swift
//  Nimander
//
//  Created by Nikola Stojanovic on 8.1.22..
//

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
