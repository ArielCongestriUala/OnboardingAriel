//
//  ShowDetailRepository.swift
//  Onboarding
//
//  Created by Ariel Congestri on 31/10/2019.
//  Copyright © 2019 Ariel Congestri. All rights reserved.
//

import Foundation

class ShowDetailRepository {
    class func getEpisodes(id: Int, completion:  @escaping (([Episode])-> Void) ){
        APIManager.executeArray(Request: RequestBuilder.getEpisodes(id), type: Episode.self).done { (episodes: [Episode]) in
            completion(episodes)
        }
    }
}
