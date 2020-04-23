//
//  FeatureInstance.swift
//  FeatureFlagTest
//
//  Created by Chrystian on 19/02/20.
//  Copyright © 2020 Salgado Solutions. All rights reserved.
//

import Foundation

// - Shared instance to hold available features -

class FeatureShared: NSObject {
    static let shared = FeatureShared()
    private var features: [Feature] = []
    
    func addNewFeature(featuring: Feature) {
        if !features.contains(featuring) {
            features.append(featuring)
        } else {
            features = features.filter { (feature) -> Bool in
                feature.key != featuring.key
            }
            
            addNewFeature(featuring: featuring)
        }
    }
    
    func verifyFeature(myFeature: RegistredFeatures) -> Feature? {
        let a = features.filter { (feature) -> Bool in
            feature.key == myFeature.key
        }
        
        return a.isEmpty ? nil : a.first
    }
}
