//
//  CategoryMapper.swift
//  TeamworkSample
//
//  Created by Michel Barbou Salvador on 18/01/2018.
//  Copyright © 2018 Michel Barbou Salvador. All rights reserved.
//

import Foundation

struct CategoryEntryMapper: Mapper {
    typealias IN = CategoryResponse?
    typealias OUT = CategoryEntry?
    
    static func map(input: CategoryResponse?) -> CategoryEntry? {
        guard let id = input?.id,
            let name = input?.name,
            let color = input?.color else {
                return nil
        }
        let entry = CategoryEntry()
        entry.id = id
        entry.name = name
        entry.color = color
        return entry
    }
}
