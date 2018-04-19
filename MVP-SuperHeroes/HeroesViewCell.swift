//
//  HeroesViewCell.swift
//  MVP-SuperHeroes
//
//  Created by appsistemas on 18/4/18.
//  Copyright © 2018 eloysn. All rights reserved.
//

import UIKit
import Kingfisher


class HeroesViewCell: UITableViewCell {
    
    // MARK: - Configure
    static let cellIdentifier = "HeroesViewCell"
    static let rowHeight: CGFloat = 230
    // MARK: - Outlets
    @IBOutlet weak var imaHeroe: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblRealName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
   
    
    func populateCell(heroe: Heroe) {
        lblName.text = heroe.name
        lblRealName.text = heroe.realName
        imaHeroe.kf.setImage(with: heroe.photo)
    }
    
}
