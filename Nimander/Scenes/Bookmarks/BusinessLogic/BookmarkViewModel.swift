//
//  BookmarkStore.swift
//  Nimander
//
//  Created by Nikola Stojanovic on 15.12.20..
//

import BookmarkClient
import SwiftUI
import os.log

typealias BookmarkViewModel = Store<BookmarkState, BookmarkAction, BookmarkEnvironment>

private let loader = BookmarkClient()
private let logger = Logger(subsystem: "nimander", category: "bookmark")

final class Store<State, Action, Environment>: ObservableObject {
    // MARK: - Instance variables

    @Published private(set) var state: State
    private let environment: Environment
    private let reducer: Reducer<State, Action, Environment>

    // MARK: - Initialization

    init(state: State,
         environment: Environment,
         reducer: @escaping Reducer<State, Action, Environment>) {
        self.state = state
        self.environment = environment
        self.reducer = reducer
    }

    // MARK: - API

    func dispatch(_ action: Action) {
        reducer(&state, action, environment)
    }
}

extension BookmarkViewModel {

    static var production: BookmarkViewModel {
        let folders: Folders = [.safari: load(from: .safari), .google: load(from: .google)]
        let didFail: Bool = (folders[.safari]?.isEmpty == true) || (folders[.google]?.isEmpty == true)
        return Self(
            state: BookmarkState(folders: folders, requestAuthorization: didFail),
            environment: .production,
            reducer: bookmarkReducer
        )
    }

    var browsers: [Browser] {
        Browser.allCases
    }

    var selectedFolder: Binding<Browser?> {
        .init(
            get: { self.state.selectedFolder },
            set: { self.dispatch(.openFolder($0)) }
        )
    }

    var selectedBookmark: Binding<Bookmark?> {
        .init(
            get: { self.state.selectedBookmark },
            set: { self.dispatch(.openBookmark($0)) }
        )
    }

    var requestAuthorization: Binding<Bool> {
        .init(
            get: { self.state.requestAuthorization },
            set: { _ in self.dispatch(.requestAuthorization) }
        )
    }

    func openAuthorizationDialog() {
        dispatch(.requestAuthorization)
    }

    func openPrivacyAndSecurity() {
        dispatch(.openPrivacyAndSecurity)
    }

    private static func load(from source: BookmarkSource) -> [Bookmark] {
        do {
            return try loader.load(for: source)
        } catch {
            logger.debug("\(error.localizedDescription)")
        }
        return []
    }
}
