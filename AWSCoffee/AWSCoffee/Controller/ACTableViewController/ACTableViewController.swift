//
//  ACTableViewController.swift
//  AWSCoffee
//
//  Created by Liao Kevin on 2018/6/18.
//  Copyright © 2018年 Kevin Liao. All rights reserved.
//

import UIKit



class ACTableViewController: UIViewController, OrderItemTableViewProtocol {
    var rowArray = [ACTableViewCellType]()
    func radioButtonDidSelect(rowNumber: Int) {}
}


extension ACTableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = rowArray[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: item.configureCell().reuseIdentifier, for: indexPath)
        switch(item) {
        case .orderItem:
            let itemStruct = item.configureCell() as? OrderItemCellStruct
            guard let cell = cell as? OrderItemTableViewCell else {return UITableViewCell()}
            cell.itemNameLabel.text = itemStruct?.orderItemName
            cell.selectionStyle = .none
            cell.delegate = self
            cell.rowNumber = indexPath.row
            return cell
        case .orderListItem:
            let itemStruct = item.configureCell() as? OrderListCellStruct
            guard let cell = cell as? OrderListTableViewCell else {return UITableViewCell()}
            cell.orderAccountLabel.text = itemStruct?.orderAccountLabelText
            cell.orderNumberLabel.text = itemStruct?.orderNumberLabelText
            cell.orderTimeLabel.text = itemStruct?.orderTimeLabelText
            cell.orderStatusLabel.text = itemStruct?.orderStatusLabelText
            cell.totalItemLabel.text = itemStruct?.totalItemLabelText
            cell.totalPriceLabel.text = itemStruct?.totalPriceLabelText
            cell.selectionStyle = .none
            return cell
        }
    }
}


extension ACTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rowArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(rowArray[indexPath.row].configureCell().rowHeight)
    }
}
