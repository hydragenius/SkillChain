//
//  Database Functions.swift
//  SkillChain
//
//  Created by Sarina on 21.01.18.
//  Copyright © 2018 Sarina. All rights reserved.
//

import Foundation
import FirebaseDatabase

let databaseRoot = Database.database().reference()
let users = databaseRoot.child("users")

func addNewUser(userID: String){
    
    // Initialize new User JSON Data
    let userData = ["name": "empty",
                    "lastname": "empty",
                    "profilepicture": "empty",
                    "rating": "empty",
                    "location": "empty",
                    "mail": "empty"]
    
    users.child(userID).setValue(userData)
    
}

func checkUserExists(userID: String) -> Bool{
    
    var userExists = false
    let allUsers = databaseRoot.child("users")
    
    allUsers.removeAllObservers()
    
    allUsers.observeSingleEvent(of: .value, with: {snapshot in
        for user in snapshot.children {
            let userSnap = user as! DataSnapshot
            if userSnap.key == userID {
                userExists = true
            }
        }
    })
    if userExists == true {
        print(" GEILSE ASDFLSIFASDFASJDF")
        return true
        
    } else {
        return false
    }
    
}
