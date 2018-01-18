//
//  Mapper.swift
//  TeamworkSample
//
//  Created by Michel Barbou Salvador on 18/01/2018.
//  Copyright © 2018 Michel Barbou Salvador. All rights reserved.
//

import Foundation

protocol Mapper {
    associatedtype IN
    associatedtype OUT
    func map(input: IN) -> OUT
}
