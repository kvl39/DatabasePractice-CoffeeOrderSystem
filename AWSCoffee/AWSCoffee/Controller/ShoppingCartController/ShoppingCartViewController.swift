//
//  ShoppingCartViewController.swift
//  AWSCoffee
//
//  Created by Liao Kevin on 2018/6/18.
//  Copyright © 2018年 Kevin Liao. All rights reserved.
//

import UIKit

class ShoppingCartViewController: ACTableViewController {

    
    @IBOutlet weak var shoppingCartTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }

    func configureTableView() {
        self.shoppingCartTableView.delegate = self
        self.shoppingCartTableView.dataSource = self
        shoppingCartTableView.register(UINib(nibName: "OrderItemTableViewCell", bundle: nil), forCellReuseIdentifier: "OrderItemTableViewCell")
        self.rowArray.append(.orderItem("Test"))
    }

}
