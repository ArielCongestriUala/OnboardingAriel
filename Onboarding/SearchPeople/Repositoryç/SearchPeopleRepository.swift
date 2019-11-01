//
//  SearchPeopleRepository.swift
//  Onboarding
//
//  Created by Ariel Congestri on 01/11/2019.
//  Copyright © 2019 Ariel Congestri. All rights reserved.
//

import Foundation
import PromiseKit

class SearchPeopleRepository {

    class func searhPeople(query: String) -> Promise<[PeopleSearchResponse]> {
        return APIManager.executeArray(Request: RequestBuilder.shearchPeople(query), type: PeopleSearchResponse.self)
    }
}
