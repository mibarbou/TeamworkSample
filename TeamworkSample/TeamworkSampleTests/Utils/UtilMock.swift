//
//  UtilMock.swift
//  TeamworkSampleTests
//
//  Created by Michel Barbou Salvador on 22/01/2018.
//  Copyright © 2018 Michel Barbou Salvador. All rights reserved.
//

import Foundation

struct UtilMock {
    static func readJson(fileName: String) -> [String: Any]? {
        do {
            if let file = Bundle(for: MappersTests.self).url(forResource: fileName, withExtension: "json") {
                let data = try Data(contentsOf: file)
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                if let object = json as? [String: Any] {
                    // json is a dictionary
                    //print(object)
                    return object
                } else if let _ = json as? [Any] {
                    // json is an array
                    //print(object)
                    return nil
                } else {
                    //print("JSON is invalid")
                    return nil
                }
            } else {
                return nil
            }
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
}
