//
//  ViewController.swift
//  iOSExample
//
//  Created by admin on 9/03/23.
//

import UIKit
import OpenMagicAI

final class ViewController: UIViewController {

    @IBOutlet private weak var promptLabel: UITextField!
    
    private let openMagicAI = OpenMagicAI(apiKey: "")

    override func viewDidLoad() {
        super.viewDidLoad()
        updateTitle()
    }

    private func updateTitle() {
        navigationItem.title = "Open Magic AI"
    }

    @IBAction func createCompletionOnTouch(_ sender: Any) {
        guard let prompt = promptLabel.text, !prompt.isEmpty else {
            return
        }
        openMagicAI.completions.createCompletion(prompt: prompt) { result in
            debugPrint(result)
        }
    }

    @IBAction func createImageOnTouch(_ sender: Any) {
        guard let prompt = promptLabel.text, !prompt.isEmpty else {
            return
        }
        openMagicAI.images.generations(prompt: prompt) { result in
            debugPrint(result)
        }
    }
    
    @IBAction func createEditOnTouch(_ sender: Any) {
        guard let prompt = promptLabel.text, !prompt.isEmpty else {
            return
        }
        openMagicAI.edits.createEdit(instruction: prompt) { result in
            debugPrint(result)
        }
    }
    @IBAction func listModelsOnTouch(_ sender: Any) {
        openMagicAI.models.listModels { result in
            debugPrint(result)
        }
    }
}

