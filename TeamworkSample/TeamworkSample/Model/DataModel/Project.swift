//
//  Project.swift
//  TeamworkSample
//
//  Created by Michel Barbou Salvador on 18/01/2018.
//  Copyright © 2018 Michel Barbou Salvador. All rights reserved.
//

import Foundation

struct Project {
    let id:                 String
    let name:               String
    let description:        String
    let category:           Category?
    let company:            Company?
    let logo:               URL?
    let status:             String
}
