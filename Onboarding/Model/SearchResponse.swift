//
//  SearchResponse.swift
//  Onboarding
//
//  Created by Ariel Congestri on 31/10/2019.
//  Copyright © 2019 Ariel Congestri. All rights reserved.
//

import Foundation

struct SearchResponse: Decodable {
    var show: Show

    enum CodingKeys: String, CodingKey {
        case show = "show"
    }

    public init(show: Show) {
        self.show = show
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.show = (try? container.decode(Show.self, forKey: .show)) ?? Show(id: 0, name: nil, summary: nil, rating: Rating(average: nil), imageURL: ImageURL(original: nil, medium: nil))
    }
}
