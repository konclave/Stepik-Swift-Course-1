//
//  LabelEditViewController.swift
//  StepikSwift1M4_2
//
//  Created by Ivan Vasilyev on 24/07/2019.
//  Copyright © 2019 Ivan Vasilyev. All rights reserved.
//

import UIKit

protocol SetCaptionDelegate {
    func didSubmitCaption(caption: String)
}

class LabelEditViewController: UIViewController {

    var captionDelegate: SetCaptionDelegate!
    var caption: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelField.text = caption
    }

    @IBOutlet weak var labelField: UITextField!
    @IBAction func onSubmitLabel(_ sender: Any) {
        guard labelField.text != nil else {
            return
        }
        captionDelegate.didSubmitCaption(caption: labelField.text!)
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onCancelLabelEdit(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
