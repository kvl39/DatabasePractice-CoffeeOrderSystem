//
//  OrderItemTableViewCell.swift
//  AWSCoffee
//
//  Created by Liao Kevin on 2018/6/18.
//  Copyright © 2018年 Kevin Liao. All rights reserved.
//

import UIKit
import LTHRadioButton

protocol OrderItemTableViewProtocol: class {
    func radioButtonDidSelect(rowNumber: Int)
}


class OrderItemTableViewCell: UITableViewCell {

    
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet var radioButtonView: [UIView]!
    
    var rowNumber = 0
    var radioButtonArray =  [LTHRadioButton]()
    weak var delegate: OrderItemTableViewProtocol?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        configureRadioButtons()
    }
    
    func configureRadioButtons() {
        for i in 0...3 {
            let radioButton = LTHRadioButton(selectedColor: .blue)
            radioButton.frame = CGRect(x: 5.0, y: 10.0, width: 20.0, height: 20.0)
            radioButtonArray.append(radioButton)
            radioButtonView[i].addSubview(radioButton)
            radioButton.tag = i + 10
            radioButton.onSelect {
                self.radioButtonGroupSelectHandler(selectedNumber: radioButton.tag)
            }
        }
    }
    
    func radioButtonGroupSelectHandler(selectedNumber: Int) {
        switch selectedNumber {
        case 10:
            radioButtonArray[1].deselect()
        case 11:
            radioButtonArray[0].deselect()
        case 12:
            radioButtonArray[3].deselect()
        case 13:
            radioButtonArray[2].deselect()
        default:
            return
        }
        self.delegate?.radioButtonDidSelect(rowNumber: self.rowNumber)
    }

    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
