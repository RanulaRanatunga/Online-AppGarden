//
//  signInPageViewController.swift
//  TheAppGarden
//
//  Created by Ranula Ranatunga on 9/17/19.
//  Copyright © 2019 Ranula Ranatunga. All rights reserved.
//

import UIKit
import Firebase

class signInPageViewController: UIViewController , UITextFieldDelegate {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    @IBAction func didTapLoginButton(sender: UIButton ) {
        
        guard let email = emailTextField.text,
        let password = passwordTextField.text else {return}
        
        
        if (email.isEmpty && password.isEmpty) {
            displayAlert(message: "Email and Password are not Set!")
            return
        }
        
//        if isValidEmailAddress(emailAddressString: email){
//            
//            print ("Valid Email Address")
//            displayAlert(message: "Email is valid")
//        }
//        else {
//            displayAlert(message: "Email is not Valid")
//            print ("Invalid Email Address")
//        }
  
//        if isValidPassword(testStr: password){
//
//            displayAlert(message: "Your password is valid one")
//        }
//
        authenticaeUserWith(email: email, password: password)
        
    }
    
    //authentication user 
    func authenticaeUserWith(email: String , password: String){

        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in

            guard error == nil else {

                self.showAlert(message: error!.localizedDescription)

                return

            }

            guard let user = result?.user else {return}

            print("--------USER LOGIN SUCCESS-----------")

            print(user.displayName)

            print("--------------------")

          self.performSegue(withIdentifier: "GardenLogin", sender: self)

        }
         
    }
    
    //show alert
    func showAlert(message: String){
        
        let alertVC = UIAlertController(title: "Error!" , message: message, preferredStyle: UIAlertController.Style.alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        present(alertVC, animated: true, completion: nil)
    
    }
    
    
    private func displayAlert(message: String) {
        let alert = UIAlertController(title: "Required Email and Password", message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    //text field return
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == emailTextField {
            emailTextField.becomeFirstResponder()
        } else if textField == emailTextField {
            passwordTextField.becomeFirstResponder()
        } else {
            signInButton.resignFirstResponder()
        }
        return true
    }
    
     // Text Field is empty - show red border
    func errorHighlightTextField(textField: UITextField){
        textField.layer.borderColor = UIColor.red.cgColor
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 5
        }
    
    // email validation
    func isValidEmailAddress(emailAddressString: String) -> Bool {
        
        var returnValue = true
        let emailRegEx = "[A-Z0-9a-z.-_]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}"
        
        do {
            let regex = try NSRegularExpression(pattern: emailRegEx)
            let nsString = emailAddressString as NSString
            let results = regex.matches(in: emailAddressString, range: NSRange(location: 0, length: nsString.length))
            
            if results.count == 0
            {
                returnValue = false
            }
            
        } catch let error as NSError {
            print("invalid regex: \(error.localizedDescription)")
            returnValue = false
        }
        
        return  returnValue
    }
    
    // password validation
    func isValidPassword(testStr:String?) -> Bool {
        guard testStr != nil else { return false }
        
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "(?=.*[A-Z])(?=.*[0-9])(?=.*[a-z]).{8,}")
        return passwordTest.evaluate(with: testStr)
    }
    // alert message
    func displayAlertMessage(messageToDisplay: String){
        
        let alertController = UIAlertController(title: "Alert", message: messageToDisplay, preferredStyle: .alert)
        
        let OKAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction!) in
            
            // Code in this block will trigger when OK button tapped.
            print("Ok button tapped");
        }
        
        alertController.addAction(OKAction)
        
        self.present(alertController, animated: true, completion:nil)
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
