//
//  Feature.swift
//  FeatureFlagTest
//
//  Created by Chrystian on 19/02/20.
//  Copyright © 2020 Salgado Solutions. All rights reserved.
//

import Foundation

struct FeatureResponse: Decodable {
    let features: [Feature]
}

struct Feature {
    let key: String
    let explanation: String
    let available: Bool
    
    init(key: String, explanation: String, available: Bool) {
        self.key = key
        self.explanation = explanation
        self.available = available
    }
    
    enum CodingKeys: String, CodingKey {
        case key
        case explanation
        case available
    }
}

extension Feature: Decodable {
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        key = try values.decode(String.self, forKey: .key)
        explanation = try values.decode(String.self, forKey: .explanation)
        available = try values.decode(Bool.self, forKey: .available)
        
        FeatureShared.shared.addNewFeature(featuring: self)
    }
}


extension Feature: Equatable {
    
    static func ==(lhs: Feature, rhs: Feature) -> Bool {
        return lhs.key == rhs.key
    }
}
