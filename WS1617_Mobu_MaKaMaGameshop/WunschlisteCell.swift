//
//  WunschlisteCell.swift
//  WS1617_Mobu_MaKaMaGameshop
//
//  Created by Student on 11.01.17.
//  Copyright © 2017 fhkl. All rights reserved.
//

import UIKit

class WunschlisteCell: UITableViewCell {

    
    @IBOutlet weak var gameImage: UIImageView!
    @IBOutlet weak var gameTitle: UILabel!
    @IBOutlet weak var gameInfo: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
}
