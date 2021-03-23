//
//  Menu.swift
//  GameStart macOS
//
//  Created by  inna on 22/03/2021.
//

import SwiftUI



enum ViewEvent {
    case Play
    case Settings
    case Leaderboard
    case none
}

struct MenuItem: Identifiable {
   var id: String { return text }
   let text: String
   let systemImage: String?
   let action: ViewEvent?
}

enum MenuContent: Identifiable {
   var id: String {
       switch self {
       case let .item(item): return item.id
       case let .submenu(text, _): return text
       }
   }

   case item(MenuItem)
   indirect case submenu(text: String, content: [MenuContent])
}

