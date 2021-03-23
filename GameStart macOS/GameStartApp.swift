//
//  AppDelegate.swift
//  GameStart macOS
//
//  Created by  inna on 21/03/2021.
//

import SwiftUI

@main
struct GameStartApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewState: ViewState.default)
        }
    }
}
