//
//  MainViewController.swift
//  StepikSwift1M4_2
//
//  Created by Ivan Vasilyev on 28/07/2019.
//  Copyright © 2019 Ivan Vasilyev. All rights reserved.
//

import UIKit 

class MainViewController: UIViewController {
    
    var username: String!
    
    @IBOutlet weak var Label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Label.text = "Привет, \(username!)!"
    }
}

extension MainViewController: SetUsernameDelegate {
    func didSubmitUsername(username: String) {
        Label.text = "Привет, \(username)!"
    }
}


