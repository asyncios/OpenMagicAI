//
//  ItemViewController.swift
//  iOSExample
//
//  Created by admin on 9/03/23.
//

import UIKit
import OpenMagicAI

class ItemViewController: UIViewController, Loadable {

    let openMagicAI = OpenMagicAI(apiKey: "")
    @IBOutlet var inputTextFields: [UITextField]!
    @IBOutlet var buttons: [UIButton]!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func firstOnTouch(_ sender: Any) {
    }

    @IBAction func secondOnTouch(_ sender: Any) {
    }

    func getFirstInputValidated() -> String? {
        guard let value = inputTextFields[0].text, !value.isEmpty else {
            inputAlert()
            return nil
        }
        return value
    }

    func getSecondInputValidated() -> String? {
        guard let value = inputTextFields[1].text, !value.isEmpty else {
            inputAlert()
            return nil
        }
        return value
    }

    func inputAlert() {
        let alert = UIAlertController(
            title: "OpenMagicAI",
            message: "No Input",
            preferredStyle: .alert
        )
        alert.addAction(.init(title: "Ok", style: .default))
        present(alert, animated: true)
    }
}
