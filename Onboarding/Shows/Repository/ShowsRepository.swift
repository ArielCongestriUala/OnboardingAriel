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
        APIManager.executeArray(Request: RequestBuilder.getShows(page)).done { (shows: [Show]) in
            completion(shows)
        }
    }
}
