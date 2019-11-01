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
    case getShows(Int), searchShow(String), getEpisodes(Int), shearchPeople(String), getPeopleDetail(Int)

    var path: String {
        switch self {
        case .getShows(_):
            return "shows"
        case .searchShow(_):
            return "search/shows"
        case .getEpisodes(let id):
            return "shows/\(id)/episodes"
        case .shearchPeople(_):
            return "search/people"
        case .getPeopleDetail(let id):
            return "people/\(id)/crewcredits"
        }
    }

    var parameters: [String : Any]? {
        switch self {
        case .getShows(let page):
            return ["page" : page]
        case .searchShow(let query):
            return ["q" : query]
        case .getEpisodes(_):
            return nil
        case .shearchPeople(let query):
            return ["q" : query]
        case .getPeopleDetail(_):
            return ["embebed" : "show"]
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
