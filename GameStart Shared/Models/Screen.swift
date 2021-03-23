//
//  Screen.swift
//  GameStart iOS
//
//  Created by  inna on 22/03/2021.
//

import SpriteKit

struct Screen {
    static var scale: CGFloat {
        #if os(iOS) || os(tvOS) || os(watchOS)
        return UIScreen.main.scale
        #elseif os(OSX)
        return  NSScreen.main?.backingScaleFactor ?? 1
        #endif
    }
    
    static var tileSize: CGSize {
        #if os(iOS) || os(tvOS) || os(watchOS)
        return CGSize(width: 128, height: 128)
        #elseif os(OSX)
        return CGSize(width: 128, height: 128)
        #endif
    }
}
