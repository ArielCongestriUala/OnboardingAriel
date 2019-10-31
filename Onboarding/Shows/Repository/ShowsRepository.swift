//
//  File.swift
//  Onboarding
//
//  Created by Ariel Congestri on 29/10/2019.
//  Copyright © 2019 Ariel Congestri. All rights reserved.
//

import Foundation
import PromiseKit

class ShowsRepository {
    class func getSwhows(page: Int, completion:  @escaping (([Show])-> Void) ){
        APIManager.executeArray(Request: RequestBuilder.getShows(page), type: Show.self).done { (shows: [Show]) in
            completion(shows)
        }
    }

    class func searchShow(query: String, completion:  @escaping (([Show])-> Void)) {
        APIManager.search(Request: RequestBuilder.searchShow(query)).done { (shows) in
            completion(shows)
        }
    }
}
