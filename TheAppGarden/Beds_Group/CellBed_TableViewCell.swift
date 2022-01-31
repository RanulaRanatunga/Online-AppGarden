//
//  CellBed_TableViewCell.swift
//  TheAppGarden
//
//  Created by Amal on 19/12/2019.
//  Copyright © 2019 Ranula Ranatunga. All rights reserved.
//

import UIKit

class CellBed_TableViewCell: UITableViewCell {
    

    @IBOutlet weak var columnField: UITextField!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var rowField: UITextField!
    @IBOutlet weak var xField: UITextField!
    @IBOutlet weak var yField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }

}
