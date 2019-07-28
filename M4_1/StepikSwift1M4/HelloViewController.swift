//
//  HelloViewController.swift
//  StepikSwift1M4
//
//  Created by Ivan Vasilyev on 24/07/2019.
//  Copyright © 2019 Ivan Vasilyev. All rights reserved.
//

import UIKit

class HelloViewController: UIViewController {

    @IBOutlet weak var helloLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        helloLabel.text = "Hello, \(self.username)"
        // Do any additional setup after loading the view.
    }
    
    public var username: String = ""


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
