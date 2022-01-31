//
//  signUpPage_ViewController.swift
//  TheAppGarden
//
//  Created by Ranula Ranatunga on 9/17/19.
//  Copyright © 2019 Ranula Ranatunga. All rights reserved.
//

import UIKit
import Firebase

class signUpPage_ViewController: UIViewController , UITextFieldDelegate{
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signUpButton: UITextField!
    @IBOutlet weak var scrollView: UIScrollView!
    

    var activeTextField : UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        nameTextField.delegate = self
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    @IBAction func didTapSignupButton(sender:UIButton) {
        
        guard let name = nameTextField.text,
        let email = emailTextField.text,
        let password = passwordTextField.text
            
        else{
            
        return
    
        }
        
        
        if (name.isEmpty && email.isEmpty && password.isEmpty) {
            
            
        displayAlert(message: "Text Field must completed")
         errorHighlightTextField(textField: nameTextField)
         errorHighlightTextField(textField: emailTextField)
         errorHighlightTextField(textField: passwordTextField)
            
                   return
               }
        
    
        if isValidEmail(emailID: email) {
            print("Validate EmailID")
            
            displayAlert(message: "Email Address is Valid")
        }
            
        else {
            
         print("invalide EmailID")
            
            displayAlert(message: "Enter Valid Email Address")
            
            errorHighlightTextField(textField: emailTextField)
        }
        

        if isValidPassword(testStr :password){

            displayAlert(message: "Password is Valid")
        }
        else {
            
            
        }

        if (name.isEmpty) {
                   displayAlert(message: "Name is not set")
                   return
               }
    

        
//        if(isPasswordValid(pass :password)){
//            displayAlert(message: "Password is not valid")
//        }
//
    
        print("Name: \(name)")
        print ("Email: \(email)")
        print("Password: \(password)")
        
        //firebase signup
        
        Auth.auth().createUser(withEmail: email, password: password) { (authData, error) in
            
            guard error == nil else {
                
                return
            }
            
            self.updateUserName(name: name)
        }
    
    }
    
   
    //display alert
    private func displayAlert(message: String) {
        let alert = UIAlertController(title: "Required", message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    
     func updateUserName(name: String) {
         
         if let user = Auth.auth().currentUser {
             
             let
             changeReq = user.createProfileChangeRequest()
             changeReq.displayName = name
             changeReq.commitChanges { (error) in
                 self.dismiss(animated: true , completion: nil)
             }
         }
     }
    
//    //validate email address
    func isValidEmail(emailID:String) -> Bool {
           let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
           let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
           return emailTest.evaluate(with: emailID)
       }
    
    
     // Text Field is empty - show red border
    func errorHighlightTextField(textField: UITextField){
        textField.layer.borderColor = UIColor.red.cgColor
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 5
        }
    
    
    // password validation
    func isValidPassword(testStr:String?) -> Bool {
        guard testStr != nil else { return false }
        
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "(?=.*[A-Z])(?=.*[0-9])(?=.*[a-z]).{8,}")
        return passwordTest.evaluate(with:testStr)
    }
    
    
//    @objc func keyboardWillShow(notification: Notification) {
//        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
//            if self.view.frame.origin.y == 0{
//                self.view.frame.origin.y -= keyboardSize.height
//            }
//        }
//
//    }
//
//    @objc func keyboardWillHide(notification: Notification) {
//        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
//            if self.view.frame.origin.y != 0 {
//                self.view.frame.origin.y += keyboardSize.height
//            }
//        }
//    }


    func textFieldShouldReturn(_ textField: UITextField) -> Bool {

        if textField == nameTextField {
            textField.resignFirstResponder()
            emailTextField.becomeFirstResponder()
        } else if textField == emailTextField  {
            textField.resignFirstResponder()
            passwordTextField.becomeFirstResponder()
        } else if textField == passwordTextField {
            textField.resignFirstResponder()
        }
        return true
        
    }

    
    // alert message 
//    func displayAlertMessage(messageToDisplay: String){
//
//        let alertController = UIAlertController(title: "Alert", message: messageToDisplay, preferredStyle: .alert)
//
//        let OKAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction!) in
//
//            // Code in this block will trigger when OK button tapped.
//            print("Ok button tapped");
//        }
//
//        alertController.addAction(OKAction)
//
//        self.present(alertController, animated: true, completion:nil)
//    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
