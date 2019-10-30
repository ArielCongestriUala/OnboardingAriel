//
//  Image.swift
//  Onboarding
//
//  Created by Ariel Congestri on 30/10/2019.
//  Copyright © 2019 Ariel Congestri. All rights reserved.
//

import Foundation

struct ImageURL: Decodable {
    var medium: String?
    var original: String?

    enum CodingKeys: String, CodingKey {
        case medium = "medium", original = "original"
    }

    public init(original: String?, medium: String?) {
        self.medium = medium
        self.original = original
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.medium = try? container.decode(String.self, forKey: .medium)
        self.original = try? container.decode(String.self, forKey: .original)
    }
}
