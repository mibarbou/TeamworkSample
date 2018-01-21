//
//  APIClient.swift
//  TeamworkSample
//
//  Created by Michel Barbou Salvador on 18/01/2018.
//  Copyright © 2018 Michel Barbou Salvador. All rights reserved.
//

import Foundation
import Alamofire

class APIClient {
    fileprivate static let manager: SessionManager = {
        return Alamofire.SessionManager.default
    }()
    fileprivate static let headers = ["Content-type": "application/x-www-form-urlencoded"]
    
    fileprivate static func request(endpoint: Endpoint,
                                    success: @escaping ([String : Any])->(),
                                    fail: @escaping (ApiError)->()) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        let _ = APIClient.manager.request(endpoint.path,
                                          method: endpoint.method,
                                          parameters: endpoint.parameters,
                                          encoding: URLEncoding.default,
                                          headers: headers)
            .authenticate(user: APISettings.username,
                          password: APISettings.password)
            .responseJSON { response in
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
                switch response.result {
                case .success(let json):
                    debugPrint(json)
                    guard let theJson = json as? [String : Any] else {
                        fail(.parser)
                        return
                    }
                    guard let apiResponse = ApiResponse(json: theJson),
                        apiResponse.status == "OK" else {
                            fail(.server)
                            return
                    }
                    success(theJson)
                case .failure(let error):
                    print("Request failed with error: \(error)")
                    if let errorCode = response.error?._code,
                        Int(errorCode) == -1009{
                        fail(ApiError.noConnection)
                    } else {
                        fail(ApiError.unknown)
                    }
                }
        }
    }
}

//MARK: - Public
extension APIClient {
    public static func projects(status: ProjectStatus = .all,
                                success: @escaping (ProjectsResponse)->(),
                                fail: @escaping (ApiError)->()) {
        self.request(endpoint: .projects(status: status),
                     success: { response in
                        if let projectsResponse = ProjectsResponse(json: response) {
                            success(projectsResponse)
                            return
                        }
                        fail(.parser)
        }) { error in
            fail(error)
        }
    }
    
    public static func project(id: String,
                               success: @escaping (ProjectResponse)->(),
                               fail: @escaping (ApiError)->()) {
        self.request(endpoint: .project(id: id),
                     success: { response in
                        if let projectResponse = ProjectResponse(json: response) {
                            success(projectResponse)
                            return
                        }
                        fail(.parser)
        }) { error in
            fail(error)
        }
    }
    
    public static func latestActivities(projectId: String,
                                        success: @escaping (ActivityListResponse)->(),
                                        fail: @escaping (ApiError)->()) {
        self.request(endpoint: .latestActivity(projectId: projectId),
                     success: { response in
                        if let activityListResponse = ActivityListResponse(json: response) {
                            success(activityListResponse)
                            return
                        }
                        fail(.parser)
        }) { error in
            fail(error)
        }
    
    }
}














