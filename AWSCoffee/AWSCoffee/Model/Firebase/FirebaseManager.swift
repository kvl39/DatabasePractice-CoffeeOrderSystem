//
//  FirebaseManager.swift
//  AWSCoffee
//
//  Created by Liao Kevin on 2018/6/18.
//  Copyright © 2018年 Kevin Liao. All rights reserved.
//

import Foundation
import Firebase

class ACFirebaseManager {
    lazy var ref: DatabaseReference = Database.database().reference()
    
    func retrieveAllSellingItems() {
        let localRef = self.ref.child("items")
        let query = localRef.queryOrdered(byChild: "recipes")
        var menuArray = [[String]]()
        query.observeSingleEvent(of: .value) { (snapshot) in
            if let result = snapshot.children.allObjects as? [DataSnapshot] {
                for child in result {
                    if let recipesName = child.value as? [String: Any],
                        let recipeArray = recipesName["recipes"] as? [String]{
                        menuArray.append(recipeArray)
                    }
                }
            }
            completion(menuArray)
        }
    }
}
