//
//  MainViewController.swift
//  StepikSwift1M4_2
//
//  Created by Ivan Vasilyev on 28/07/2019.
//  Copyright © 2019 Ivan Vasilyev. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var Label: UILabel!
    
    @IBAction func onChangeTap(_ sender: Any) {
        let labelEditViewController = LabelEditViewController(nibName: "LabelEditViewController", bundle: nil)
        labelEditViewController.caption = Label.text
        labelEditViewController.captionDelegate = self
        present(labelEditViewController, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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

extension MainViewController: SetCaptionDelegate {
    func didSubmitCaption(caption: String) {
        Label.text = caption
    }
}
