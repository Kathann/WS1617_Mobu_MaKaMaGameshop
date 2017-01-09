//
//  WarenkorbCell.swift
//  WS1617_Mobu_MaKaMaGameshop
//
//  Created by Student on 09.01.17.
//  Copyright © 2017 fhkl. All rights reserved.
//

import UIKit

class WarenkorbCell: UITableViewCell {

    @IBOutlet weak var deleteIcon: UIImageView!
    @IBOutlet weak var gamePreis: UILabel!
    @IBOutlet weak var gameEdition: UILabel!
    @IBOutlet weak var gameVersiom: UILabel!
    @IBOutlet weak var gameTitle: UILabel!
    @IBOutlet weak var gameImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}
