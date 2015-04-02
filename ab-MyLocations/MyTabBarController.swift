//
//  MyTabBarController.swift
//  ab-MyLocations
//
//  Created by Aaron Bradley on 4/1/15.
//  Copyright (c) 2015 Aaron Bradley. All rights reserved.
//

import UIKit

class MyTabBarController: UITabBarController {
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }

    override func childViewControllerForStatusBarStyle() -> UIViewController? {
        return nil
    }
}
