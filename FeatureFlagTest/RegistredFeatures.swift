//
//  RegistredFeatures.swift
//  FeatureFlagTest
//
//  Created by Chrystian on 19/02/20.
//  Copyright © 2020 Salgado Solutions. All rights reserved.
//

import Foundation

enum RegistredFeatures {
    case chatbot
    case programador
}

extension RegistredFeatures {
    var key: String {
        switch self {
        case .chatbot:
            return "chatbot"
        default:
            return ""
        }
    }
    
    var available: Bool {
        let isAvailable: Bool = FeatureShared.shared.verifyFeature(myFeature: self)?.available ?? false
        return isAvailable
    }
    
}
