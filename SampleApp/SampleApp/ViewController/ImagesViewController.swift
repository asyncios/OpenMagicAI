//
//  ImagesViewController.swift
//  SampleApp
//
//  Created by admin on 9/03/23.
//

import UIKit
import OpenMagicAI

final class ImagesViewController: ItemViewController {

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
        for button in buttons {
            button.isHidden = true
        }
        buttons[0].isHidden = false
        buttons[0].setTitle("Create Image", for: .normal)
    }
    

    override func firstOnTouch(_ sender: Any) {
        guard let prompt = getInputValidated(inputTextFields[0]) else {
            return
        }
        showLoadingView()
        openMagicAI.images.createImage(prompt: prompt) { [weak self] result in
            DispatchQueue.main.async {
                self?.hideLoadingView()
                if case .success(let value) = result,
                    let imageUrlString = value.data.first?.url {
                    let viewController = ImageItemViewController()
                    viewController.imageUrlString = imageUrlString
                    self?.present(viewController, animated: true)
                }
            }
            debugPrint(result)
        }
    }

}
