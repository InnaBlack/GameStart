//
//  Bundle.swift
//  GameStart iOS
//
//  Created by  inna on 22/03/2021.
//

import Foundation

extension Bundle {
    var applicationName: String {
        return Bundle.main.infoDictionary?["CFBundleName"] as? String ?? ""
    }

    var bundleVersion: String? {
        return Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
    }
    
    var bundleApplicationId: String? {
        return Bundle.main.infoDictionary?["ApplicationId"] as? String
    }
}
