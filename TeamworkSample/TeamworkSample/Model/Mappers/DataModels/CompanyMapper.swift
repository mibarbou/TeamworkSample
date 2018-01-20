//
//  CompanyMapper.swift
//  TeamworkSample
//
//  Created by Michel Barbou Salvador on 20/01/2018.
//  Copyright © 2018 Michel Barbou Salvador. All rights reserved.
//

import Foundation

struct CompanyMapper: Mapper {
    typealias IN = CompanyEntry?
    typealias OUT = Company?
    
    static func map(input: CompanyEntry?) -> Company? {
        guard let company = input else {
            return nil
        }
        return Company(id: company.id,
                       name: company.name,
                       isOwner: company.isOwner == "1" ? true: false)
    }
}
