//
//  CompletionsViewController.swift
//  SampleApp
//
//  Created by admin on 9/03/23.
//

import UIKit
import OpenMagicAI

final class CompletionsViewController: ItemViewController {

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
        for item in buttons {
            item.isHidden = true
        }
        buttons[0].isHidden = false
        buttons[0].setTitle("Create Completion", for: .normal)
    }

    override func firstOnTouch(_ sender: Any) {
        guard let prompt = getInputValidated(inputTextFields[0]) else {
            return
        }
        showLoadingView()
        openMagicAI.completions.createCompletion(prompt: prompt) { [weak self] result in
            DispatchQueue.main.async {
                self?.hideLoadingView()
            }
            debugPrint(result)
        }
    }
}
