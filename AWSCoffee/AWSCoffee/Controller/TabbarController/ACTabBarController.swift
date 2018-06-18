//
//  ACTabBarController.swift
//  AWSCoffee
//
//  Created by Liao Kevin on 2018/6/18.
//  Copyright © 2018年 Kevin Liao. All rights reserved.
//

import UIKit

enum TabBar {
    case shoppingCart
    case orderList
    
    
    func controller()->UIViewController {
        switch self {
        case .shoppingCart: return UIStoryboard(name: "ShoppingCart", bundle: nil).instantiateInitialViewController()!
        case .orderList: return UIStoryboard(name: "OrderList", bundle: nil).instantiateInitialViewController()!
        }
    }
    
    func image() -> UIImage {
        switch self {
        case .shoppingCart: return #imageLiteral(resourceName: "Icon-App-20x20")
        case .orderList: return #imageLiteral(resourceName: "Icon-App-20x20-1")
        }
    }
    
    func selectedImage() -> UIImage {
        switch self {
        case .shoppingCart: return #imageLiteral(resourceName: "Icon-App-20x20").withRenderingMode(.alwaysTemplate)
        case .orderList: return #imageLiteral(resourceName: "Icon-App-20x20-1").withRenderingMode(.alwaysTemplate)
        }
    }
}


class ACTabBarController: UITabBarController {

    let tabs: [TabBar] = [.shoppingCart, .orderList]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabs()
        selectedIndex = 1
    }
    
    func setupTabs() {
        var controllers: [UIViewController] = []
        for tab in tabs {
            let controller = tab.controller()
            let item = UITabBarItem(
                title: nil, image: tab.image(), selectedImage: tab.selectedImage())
            item.imageInsets = UIEdgeInsetsMake(2, 0, -10, 0)
            controller.tabBarItem = item
            controllers.append(controller)
        }
        setViewControllers(controllers, animated: false)
    }

    

}
