//
//  BookmarkView.swift
//  Nimander
//
//  Created by Nikola Stojanovic on 15.12.20..
//

import SwiftUI
import AppKit
import WebKit
import AppModels

struct BookmarkView: View {
    let bookmark: Bookmark

    var body: some View {
        if let url = bookmark.url {
            BookmarkWebView(url: url)
        } else {
            Text("Could not perform request")
        }
    }
}

final class BookmarkWebView: NSViewRepresentable {

    private let request: URLRequest

    init(url: URL) {
        self.request = URLRequest(url: url)
    }

    func makeNSView(context: Context) -> WKWebView {
        let view = WKWebView(frame: .zero)
        view.load(request)
        return view
    }

    func updateNSView(_ nsView: WKWebView, context: Context) {
        
    }
}
