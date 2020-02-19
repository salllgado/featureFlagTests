//
//  DictionaryExtensions.swift
//  FeatureFlagTest
//
//  Created by Chrystian on 19/02/20.
//  Copyright © 2020 Salgado Solutions. All rights reserved.
//

import Foundation

extension Dictionary {
    
    public func convertToJsonData() throws -> Data {
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: self, options: [])
            return jsonData
            
        } catch {
            throw error
        }
    }
    
    public func convertTojsonValue() throws -> String? {
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: self, options: [])
            let jsonValue = String(data: jsonData, encoding: .utf8)
            return jsonValue
        } catch {
            throw error
        }
    }
}
