//
//  File.swift
//  GameStart
//
//  Created by  inna on 23/03/2021.
//

import SwiftUI


struct ViewState {
    let menu: [MenuContent]
    let content: String
    
    static var `default`: ViewState {
        .init(
            menu: [
                .item(MenuItem(text: "Play", systemImage: "play", action: .Play)),
                .item(MenuItem(text: "Settings", systemImage: "calendar", action: .Settings)),
                .item(MenuItem(text: "Leaderboard", systemImage: "person.3", action: .Leaderboard))
            ],
            content: "Content")
    }
}

struct ContentView: View {
    @State var viewState: ViewState
    
    var body: some View {
        HStack(alignment: .top, spacing: 16) {
            NavigationView(content: {
                AppMenu(contents: viewState.menu) {
                    Image(systemName: "line.horizontal.3")
                }
            })
        }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        .padding()
    }
}
