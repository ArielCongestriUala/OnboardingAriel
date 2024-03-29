//
//  RequestBuilder.swift
//  Onboarding
//
//  Created by Ariel Congestri on 30/10/2019.
//  Copyright © 2019 Ariel Congestri. All rights reserved.
//

import Foundation
import Alamofire

enum RequestBuilder: URLRequestConvertible {
    case getShows(Int)

    var path: String {
        switch self {
        case .getShows(_):
            return "shows"
        }
    }

    var parameters: [String : Any]? {
        switch self {
        case .getShows(let page):
            return ["page": page]
        }
    }

    func asURLRequest() throws -> URLRequest {
        let urlString = APIConstants.baseURL
        let url = try urlString.asURL()
        
        var request = URLRequest(url: url.appendingPathComponent(path))
        
        request.httpMethod = HTTPMethod.get.rawValue
        return try URLEncoding.default.encode(request, with: parameters)
    }
}
