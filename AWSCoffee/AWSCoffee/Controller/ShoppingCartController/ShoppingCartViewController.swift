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
    }

    func configureTableView() {
        self.shoppingCartTableView.delegate = self
        self.shoppingCartTableView.dataSource = self
        shoppingCartTableView.register(UINib(nibName: "OrderItemTableViewCell", bundle: nil), forCellReuseIdentifier: "OrderItemTableViewCell")
    }
    
    override func radioButtonDidSelect(rowNumber: Int) {
        
    }

}
