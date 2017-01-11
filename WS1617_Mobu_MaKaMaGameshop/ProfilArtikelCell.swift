//
//  ProfilArtikelCell.swift
//  WS1617_Mobu_MaKaMaGameshop
//
//  Created by Student on 10.01.17.
//  Copyright © 2017 fhkl. All rights reserved.
//

import UIKit

class ProfilArtikelCell: UITableViewCell {
    
    @IBOutlet weak var gameImage: UIImageView!
    @IBOutlet weak var gameKaufdatum: UILabel!
    @IBOutlet weak var gameTitel: UILabel!
    
        override func awakeFromNib() {
            super.awakeFromNib()
            // Initialization code
        }
        
        override func setSelected(_ selected: Bool, animated: Bool) {
            super.setSelected(selected, animated: animated)
            
            // Configure the view for the selected state
        }
}
