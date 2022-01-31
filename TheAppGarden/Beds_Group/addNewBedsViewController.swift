//
//  addNewBedsViewController.swift
//  TheAppGarden
//
//  Created by Ranula Ranatunga on 17/12/2019.
//  Copyright © 2019 Ranula Ranatunga. All rights reserved.
//

import UIKit
import Firebase


class addNewBedsViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var descriptionField: UITextView!
    @IBOutlet weak var nextButton: UIButton!
    
    
    var Beds : BedEntry?
           
    var db: Firestore!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // name text field border
        self.nameTextField.layer.borderColor = UIColor.lightGray.cgColor
        self.nameTextField.layer.borderWidth = 1
        
        // description field border
        self.descriptionField.layer.borderColor = UIColor.lightGray.cgColor
        self.descriptionField.layer.borderWidth = 1
        
        
        if Beds != nil {
            
            self.nameTextField.isEnabled = false
            self.descriptionField.isEditable = false
            
        }
    
    }
    
    
    func addBeds(bedName : String , bedDescription: String) {
        
        
        guard let userID = Auth.auth().currentUser?.uid else { return }
        
        db = Firestore.firestore()

        //let BEntry = BedEntry.init(bedDescription: String, bedName: String)
        
    }
    

    @IBAction func next(_ sender: Any) {
        
        performSegue(withIdentifier: "bedSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
//      if   segue.identifier == "bedSegue" {
//            if let nextViewController = segue.destination as? BedsTableViewController {
//                nextViewController.BedName = self.nameTextField.text ?? ""
//                nextViewController.BedDescription = self.descriptionField.text ?? ""
//            }
//        }
    }
}
