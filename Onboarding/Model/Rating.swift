//
//  Rating.swift
//  Onboarding
//
//  Created by Ariel Congestri on 30/10/2019.
//  Copyright © 2019 Ariel Congestri. All rights reserved.
//

import Foundation

struct Rating: Decodable {
    var average: Double?

    enum CodingKeys: String, CodingKey {
        case average = "average"
    }

    public init(average: Double?) {
        self.average = average
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.average = try? container.decode(Double.self, forKey: .average) 
    }
}
