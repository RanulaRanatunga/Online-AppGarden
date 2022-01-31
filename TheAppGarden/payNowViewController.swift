//
//  payNowViewController.swift
//  TheAppGarden
//
//  Created by Ranula Ranatunga on 11/20/19.
//  Copyright © 2019 Ranula Ranatunga. All rights reserved.
//

import UIKit

class payNowViewController: UIViewController {

    @IBOutlet weak var uIView: UIView!
    @IBOutlet weak var vegImageView: UIImageView!
    @IBOutlet weak var payNowButton: UIButton!
    @IBOutlet weak var vegQuantity: UILabel!
    @IBOutlet weak var vegQuantityPrice: UILabel!
    @IBOutlet weak var totalPrice: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.payNowButton.layer.cornerRadius=15
        
        let line = UIView()
        view.addSubview(line)
        line.translatesAutoresizingMaskIntoConstraints = false
        line.widthAnchor.constraint(equalToConstant: view.bounds.width - 40).isActive = true
        line.heightAnchor.constraint(equalToConstant: 1).isActive = true
        line.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        line.backgroundColor = .gray
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
}
