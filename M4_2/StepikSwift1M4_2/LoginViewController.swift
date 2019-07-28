//
//  LoginViewController.swift
//  StepikSwift1M4_2
//
//  Created by Ivan Vasilyev on 28/07/2019.
//  Copyright © 2019 Ivan Vasilyev. All rights reserved.
//

import UIKit

protocol SetUsernameDelegate {
    func didSubmitUsername(username: String)
}

class LoginViewController: UIViewController {
    
    var window: UIWindow?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBOutlet weak var usernameField: UITextField!
    
    @IBAction func onUsernameSubmit(_ sender: Any) {
        guard usernameField.text != nil else {
            return
        }
        
        window = UIWindow(frame: UIScreen.main.bounds)
    
        let tabBarController = UITabBarController()
        
        let mainViewController = MainViewController()
        mainViewController.username = usernameField.text!
        mainViewController.tabBarItem = UITabBarItem(title: "View", image: UIImage(named: "view"), tag: 0)
        
        let labelViewController = LabelEditViewController()
        labelViewController.username = usernameField.text!
        labelViewController.usernameDelegate = mainViewController
        labelViewController.tabBarItem = UITabBarItem(title: "Edit", image: UIImage(named: "edit"), tag: 0)
        
        tabBarController.viewControllers = [mainViewController, labelViewController]

        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()        
    }
}
