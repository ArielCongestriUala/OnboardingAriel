//
//  CellConfiguration.swift
//  Onboarding
//
//  Created by Ariel Congestri on 31/10/2019.
//  Copyright © 2019 Ariel Congestri. All rights reserved.
//

import Foundation

struct EpisodeCellConfiguration {
    var name: String?
    var number: String?

    public init(from episode: Episode) {
        name = episode.name
        guard let number = episode.number else { return }
        self.number = "Number: \(number)"
    }
}
