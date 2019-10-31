//
//  EpisodeCell.swift
//  Onboarding
//
//  Created by Ariel Congestri on 31/10/2019.
//  Copyright © 2019 Ariel Congestri. All rights reserved.
//

import UIKit

class EpisodeCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var number: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(with object: Any?) {
        guard let configuration = object as? EpisodeCellConfiguration else { return }
        name.text = configuration.name
        number.text = configuration.number
        
    }
    
}
