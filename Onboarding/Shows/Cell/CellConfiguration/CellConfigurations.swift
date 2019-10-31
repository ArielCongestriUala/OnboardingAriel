//
//  CellConfigurations.swift
//  Onboarding
//
//  Created by Ariel Congestri on 30/10/2019.
//  Copyright © 2019 Ariel Congestri. All rights reserved.
//

import Foundation
import UIKit

struct ShowCellConfiguration {
    var name: String?
    var image: String?
    var rating: String?

    init(from show: Show) {
        name = show.name
        image = show.image?.medium
        guard let average = show.rating?.average else { return }
        rating = "\(average)"
    }
}
