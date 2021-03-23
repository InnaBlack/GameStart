//
//  SKTileGroup.swift
//  GameStart iOS
//
//  Created by  inna on 22/03/2021.
//

import Foundation
import SpriteKit

extension SKTileGroup {
    convenience init(sheet: SpriteSheet, thirteenRules: [(adjacency: SKTileAdjacencyMask, tiles: [Tiles])]) {
        self.init(rules:
            thirteenRules.map {
                SKTileGroupRule(sheet: sheet, adjacency: $0.adjacency, tiles: $0.tiles)
            }
        )
    }
}

