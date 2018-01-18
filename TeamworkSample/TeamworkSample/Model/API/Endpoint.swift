//
//  Endpoint.swift
//  TeamworkSample
//
//  Created by Michel Barbou Salvador on 18/01/2018.
//  Copyright © 2018 Michel Barbou Salvador. All rights reserved.
//

import Foundation
import Alamofire

enum Endpoint {
    case projects(status: ProjectStatus)
    case project(id: String)
}

//MARK: - method
extension Endpoint {
    var method: Alamofire.HTTPMethod {
        switch self {
        case .projects, .project:
            return .get
        }
    }
}

//MARK: - path
extension Endpoint {
    var path: String {
        switch self {
        case .projects:
            return APISettings.baseURL + "/projects.json"
        case let .project(id: id):
            return APISettings.baseURL + "/projects/\(id).json"
        }
    }
}

//MARK: - parameters
extension Endpoint {
    var parameters: [String : String] {
        switch self {
        case let .projects(status: s):
            return ["status": s.rawValue]
        case .project:
            return [:]
        }
    }
}
