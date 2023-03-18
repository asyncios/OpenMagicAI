//
//  EmbeddingsViewController.swift
//  SampleApp
//
//  Created by admin on 14/03/23.
//

import UIKit
import OpenMagicAI

final class EmbeddingsViewController: ItemViewController {

    init() {
        super.init(nibName: "ItemViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        for item in inputTextFields {
            item.isHidden = true
        }
        inputTextFields[0].isHidden = false
        inputTextFields[0].placeholder = "Input"
        for item in buttons {
            item.isHidden = true
        }
        buttons[0].isHidden = false
        buttons[0].setTitle("Create Embeddings", for: .normal)
    }

    override func firstOnTouch(_ sender: Any) {
        guard let input = getInputValidated(inputTextFields[0]) else {
            return
        }
        view.endEditing(true)
        resultTextView.text = ""
        showLoadingView()
        openMagicAI.embeddings.createEmbeddings(input: .string(input)) { [weak self] result in
            DispatchQueue.main.async {
                self?.hideLoadingView()
                self?.display(result: result)
            }
            debugPrint(result)
        }
    }
}
