//
//  CalculatedOrderModel.swift
//  AWSCoffee
//
//  Created by Liao Kevin on 2018/6/18.
//  Copyright © 2018年 Kevin Liao. All rights reserved.
//

import Foundation

struct CalculatedOrderModel {
    var account: String
    var content: [CalculatedItemModel]
    var itemCount: Int
    var price: Double
    var status: Int
    var time: Int
}

struct CalculatedItemModel {
    var itemName: String
    var itemDetailArray: [ItemDetailModel]
}

struct ItemDetailModel {
    var cups: Int
    var iced: Bool
    var sugar: Bool
}


