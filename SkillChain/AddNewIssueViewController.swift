//
//  AddNewIssueViewController.swift
//  SkillChain
//
//  Created by Sarina on 21.01.18.
//  Copyright © 2018 Sarina. All rights reserved.
//

import UIKit
import FirebaseDatabase

class AddNewIssueViewController: UIViewController, UITableViewDelegate/*, UITableViewDataSource*/ {
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet weak var descriptionTextField: UITextField!
    
    @IBOutlet weak var priceTextField: UITextField!
    
    /*let issue = "issue"
     
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
     {
     return(issue.count)
     
     }
     
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
     {
     let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
     cell.textLabel?.text = issue[indexPath.row]
     return(cell)
     
     }
 */
    let issue = "issue"
    
    var ref:DatabaseReference?
    
    @IBAction func saveButton(_ sender: UIButton) {
        ref = Database.database().reference()
        if titleTextField != nil
            
        {
            ref?.child(issue).childByAutoId().setValue(titleTextField.text)
    
        }
        
        if descriptionTextField != nil
        {
            ref?.child(issue).childByAutoId().setValue(descriptionTextField.text)
        }
        
        if priceTextField != nil
        {
            ref?.child(issue).childByAutoId().setValue(priceTextField.text)
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
}
