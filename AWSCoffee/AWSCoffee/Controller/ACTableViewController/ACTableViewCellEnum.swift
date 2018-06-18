//
//  ACTableViewCellEnum.swift
//  AWSCoffee
//
//  Created by Liao Kevin on 2018/6/18.
//  Copyright © 2018年 Kevin Liao. All rights reserved.
//

import Foundation


enum ACTableViewCellType {
    case orderItem(String)
    
}

extension ACTableViewCellType {
    func configureCell() -> ACTableViewCellProtocol {
        switch (self) {
        case .orderItem(let orderItemName):
            return OrderItemCellStruct(orderItemName: orderItemName)
        }
    }
}

    
protocol ACTableViewCellProtocol {
    var reuseIdentifier: String {get}
    var rowHeight: Double {get}
}

struct OrderItemCellStruct: ACTableViewCellProtocol {
    var reuseIdentifier: String = "OrderItemTableViewCell"
    var rowHeight: Double = 140
    var orderItemName: String = ""
    init(orderItemName: String) {
        self.orderItemName = orderItemName
    }
}




