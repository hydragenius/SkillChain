//
//  LoginViewController.swift
//  SkillChain
//
//  Created by Florian Jenny on 20.01.18.
//  Copyright © 2018 Sarina. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.hideKeyboardWhenTappedAround()
        
        // ref to database root
        //let databaseRoot = Database.database().reference()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    @IBAction func passwordTextFieldMask(_ sender: UITextField) {
        
        passwordTextField.isSecureTextEntry = true
        
    }
    
    
    @IBAction func loginButtonClicked(_ sender: RoundedButton) {
        
        Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) { (user, error) in
            
            if error == nil {
                
                // Login user if mail is verified

                if user?.isEmailVerified == true {
                
                    //var databaseRoot = Database.database()
                    let userID = user!.uid
                    let userExistCheck: Bool = checkUserExists(userID: userID)
                    
                    
                    
                    if userExistCheck == false{
                        // add new User with UID if not listed in database yet
                        addNewUser(userID: userID)
                        
                    }
                    
                    // update mail field o
                    
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "SkillChainHome")
                self.present(vc!, animated: true, completion: nil)
                    
                } else {
                    
                    let alertController = UIAlertController(title: "Error", message: "Please verify your account. Check your E-Mail.", preferredStyle: .actionSheet)
                    
                    let defaultAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
                    
                    alertController.addAction(defaultAction)
                    
                    self.present(alertController, animated: true, completion: nil)
                    
                }
                
            } else{
                
                let alertController = UIAlertController(title: "Error", message: "E-Mail or password is incorrect!", preferredStyle: .actionSheet)
                
                let defaultAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
                
                alertController.addAction(defaultAction)
                
                self.present(alertController, animated: true, completion: nil)
                
            }
            
            
        }
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
