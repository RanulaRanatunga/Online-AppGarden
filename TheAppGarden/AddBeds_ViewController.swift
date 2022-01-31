//
//  AddBeds_ViewController.swift
//  TheAppGarden
//
//  Created by Amal on 23/12/2019.
//  Copyright © 2019 Ranula Ranatunga. All rights reserved.
//

import UIKit
import Firebase
import AlamofireImage

//protocol passingBedData {
//
//    func passData(str:String)
//}


class AddBeds_ViewController: UIViewController , UITextFieldDelegate {
    
    @IBOutlet weak var bedNameTextField: UITextField!
    @IBOutlet weak var rowTextField: UITextField!
    @IBOutlet weak var columnTextField: UITextField!
    @IBOutlet weak var xtextField: UITextField!
    @IBOutlet weak var ytextField: UITextField!
    @IBOutlet weak var locationField: UITextField!
    
    var Bed : BedSizeEntry?
    
    var db: Firestore!
    
//    var bedData = ""
//    var rowData = ""
//    var columndata = ""
//    var xdata = ""
//    var ydata = ""
//    var locationdata = ""
//    var delegate: passingBedData!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        bedNameTextField.text = bedData
//        rowTextField.text = rowData
//        columnTextField.text = columndata
//        xtextField.text = xdata
//        ytextField.text = ydata
//        locationField.text = locationdata
        
        if  Bed != nil{
            
            self.bedNameTextField.isEnabled = false
            self.rowTextField.isEnabled = false
            self.columnTextField.isEnabled = false
            self.xtextField.isEnabled = false
            self.ytextField.isEnabled = false
            self.locationField.isEnabled = false
            
            self.bedNameTextField.text = Bed!.bedname
            self.rowTextField.text = Bed!.row
            self.columnTextField.text = Bed!.column
            self.xtextField.text = Bed!.xField
            self.ytextField.text = Bed!.yField
            self.locationField.text = Bed!.location
            
            
        }

    }
    
    
    @IBAction func saveButton(_ sender: Any) {
        
//        delegate.passData(str: bedNameTextField.text!)
//        delegate.passData(str: rowTextField.text!)
//        delegate.passData(str: columnTextField.text!)
//        delegate.passData(str: xtextField.text!)
//        delegate.passData(str: ytextField.text!)
//        delegate.passData(str: locationField.text!)
        
        self.bedSize(bedName: self.bedNameTextField.text!, rowText: self.rowTextField.text!, columnText: self.columnTextField.text!, xtext: self.xtextField.text! , yText: self.ytextField.text!, location: self.locationField.text!)
        
        self.navigationController?.popViewController(animated: true)
        
        if bedNameTextField.text == "" || rowTextField.text == "" || columnTextField.text == "" || xtextField.text == "" || ytextField.text == ""  {

            // Alert message
            let optionMenu = UIAlertController(title: nil, message: "Please Enter All Text Fields", preferredStyle: .alert)

            //Add actions to the menu
            let cancelAction = UIAlertAction(title: "Okay", style: .cancel, handler:nil)
            optionMenu.addAction(cancelAction)

            //Display the menu
            self.present(optionMenu, animated: true, completion: nil)

        }
        
    }
    

    func bedSize(bedName: String , rowText: String , columnText: String , xtext: String , yText: String , location: String) {
        
        guard (Auth.auth().currentUser?.uid) != nil else { return}
        db = Firestore.firestore()
        let BEntry = BedSizeEntry.init(bedname: bedName, row: rowText, column: columnText, xField: xtext, yField: yText, location: location)
        var ref: DocumentReference? = nil
        ref = self.db.collection("beds").addDocument(data: BEntry.dictionaryData, completion: { error in
            guard error == nil else {return}
            DispatchQueue.main.async {
                    
            //self.viewController.reloadData()
        
                
            }
        })
       
    }
    
//    func textFieldDidBeginEditing(textField: UITextField!) {    //delegate method
//       //check for the required text field
//       if (bedNameTextField.text!.isEmpty){
//          //disable submit button
//        }
//       else{
//         // enable the submit button
//         }
//    }
//
//    func textFieldShouldEndEditing(textField: UITextField!) -> Bool {  //delegate method
//       if (ytextField.text!.isEmpty){
//          //disable submit button
//        }
//       else{
//         // enable the submit button
//         }
//        return true
//    }

    
    
    // alert message
    func displayAlertMessage(messageToDisplay: String)
    {
        let alertController = UIAlertController(title: "Error", message: messageToDisplay, preferredStyle: .alert)

        let OKAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction!) in

            print("Ok button tapped");
        }

        alertController.addAction(OKAction)

        self.present(alertController, animated: true, completion:nil)
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
        else if textField == xtextField {
            
            textField.resignFirstResponder()
        }
        else if textField == ytextField {
            textField.resignFirstResponder()
        }
        
        return true
        
    }
    
    

}
