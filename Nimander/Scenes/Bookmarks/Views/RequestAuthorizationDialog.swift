//
//  RequestAuthorizationView.swift
//  Nimander
//
//  Created by Nikola Stojanovic on 10.1.22..
//

import SwiftUI

@available(macOS 12.0, *)
struct RequestAuthorizationDialog: View {
    @EnvironmentObject var viewModel: BookmarkViewModel

    var body: some View {
        VStack(spacing: 40) {
            Text("Authorize Nimander")
                .font(.largeTitle)
                .foregroundColor(.white)
            Image(nsImage: .appIcon)
            Text("Nimander needs elevated privilages in order to\n access your Safari and Google bookmarks.")
            Text("Go to System Preferences -> Security & Privacy -> Privacy -> Full Disk Access")
            Button(action: viewModel.openPrivacyAndSecurity) {
                Text("Open System Preferences")
                    .font(.headline)
                    .foregroundColor(.white)
            }
            Text("Check Nimander.app")
                .foregroundColor(.white)
            Text("If the checkbox is disabled, click the\n padlock and enter your password.")
        }
        .font(.body)
        .foregroundColor(.gray)
        .padding()
        .multilineTextAlignment(.center)
    }
}
