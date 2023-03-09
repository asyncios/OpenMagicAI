//
//  ModelsViewController.swift
//  iOSExample
//
//  Created by admin on 9/03/23.
//

import UIKit
import OpenMagicAI

final class ModelsViewController: ItemViewController {

    init() {
        super.init(nibName: "ItemViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        promptLabel.isHidden = true
        for button in buttons {
            button.isHidden = true
        }
        buttons[0].isHidden = false
        buttons[0].setTitle("List Models", for: .normal)
    }
    

    override func firstOnTouch(_ sender: Any) {
        showLoadingView()
        openMagicAI.models.listModels { [weak self] result in
            DispatchQueue.main.async {
                self?.hideLoadingView()
            }
            debugPrint(result)
        }
    }
}
