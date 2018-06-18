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
    case orderListItem(String, String, String, String, String, String)
}

extension ACTableViewCellType {
    func configureCell() -> ACTableViewCellProtocol {
        switch (self) {
        case .orderItem(let orderItemName):
            return OrderItemCellStruct(orderItemName: orderItemName)
        case .orderListItem(let orderNumberLabelText, let orderTimeLabelText,
                            let orderAccountLabelText, let totalItemLabelText,
                            let totalPriceLabelText, let orderStatusLabelText):
            return OrderListCellStruct(
                orderNumberLabelText: orderNumberLabelText,
                orderTimeLabelText: orderTimeLabelText,
                orderAccountLabelText: orderAccountLabelText,
                totalItemLabelText: totalItemLabelText,
                totalPriceLabelText: totalPriceLabelText,
                orderStatusLabelText: orderStatusLabelText)
            
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

struct OrderListCellStruct: ACTableViewCellProtocol {
    var reuseIdentifier: String = "OrderListTableViewCell"
    var rowHeight: Double = 120
    var orderNumberLabelText = ""
    var orderTimeLabelText = ""
    var orderAccountLabelText = ""
    var totalItemLabelText = ""
    var totalPriceLabelText = ""
    var orderStatusLabelText = ""
    
    init(orderNumberLabelText: String, orderTimeLabelText: String, orderAccountLabelText: String, totalItemLabelText: String, totalPriceLabelText: String, orderStatusLabelText: String) {
        self.orderNumberLabelText = orderNumberLabelText
        self.orderTimeLabelText = orderTimeLabelText
        self.orderAccountLabelText = orderAccountLabelText
        self.totalItemLabelText = totalItemLabelText
        self.totalPriceLabelText = totalPriceLabelText
        self.orderStatusLabelText = orderStatusLabelText
    }
}




