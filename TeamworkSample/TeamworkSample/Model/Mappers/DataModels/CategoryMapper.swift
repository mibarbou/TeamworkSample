//
//  CategoryMapper.swift
//  TeamworkSample
//
//  Created by Michel Barbou Salvador on 20/01/2018.
//  Copyright © 2018 Michel Barbou Salvador. All rights reserved.
//

import Foundation

struct CategoryMapper: Mapper {
    typealias IN = CategoryEntry?
    typealias OUT = Category?
    
    static func map(input: CategoryEntry?) -> Category? {
        guard let category = input else {
            return nil
        }
        return Category(id: category.id,
                        name: category.name,
                        color: category.color)
    }
}
