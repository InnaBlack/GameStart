//
//  AppMenu.swift
//  GameStart macOS
//
//  Created by  inna on 22/03/2021.
//

import SwiftUI


struct AppMenuItem: View {
    var item: MenuItem
    var geom: CGSize
    
    @State var isLinkActive = false
    
    
    func dispatch(_ action: ViewEvent) -> some View {
        
        #if !os(watchOS)
            switch action {
            case .Play:
                return  SceneView(scene: GameScene.newPlayScene())
            case .Settings:
                return  SceneView(scene: GameScene.newSettingsScene())
            case .Leaderboard:
                return  SceneView(scene: GameScene.newLeaderboardScene())
            case .none:
                return  SceneView(scene: GameScene.newSettingsScene())
            }
        #else
           return Text("")
        #endif
        
    }
    
    init(item: MenuItem, geom: CGSize) {
        self.item = item
        self.geom = geom
    }
    
    var body: some View {
    
        NavigationLink(destination:self.dispatch(item.action ?? .none), isActive: $isLinkActive) {
            Button(action: {
                self.isLinkActive = true
            }) {
                item.systemImage.map { systemImage in
                    Image(systemName: systemImage)
                        .foregroundColor(.gray)
                        .imageScale(.large)
                }
                
                Text(item.text)
                    .font(.headline)
            }.frame(width: geom.width, height: geom.height/3 , alignment: .center)
           
        }
        
    }
}

struct AppSubmenu: View {
    let text: String
    let contents: [MenuContent]
    
    var body: some View {
        AppMenu(contents: contents) {
            HStack {
                Text(text)
                Image(systemName: "chevron.right")
            }
        }
    }
}

struct AppMenu<Label: View>: View {
    let label: () -> Label
    let contents: [MenuContent]
    
    init(contents: [MenuContent], @ViewBuilder label: @escaping () -> Label) {
        self.contents = contents
        self.label = label
    }
    
    var body: some View {
        GeometryReader(content: { geometry in
            VStack(alignment: .center) {
                ForEach(contents) { content in
                    // In case this is an item
                    if case let .item(item) = content {
                        
                        #if os(OSX)
                         
                        AppMenuItem(item: item, geom: CGSize(width: geometry.size.width, height:  40))
                        
                        #else
                        
                        AppMenuItem(item: item, geom: geometry.size)

                        #endif
                    }
                    // In case this is a submenu
                    if case let .submenu(text, contents) = content {
                        AppSubmenu(text: text, contents: contents)
                    }
                }
            }
        })
    }
}

