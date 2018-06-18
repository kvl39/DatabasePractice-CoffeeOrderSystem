//
//  StackItemViewController.swift
//  AWSCoffee
//
//  Created by Liao Kevin on 2018/6/18.
//  Copyright © 2018年 Kevin Liao. All rights reserved.
//

import UIKit


protocol StackItemViewControllerProtocol: class {
    func itemDidPressed(tag: Int)
}

class StackItemViewController: UIViewController, StackItemViewProtocol {

    let stackItemView = StackItemView()
    weak var delegate: StackItemViewControllerProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureStackItemView()
    }
    
    func configureStackItemView() {
        stackItemView.frame = self.view.bounds
        stackItemView.delegate = self
    }

    func itemDidPressed(tag: Int) {
        self.delegate?.itemDidPressed(tag: tag)
    }
    

}
