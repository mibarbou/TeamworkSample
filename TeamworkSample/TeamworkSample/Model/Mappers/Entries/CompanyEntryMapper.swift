//
//  CompanyMapper.swift
//  TeamworkSample
//
//  Created by Michel Barbou Salvador on 18/01/2018.
//  Copyright © 2018 Michel Barbou Salvador. All rights reserved.
//

import Foundation

struct CompanyEntryMapper: Mapper {
    typealias IN = CompanyResponse?
    typealias OUT = CompanyEntry?
    
    static func map(input: CompanyResponse?) -> CompanyEntry? {
        guard let id = input?.id,
            let name = input?.name,
            let isOwner = input?.isOwner else {
                return nil
        }
        let entry = CompanyEntry()
        entry.id = id
        entry.name = name
        entry.isOwner = isOwner
        return entry
    }    
}
