//
//  OrderDetailPageViewController.swift
//  AWSCoffee
//
//  Created by Liao Kevin on 2018/6/18.
//  Copyright © 2018年 Kevin Liao. All rights reserved.
//

import UIKit

class OrderDetailPageViewController: ACTableViewController {

    
    @IBOutlet weak var orderDetailTableView: UITableView!
    var calculatedOrderModel: CalculatedOrderModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }
    
    func configureTableView() {
        orderDetailTableView.delegate = self
        orderDetailTableView.dataSource = self
        orderDetailTableView.register(UINib(nibName: "OrderListTableViewCell", bundle: nil), forCellReuseIdentifier: "OrderListTableViewCell")
        if let order = calculatedOrderModel {
            self.rowArray.append(.orderListItem("order number", String(order.time),
                                                order.account, String(order.itemCount), String(order.price), String(order.status)))
        }
    }
    
    

    
}
