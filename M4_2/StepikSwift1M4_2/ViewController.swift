//
//  ViewController.swift
//  StepikSwift1M4_2
//
//  Created by Ivan Vasilyev on 24/07/2019.
//  Copyright © 2019 Ivan Vasilyev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    
    @IBAction func onTitleChangeTap(_ sender: Any) {
        let labelEditViewController = LabelEditViewController(nibName: "LabelEditViewController", bundle: nil)
        labelEditViewController.caption = label.text
        labelEditViewController.captionDelegate = self
        present(labelEditViewController, animated: true)
    }
}

extension ViewController: SetCaptionDelegate {
    func didSubmitCaption(caption: String) {
        self.label.text = caption
    }
}
