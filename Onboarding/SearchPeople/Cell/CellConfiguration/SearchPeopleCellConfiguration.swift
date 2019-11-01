//
//  CellConfiguration.swift
//  Onboarding
//
//  Created by Ariel Congestri on 01/11/2019.
//  Copyright © 2019 Ariel Congestri. All rights reserved.
//

import Foundation

struct PersonCellConfiguration {
    var name: String?
    var image: String?

    public init(person: Person) {
        name = person.name
        image = person.image?.medium
    }
}
