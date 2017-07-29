//
//  HousesTableViewCell.swift
//  Westeros
//
//  Created by JOSE LUIS BUSTOS ESTEBAN on 28/7/17.
//  Copyright © 2017 Keepcoding. All rights reserved.
//

import UIKit

class HousesTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBOutlet weak var imagen: UIImageView!
    @IBOutlet weak var descrip: UILabel!
    @IBOutlet weak var titulo: UILabel!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
    }
    
    
    
    
}
