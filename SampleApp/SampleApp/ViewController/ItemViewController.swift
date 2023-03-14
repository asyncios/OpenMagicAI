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
    @IBOutlet var resultTextView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        addGestureForDismiss()
    }

    @IBAction func firstOnTouch(_ sender: Any) {
    }

    @IBAction func secondOnTouch(_ sender: Any) {
    }

    func display<T: Codable, E: Error>(result: Result<T, E>) {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        switch result {
        case .success(let success):
            do {
                let data = try encoder.encode(success)
                let string = String(data: data, encoding: .utf8)
                resultTextView.text = string
            } catch {
                resultTextView.text = "\(error)"
            }
        case .failure(let failure):
            resultTextView.text = "\(failure)"
        }
    }

    private func addGestureForDismiss() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(Self.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }

    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
}
