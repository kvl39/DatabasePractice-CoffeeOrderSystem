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
    
    func retrieveAllSellingItems(completion: @escaping ([FirebaseSellingItemModel])-> Void) {
        
        var sellingItemsArray = [FirebaseSellingItemModel]()
        let localRef = self.ref.child("items")
        let query = localRef.queryOrderedByKey()
        query.observeSingleEvent(of: .value) { (snapshot) in
            if let result = snapshot.children.allObjects as? [DataSnapshot] {
                for child in result {
                    if let sellingItem = child.value as? [String: Any],
                       let sellingItemImage = sellingItem["image"] as? String,
                       let sellingItemName = sellingItem["name"] as? String,
                        let sellingItemPrice = sellingItem["price"] as? Double {
                        let sellingItem = FirebaseSellingItemModel(itemImage: sellingItemImage, itemName: sellingItemName, itemPrice: sellingItemPrice)
                        sellingItemsArray.append(sellingItem)
                    }
                }
            }
            completion(sellingItemsArray)
        }
    }
}
