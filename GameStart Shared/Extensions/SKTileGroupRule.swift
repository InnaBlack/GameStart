//
//  SKTileGroupRule.swift
//  GameStart iOS
//
//  Created by  inna on 22/03/2021.
//

import Foundation
import SpriteKit

typealias Tiles = (frames: [(column: Int, row: Int)], placementWeight: Int)

extension SKTileGroupRule {
    convenience init(sheet: SpriteSheet, adjacency: SKTileAdjacencyMask, tiles: [Tiles], timePerFrame: CGFloat = 1.0) {
        self.init(adjacency: adjacency,
                  tileDefinitions: tiles.compactMap {
                    if $0.frames.count > 1 {
                    return SKTileDefinition(sheet: sheet,
                                            textures: $0.frames,
                                            timePerFrame: timePerFrame,
                                            placementWeight: $0.placementWeight)
                    } else if let first = $0.frames.first {
                        return SKTileDefinition(sheet: sheet,
                                                column: first.column,
                                                row: first.row,
                                                placementWeight: $0.placementWeight)
                    }
                    fatalError("Sprites frames is empty")
        })
    }
}
