//
//  URLOpener.swift
//  Nimander
//
//  Created by Nikola Stojanovic on 8.1.22..
//

import Foundation
import AppKit

struct URLOpener {
    // MARK: - API

    var open: (_ url: URL) -> Void

    static var production: URLOpener {
        Self { NSWorkspace.shared.open($0) }
    }
}
