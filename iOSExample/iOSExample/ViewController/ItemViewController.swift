//
//  ItemViewController.swift
//  iOSExample
//
//  Created by admin on 9/03/23.
//

import UIKit
import OpenMagicAI

class ItemViewController: UIViewController {

    let openMagicAI = OpenMagicAI(apiKey: "")
    @IBOutlet weak var promptLabel: UITextField!
    @IBOutlet var buttons: [UIButton]!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func firstOnTouch(_ sender: Any) {
    }

    @IBAction func secondOnTouch(_ sender: Any) {
    }

    func getPromptValidated() -> String? {
        guard let prompt = promptLabel.text, !prompt.isEmpty else {
            promptAlert()
            return nil
        }
        return prompt
    }

    func promptAlert() {
        let alert = UIAlertController(
            title: "OpenMagicAI",
            message: "No prompt",
            preferredStyle: .alert
        )
        alert.addAction(.init(title: "Ok", style: .default))
        present(alert, animated: true)
    }
}
