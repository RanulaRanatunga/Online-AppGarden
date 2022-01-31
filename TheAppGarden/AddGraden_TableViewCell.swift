//
//  AddGraden_TableViewCell.swift
//  TheAppGarden
//
//  Created by Ranula Ranatunga on 9/19/19.
//  Copyright © 2019 Ranula Ranatunga. All rights reserved.
//

import UIKit
import AlamofireImage

class AddGraden_TableViewCell: UITableViewCell {

    @IBOutlet weak var gardenImage: UIImageView!
    @IBOutlet weak var gardenName: UILabel!
    @IBOutlet weak var gardenDescription: UILabel!
    @IBOutlet weak var addButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }

}
