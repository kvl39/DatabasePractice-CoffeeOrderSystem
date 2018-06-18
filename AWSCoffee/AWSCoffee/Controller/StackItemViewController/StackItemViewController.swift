//
//  StackItemViewController.swift
//  AWSCoffee
//
//  Created by Liao Kevin on 2018/6/18.
//  Copyright © 2018年 Kevin Liao. All rights reserved.
//

import UIKit
import SDWebImage


protocol StackItemViewControllerProtocol: class {
    func itemDidPressed(itemInformation: FirebaseSellingItemModel)
}

class StackItemViewController: UIViewController, StackItemViewProtocol {

    let stackItemView = StackItemView()
    weak var delegate: StackItemViewControllerProtocol?
    let firebaseManager = ACFirebaseManager()
    var sellingItems = [FirebaseSellingItemModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureStackItemView()
        firebaseManager.retrieveAllSellingItems { (sellingItems) in
            self.sellingItems = sellingItems
            //self.configureItemImage()
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.stackItemView.frame = self.view.bounds
    }
    
    
    func configureItemImage() {
        var counter = 0
        self.stackItemView.buttonImageCollection[0].frame = self.stackItemView.stackItemCollection[0].frame
        self.stackItemView.buttonImageCollection[0].sd_setImage(
            with: URL(string: self.sellingItems[0].itemImage), placeholderImage: #imageLiteral(resourceName: "Icon-App-20x20-1"), options: [], completed: nil)
        self.stackItemView.buttonImageCollection[0].sd_setImage(with: URL(string: self.sellingItems[0].itemImage), placeholderImage: #imageLiteral(resourceName: "Icon-App-20x20-1"), options: []) { (_, _, _, _) in
            self.stackItemView.buttonImageCollection[0].frame = self.stackItemView.stackItemCollection[1].frame
            self.stackItemView.stackItemCollection[0].frame = self.stackItemView.stackItemCollection[1].frame
        }
        for sellingItem in sellingItems {
            
            
            
            
//            let imageView = UIImageView(
//                frame: self.stackItemView.stackItemCollection[counter].bounds)
            
            
//            self.stackItemView.stackItemCollection[counter].sd_setImage(
//                with: URL(string: self.sellingItems[counter].itemImage),
//                for: .normal, completed: nil)
            
//            self.stackItemView.stackItemCollection[counter].sd_setBackgroundImage(
//                with: URL(string: self.sellingItems[counter].itemImage),
//                for: .normal, completed: nil)
            
            counter += 1
        }
    }
    
    func configureStackItemView() {
        stackItemView.frame = self.view.bounds
        self.view.addSubview(stackItemView)
        stackItemView.delegate = self
    }

    func itemDidPressed(tag: Int) {
        self.delegate?.itemDidPressed(itemInformation: self.sellingItems[tag])
    }
    

}
