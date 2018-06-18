//
//  OrderListTableViewCell.swift
//  AWSCoffee
//
//  Created by Liao Kevin on 2018/6/18.
//  Copyright © 2018年 Kevin Liao. All rights reserved.
//

import UIKit

class OrderListTableViewCell: UITableViewCell {

    @IBOutlet weak var orderNumberLabel: UILabel!
    @IBOutlet weak var orderTimeLabel: UILabel!
    @IBOutlet weak var orderAccountLabel: UILabel!
    @IBOutlet weak var totalItemLabel: UILabel!
    @IBOutlet weak var totalPriceLabel: UILabel!
    @IBOutlet weak var orderStatusLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
