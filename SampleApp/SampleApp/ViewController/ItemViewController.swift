//
//  ItemViewController.swift
//  SampleApp
//
//  Created by admin on 9/03/23.
//

import UIKit
import OpenMagicAI

class ItemViewController: UIViewController, Loadable {

    @IBOutlet var inputTextFields: [UITextField]!
    @IBOutlet var buttons: [UIButton]!

    override func viewDidLoad() {
        super.viewDidLoad()
        addGestureForDismiss()
    }

    @IBAction func firstOnTouch(_ sender: Any) {
    }

    @IBAction func secondOnTouch(_ sender: Any) {
    }

    private func addGestureForDismiss() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(Self.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }

    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
}
