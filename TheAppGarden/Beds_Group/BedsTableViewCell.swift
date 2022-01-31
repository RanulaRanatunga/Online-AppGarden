//
//  BedsTableViewCell.swift
//  TheAppGarden
//
//  Created by Ranula on 23/12/2019.
//  Copyright © 2019 Ranula Ranatunga. All rights reserved.
//

import UIKit

class BedsTableViewCell: UITableViewCell {


  
    @IBOutlet weak var bedNameTextField: UILabel!
    
    @IBOutlet weak var xField: UILabel!
    
   
    @IBOutlet weak var yField: UILabel!
    
    @IBOutlet weak var locationTextField: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
      
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

}
