//
//  LabelEditViewController.swift
//  StepikSwift1M4_2
//
//  Created by Ivan Vasilyev on 24/07/2019.
//  Copyright © 2019 Ivan Vasilyev. All rights reserved.
//

import UIKit

class LabelEditViewController: UIViewController, UITextFieldDelegate {

    var usernameDelegate: SetUsernameDelegate!
    var username: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelField.text = username
        labelField.delegate = self
    }

    @IBOutlet weak var labelField: UITextField!
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        if let nextField = textField.superview?.viewWithTag(textField.tag + 1) as? UITextField {
            nextField.becomeFirstResponder()
        } else {
            // Not found, so remove keyboard.
            textField.resignFirstResponder()
        }
        // Do not add a line break
        return false
    }
    
    @IBAction func didEdit(_ sender: UITextField) {
        guard labelField.text != nil else {
            return
        }
        username = labelField.text!
        usernameDelegate.didSubmitUsername(username: username)
        tabBarController?.selectedIndex = 0
    }
}
