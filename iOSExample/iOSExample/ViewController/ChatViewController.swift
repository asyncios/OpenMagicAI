//
//  ChatViewController.swift
//  iOSExample
//
//  Created by admin on 9/03/23.
//

import UIKit
import OpenMagicAI

final class ChatViewController: UIViewController, Loadable {

    @IBOutlet weak var messageTextField: UITextField!
    @IBOutlet weak var contentStackView: UIStackView!
    @IBOutlet weak var tableView: UITableView!
    private var messages: [ChatMessage] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewUi()
    }

    @IBAction func sendOnTouch(_ sender: Any) {
        guard let content = getInputValidated(messageTextField) else {
            return
        }
        showLoadingView()
        appendMessages([.init(role: "user", message: content)])
        openMagicAI.chat.chatCompletion(messages: [.init(role: .user, content: content)]) { [weak self] result in
            DispatchQueue.main.async {
                self?.hideLoadingView()
                if case .success(let value) = result {
                    var newMessages: [ChatMessage] = []
                    for item in value.choices {
                        newMessages.append(.init(role: item.message.role, message: item.message.content))
                    }
                    self?.appendMessages(newMessages)
                }
            }
            debugPrint(result)
        }
    }

}

private extension ChatViewController {

    func setupViewUi() {
        setupTableViewUi()
        addGestureForDismiss()
        addOnKeyboardConstraint()
    }

    func setupTableViewUi() {
        tableView.dataSource = self
        tableView.register(.init(nibName: UserChatTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: UserChatTableViewCell.identifier)
        tableView.register(.init(nibName: AIChatTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: AIChatTableViewCell.identifier)
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        tableView.estimatedRowHeight = 80
    }

    func addGestureForDismiss() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(Self.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }

    func addOnKeyboardConstraint() {
        view.keyboardLayoutGuide.followsUndockedKeyboard = true
        let onKeyboardConstraint = view.keyboardLayoutGuide.topAnchor.constraint(equalTo: contentStackView.bottomAnchor, constant: 0) // Mark 2
        view.keyboardLayoutGuide.setConstraints([onKeyboardConstraint], activeWhenAwayFrom: .top)
    }

    func appendMessages(_ array: [ChatMessage]) {
        if array.isEmpty {
            return
        }
        let size = messages.count
        var indexPaths: [IndexPath] = []
        for (index,_) in array.enumerated() {
            indexPaths.append(.init(row: size+index, section: 0))
        }
        messages.append(contentsOf: array)
        tableView.insertRows(at: indexPaths, with: .bottom)
    }

}

extension ChatViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = messages[indexPath.row]
        let role = item.role
        if role == "user" {
            let cell = tableView.dequeueReusableCell(withIdentifier: UserChatTableViewCell.identifier)! as! UserChatTableViewCell
            cell.item = item
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: AIChatTableViewCell.identifier)! as! AIChatTableViewCell
        cell.item = item
        return cell
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        messages.count
    }

}
