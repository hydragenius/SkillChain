//
//  SignInViewController.swift
//  SkillChain
//
//  Created by Florian Jenny on 20.01.18.
//  Copyright © 2018 Sarina. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

// Extension to dismiss Keyboard with tap on screen
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

class SignInViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Hide keyboard on tap

        self.hideKeyboardWhenTappedAround()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    
    /*@IBOutlet weak var mailTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!*/
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var mailTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBAction func signInButton(_ sender: RoundedButton) {
        
        if passwordTextField.text != confirmPasswordTextField.text{
        
            let alertController = UIAlertController(title: "Error", message: "Passwords dont match!", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            
            alertController.addAction(defaultAction)
            
            present(alertController, animated: true, completion: nil)
        } else{
        
        // TODO: ADD MORE ERROR HANDLING
        
        // Authentication
        Auth.auth().createUser(withEmail: mailTextField.text!, password: passwordTextField.text!) { (user, error) in
            
            if error == nil {
                
                // Send Verification if no errors
                Auth.auth().currentUser?.sendEmailVerification() { (error) in
                    
                    if error != nil {
                        
                        let alertController = UIAlertController(title: "Error", message: error.debugDescription, preferredStyle: .alert)
                        
                        let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                        
                        alertController.addAction(defaultAction)
                        
                        self.present(alertController, animated: true, completion: nil)
                        
                    } else {
                        
                        let infoController = UIAlertController(title: "E-Mail sent", message: "A verification E-Mail was sent to the entered adress. Please confirm registration", preferredStyle: .actionSheet)
                        
                        let defaultAction = UIAlertAction(title: "OK", style: .default){ action -> Void in
                            let vc = self.storyboard?.instantiateViewController(withIdentifier: "loginScreen")
                            self.present(vc!, animated: true, completion: nil)
                        }
                        
                        infoController.addAction(defaultAction)
                        
                        self.present(infoController, animated: true, completion: nil)
                        

                    }
                    
                }
                
                //let vc = self.storyboard?.instantiateViewController(withIdentifier: "SkillChainHome")
                //self.present(vc!, animated: true, completion: nil)
                
            } else {
                
                let alertController = UIAlertController(title: "Error", message: error.debugDescription, preferredStyle: .alert)
                
                let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                
                alertController.addAction(defaultAction)
                
                self.present(alertController, animated: true, completion: nil)
                
            }
            
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
