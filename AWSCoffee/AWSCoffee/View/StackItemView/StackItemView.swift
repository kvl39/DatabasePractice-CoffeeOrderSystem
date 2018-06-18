//
//  StackItemView.swift
//  AWSCoffee
//
//  Created by Liao Kevin on 2018/6/18.
//  Copyright © 2018年 Kevin Liao. All rights reserved.
//

import UIKit


protocol StackItemViewProtocol: class {
    func itemDidPressed(tag: Int)
}


class StackItemView: UIView {

    weak var delegate: StackItemViewProtocol?
    @IBOutlet var contentView: UIView!
    @IBOutlet var stackItemCollection: [UIButton]!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    
    func commonInit() {
        Bundle.main.loadNibNamed("StackItemView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        self.backgroundColor = UIColor.clear
        self.contentView.backgroundColor = UIColor.clear
        configureButtons()
    }
    
    
    func configureButtons() {
        var counter = 1
        for button in stackItemCollection {
            button.tag = counter
            button.addTarget(self, action: #selector(itemDidPressed(sender:)), for: .touchUpInside)
            counter += 1
        }
    }
    
    
    @objc func itemDidPressed(sender: UIButton) {
        self.delegate?.itemDidPressed(tag: sender.tag)
    }

}
