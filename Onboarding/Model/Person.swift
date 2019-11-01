//
//  People.swift
//  Onboarding
//
//  Created by Ariel Congestri on 01/11/2019.
//  Copyright © 2019 Ariel Congestri. All rights reserved.
//

import Foundation

struct Person: Decodable {
    var id: Int?
    var name: String?
    var image: ImageURL?

    enum CodingKeys: String, CodingKey {
        case id = "id", name = "name", image = "image"
    }

    public init(id: Int?, name: String?, imageURL: ImageURL ) {
        self.id = id
        self.name = name
        self.image = imageURL
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.id = try? container.decode(Int.self, forKey: .id)
        self.name = try? container.decode(String.self, forKey: .name)
        self.image = try? container.decode(ImageURL.self, forKey: .image)
    }
}
