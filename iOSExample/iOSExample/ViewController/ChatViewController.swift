//
//  ChatViewController.swift
//  iOSExample
//
//  Created by admin on 9/03/23.
//

import UIKit
import OpenMagicAI

class ChatViewController: UIViewController, Loadable {

    @IBOutlet weak var messageTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func sendOnTouch(_ sender: Any) {
        guard let content = getInputValidated() else {
            return
        }
        showLoadingView()
        openMagicAI.chat.chatCompletion(messages: [.init(role: .assistant, content: content)]) { [weak self] result in
            DispatchQueue.main.async {
                self?.hideLoadingView()
            }
            debugPrint(result)
        }
    }
    
    func getInputValidated() -> String? {
        guard let value = messageTextField.text, !value.isEmpty else {
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
