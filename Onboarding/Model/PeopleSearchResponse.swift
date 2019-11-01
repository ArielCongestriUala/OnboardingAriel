//
//  PeopleSearchResponse.swift
//  Onboarding
//
//  Created by Ariel Congestri on 01/11/2019.
//  Copyright © 2019 Ariel Congestri. All rights reserved.
//

import Foundation

struct PeopleSearchResponse: Decodable {
        var person: Person

    enum CodingKeys: String, CodingKey {
        case person = "person"
    }

    public init(person: Person) {
        self.person = person
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.person = (try? container.decode(Person.self, forKey: .person)) ?? Person(id: 0, name: nil, imageURL: ImageURL(original: nil, medium: nil))
    }

}
