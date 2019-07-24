//
//  ViewController.swift
//  StepikSwift1M4
//
//  Created by Ivan Vasilyev on 23/07/2019.
//  Copyright © 2019 Ivan Vasilyev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func onSubmit(_ sender: Any) {
        guard usernameField.text != "" && passwordField.text == "foo" else {
            return
        }
        
        let helloViewController = HelloViewController()
        helloViewController.username = usernameField.text!
        present(helloViewController, animated: true, completion: nil)
    }
    
}

