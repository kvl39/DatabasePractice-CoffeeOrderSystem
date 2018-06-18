//
//  ShoppingCartViewController.swift
//  AWSCoffee
//
//  Created by Liao Kevin on 2018/6/18.
//  Copyright © 2018年 Kevin Liao. All rights reserved.
//

import UIKit

class ShoppingCartViewController: ACTableViewController, StackItemViewControllerProtocol {

    
    @IBOutlet weak var shoppingCartTableView: UITableView!
    
    var orderItemsModelManager = OrderItemsModelManager()
    var stackItemViewController: StackItemViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToStackItemView" {
            let vc = segue.destination as? StackItemViewController
            self.stackItemViewController = vc
            vc?.delegate = self
        }
    }
    
    func itemDidPressed(itemInformation: FirebaseSellingItemModel) {
        self.rowArray.append(.orderItem(itemInformation.itemName))
        self.shoppingCartTableView.reloadData()
        self.orderItemsModelManager.orderItems.append(OrderItem(itemInformation: itemInformation, itemDetail: [false, false, false, false]))
    }

    func configureTableView() {
        self.shoppingCartTableView.delegate = self
        self.shoppingCartTableView.dataSource = self
        shoppingCartTableView.register(UINib(nibName: "OrderItemTableViewCell", bundle: nil), forCellReuseIdentifier: "OrderItemTableViewCell")
    }
    
    override func radioButtonDidSelect(rowNumber: Int) {
        print("radio select row:\(rowNumber)")
        var status = [Bool]()
        let indexPath = IndexPath(row: rowNumber, section: 0)
        let cell = self.shoppingCartTableView.cellForRow(at: indexPath) as? OrderItemTableViewCell
        for i in 0...3 {
            if let isSelected = cell?.radioButtonArray[i].isSelected {
                status.append(isSelected)
            }
        }
        self.orderItemsModelManager.orderItems[rowNumber].itemDetail = status
    }
    
    
//    struct CalculatedItemModel {
//        var itemName: String
//        var cups: String
//        var iced: Bool
//        var sugar: Bool
//    }

    
    @IBAction func confirmButtonDidPressed(_ sender: UIButton) {
        generateOrder()
    }
    
    func calculatedTotalCups(completion: ([CalculatedItemModel], Double) -> Void) {
        var selectedItemArray = [CalculatedItemModel]()
        var totalPrice: Double = 0.0
        for i in 0..<self.orderItemsModelManager.orderItems.count {
            totalPrice += self.orderItemsModelManager.orderItems[i].itemInformation.itemPrice
            var nameDidExist = false
            let index = selectedItemArray.index { (item) -> Bool in
                
                if (item.itemName
                    == orderItemsModelManager.orderItems[i].itemInformation.itemName) {
                    nameDidExist = true
                    return true
                }
                return false
            }
            
            if let index = index {
                let index1 = selectedItemArray[index].itemDetailArray.index { (item) -> Bool in
                    switch (item.iced, item.sugar) {
                    case (true, true):
                        if ((orderItemsModelManager.orderItems[i].itemDetail[0])
                            && (orderItemsModelManager.orderItems[i].itemDetail[0])) {
                            return true
                        } else {return false}
                    case (true, false):
                        if ((orderItemsModelManager.orderItems[i].itemDetail[0])
                            && (orderItemsModelManager.orderItems[i].itemDetail[3])) {
                            return true
                        } else {return false}
                    case (false, true):
                        if ((orderItemsModelManager.orderItems[i].itemDetail[1])
                            && (orderItemsModelManager.orderItems[i].itemDetail[2])) {
                            return true
                        } else {return false}
                    case (false, false):
                        if ((orderItemsModelManager.orderItems[i].itemDetail[1])
                            && (orderItemsModelManager.orderItems[i].itemDetail[3])) {
                            return true
                        } else {return false}
                    }
                }
                if let index1 = index1 {
                    //name exists, detail exists too
                    //cup += 1
                    selectedItemArray[index].itemDetailArray[index1].cups += 1
                } else {
                    //name exists, detail doesn't exist
                    //add detail
                    let itemDetailModel = ItemDetailModel(
                        cups: 1,
                        iced: self.orderItemsModelManager.orderItems[i].itemDetail[0],
                        sugar: self.orderItemsModelManager.orderItems[i].itemDetail[2])
                    selectedItemArray[index].itemDetailArray.append(itemDetailModel)
                }
            } else {
                //name doesn't exist
                //add name and detail
                let itemDetailModel = ItemDetailModel(
                    cups: 1,
                    iced: self.orderItemsModelManager.orderItems[i].itemDetail[0],
                    sugar: self.orderItemsModelManager.orderItems[i].itemDetail[2])
                let calculatedItemModel = CalculatedItemModel(
                    itemName: self.orderItemsModelManager.orderItems[i].itemInformation.itemName,
                    itemDetailArray: [itemDetailModel])
                selectedItemArray.append(calculatedItemModel)
            }
            
            
            
//            if let index = index {
////                selectedItemArray[index].cups += 1
//            } else {
//                
//                
//                let addedItem = CalculatedItemModel(
//                    itemName: self.orderItemsModelManager.orderItems[i].itemInformation.itemName, cups: 1,
//                    iced: self.orderItemsModelManager.orderItems[i].itemDetail[0],
//                    sugar: self.orderItemsModelManager.orderItems[i].itemDetail[2])
//                selectedItemArray.append(addedItem)
//            }
        }
        print("selectedItemArray:\(selectedItemArray)")
        completion(selectedItemArray, totalPrice)
    }
    
    
    func generateOrder() {
        var selectedItemArray = [CalculatedItemModel]()
        var totalPrice: Double = 0.0
        self.calculatedTotalCups { (calculatedItemModel, calculatedTotalPrice) in
            selectedItemArray = calculatedItemModel
            totalPrice = calculatedTotalPrice
        }
        var itemCount = self.orderItemsModelManager.orderItems.count
        var account = "wayne.chen@awscafe.tw"
        var status = 0
        var time = 0
        var calculatedOrderMode = CalculatedOrderModel(
            account: account, content: selectedItemArray, itemCount: itemCount,
            price: totalPrice, status: status, time: time)
        //firebase.create
    }

}
