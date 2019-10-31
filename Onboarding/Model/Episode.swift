//
//  Episode.swift
//  Onboarding
//
//  Created by Ariel Congestri on 31/10/2019.
//  Copyright © 2019 Ariel Congestri. All rights reserved.
//

import Foundation

struct Episode: Decodable {
    var number: Int?
    var name: String?
    var season: Int?

    enum CodingKeys: String, CodingKey {
        case number = "number", name = "name", season = "season"
    }

    public init(number: Int?, name: String?, season: Int?) {
        self.number = number
        self.name = name
        self.season = season
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.number = try? container.decode(Int.self, forKey: .number)
        self.name = try? container.decode(String.self, forKey: .name)
        self.season = try? container.decode(Int.self, forKey: .season)
    }

}
