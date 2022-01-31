//
//  viewBedDetailViewController.swift
//  TheAppGarden
//
//  Created by Ranula Ranatunga on 02/01/2020.
//  Copyright © 2020 Ranula Ranatunga. All rights reserved.
//

import UIKit

class viewBedDetailViewController: UIViewController , UITextFieldDelegate {
    
    @IBOutlet weak var bedNameTextField: UILabel!
    @IBOutlet weak var rowTextField: UILabel!
    @IBOutlet weak var columnTextField: UILabel!
    @IBOutlet weak var xField: UILabel!
    @IBOutlet weak var yField: UILabel!
    @IBOutlet weak var locationField: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
         
    
        
    }
    
    
    // keyboard overlapping
     func textFieldShouldReturn(_ textField: UITextField) -> Bool {

         if textField == bedNameTextField {
             
             textField.resignFirstResponder()
                 rowTextField.becomeFirstResponder()
         }  else if textField == rowTextField  {
             
             textField.resignFirstResponder()
             columnTextField.becomeFirstResponder()
             
         } else if textField == columnTextField {
             textField.resignFirstResponder()
             
         }
         else if textField == xField {
             
             textField.resignFirstResponder()
         }
         else if textField == yField {
             textField.resignFirstResponder()
         }
         else if textField == locationField {
            textField.resignFirstResponder()
        }
         
         return true
     }
    

}
