//
//  UIViewController.swift
//  SampleApp
//
//  Created by admin on 9/03/23.
//

import UIKit

extension UIViewController {

    func getInputValidated(_ textField: UITextField) -> String? {
        guard let value = textField.text, !value.isEmpty else {
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
