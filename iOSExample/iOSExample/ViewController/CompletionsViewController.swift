//
//  CompletionsViewController.swift
//  iOSExample
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
        for button in buttons {
            button.isHidden = true
        }
        buttons[0].isHidden = false
        buttons[0].setTitle("Create Completion", for: .normal)
    }

    override func firstOnTouch(_ sender: Any) {
        guard let prompt = getPromptValidated() else {
            return
        }
        openMagicAI.completions.createCompletion(prompt: prompt) { result in
            debugPrint(result)
        }
    }
}
