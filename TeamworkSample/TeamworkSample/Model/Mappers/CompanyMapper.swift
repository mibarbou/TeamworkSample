//
//  CompanyMapper.swift
//  TeamworkSample
//
//  Created by Michel Barbou Salvador on 18/01/2018.
//  Copyright © 2018 Michel Barbou Salvador. All rights reserved.
//

import Foundation

struct CompanyMapper: Mapper {
    typealias IN = CompanyResponse?
    typealias OUT = Company
    
    func map(input: CompanyResponse?) -> Company {
        let isOwner: Bool = (input?.isOwner ?? "") == "1" ? true: false
        return Company(id: input?.id ?? "",
                       name: input?.name ?? "",
                       isOwner: isOwner)
    }
}
