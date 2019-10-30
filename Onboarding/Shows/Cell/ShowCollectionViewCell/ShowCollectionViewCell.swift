//
//  ShowCollectionViewCell.swift
//  Onboarding
//
//  Created by Ariel Congestri on 30/10/2019.
//  Copyright © 2019 Ariel Congestri. All rights reserved.
//

import UIKit
import Kingfisher

class ShowCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var rating: UILabel!
    @IBOutlet weak var image: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configureWith(_ configuration: Any?) {
        guard let configuration = configuration as? ShowCellConfiguration else { return }
        name.text = configuration.name
        rating.text = configuration.rating
        guard let url = configuration.image else { image.image = nil; return }
        let imageURL = URL(string: url)
        image.kf.setImage(with: imageURL)
    }
}
