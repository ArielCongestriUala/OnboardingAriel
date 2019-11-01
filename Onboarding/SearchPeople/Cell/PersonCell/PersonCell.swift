//
//  PersonCell.swift
//  Onboarding
//
//  Created by Ariel Congestri on 01/11/2019.
//  Copyright © 2019 Ariel Congestri. All rights reserved.
//

import UIKit
import Kingfisher

class PersonCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var personImage: UIImageView!

    func configure(with object: Any?) {
        guard let configuration = object as? PersonCellConfiguration else { return }
        name.text = configuration.name
        guard let url = configuration.image else { personImage.image = nil; return }
        let imageURL = URL(string: url)
        personImage.kf.setImage(with: imageURL)
    }
    
}
