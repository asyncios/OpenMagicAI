//
//  EditsViewController.swift
//  SampleApp
//
//  Created by admin on 9/03/23.
//

import UIKit
import OpenMagicAI

final class EditsViewController: ItemViewController {

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
        inputTextFields[1].isHidden = false
        inputTextFields[1].placeholder = "Instruction"
        for button in buttons {
            button.isHidden = true
        }
        buttons[0].isHidden = false
        buttons[0].setTitle("Create Edit", for: .normal)
    }
    
    override func firstOnTouch(_ sender: Any) {
        guard let input = getInputValidated(inputTextFields[0]), let instruction = getInputValidated(inputTextFields[1]) else {
            return
        }
        view.endEditing(true)
        showLoadingView()
        openMagicAI.edits.createEdit(input: input, instruction: instruction) { [weak self] result in
            DispatchQueue.main.async {
                self?.hideLoadingView()
            }
            debugPrint(result)
        }
    }
}
