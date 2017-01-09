//
//  ViewController.swift
//  ButtonLayout
//
//  Created by 杨卢青 on 2017/1/8.
//  Copyright © 2017年 杨卢青. All rights reserved.
//

import UIKit
import PageMenu

class ViewController: UIViewController {

  var pageMenu : CAPSPageMenu?
	var controllerArray : [UIViewController] = []
	
	override func viewDidLoad() {
		super.viewDidLoad()

    let controller1 = SearchCountryViewController()
    controller1.title = "国家"
    let controller2 = SearchCountryViewController()
    controller2.title = "城市"
    controllerArray.append(controller1)
    controllerArray.append(controller2)
    
    let parameters: [CAPSPageMenuOption] = [
      .menuItemSeparatorWidth(4.3),
      .useMenuLikeSegmentedControl(true),
      .menuItemSeparatorPercentageHeight(0.1)
    ]
    
    
    pageMenu = CAPSPageMenu(viewControllers: controllerArray, frame: view.bounds, pageMenuOptions: parameters)

    self.view.addSubview(pageMenu!.view)
	}
}

