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
        guard let content = getInputValidated(messageTextField) else {
            return
        }
        showLoadingView()
        openMagicAI.chat.chatCompletion(messages: [.init(role: .user, content: content)]) { [weak self] result in
            DispatchQueue.main.async {
                self?.hideLoadingView()
            }
            debugPrint(result)
        }
    }
}
