//
//  Show.swift
//  Onboarding
//
//  Created by Ariel Congestri on 30/10/2019.
//  Copyright © 2019 Ariel Congestri. All rights reserved.
//

import Foundation

struct Show: Decodable {
    var id: Int?
    var name: String?
    var summary: String?
    var rating: Rating?
    var image: ImageURL?

    enum CodingKeys: String, CodingKey {
        case id = "id", name = "name", summary = "summary", rating = "rating", image = "image"
    }

    public init(id: Int?, name: String?, summary: String?, rating: Rating, imageURL: ImageURL ) {
        self.id = id
        self.name = name
        self.image = imageURL
        self.rating = rating
        self.summary = summary
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.id = try? container.decode(Int.self, forKey: .id)
        self.name = try? container.decode(String.self, forKey: .name)
        self.summary = try? container.decode(String.self, forKey: .summary)
        self.image = try? container.decode(ImageURL.self, forKey: .image)
        self.rating = try? container.decode(Rating.self, forKey: .rating)
    }
}
