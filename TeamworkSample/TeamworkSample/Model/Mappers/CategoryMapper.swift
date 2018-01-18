//
//  CategoryMapper.swift
//  TeamworkSample
//
//  Created by Michel Barbou Salvador on 18/01/2018.
//  Copyright © 2018 Michel Barbou Salvador. All rights reserved.
//

import Foundation

struct CategoryMapper: Mapper {
    typealias IN = CategoryResponse?
    typealias OUT = Category
    
    func map(input: CategoryResponse?) -> Category {
        return Category(id: input?.id ?? "",
                        name: input?.name ?? "",
                        color: input?.color ?? "")
    }
}
