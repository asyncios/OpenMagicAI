//
//  RootTabBarViewController.swift
//  iOSExample
//
//  Created by admin on 9/03/23.
//

import UIKit

class RootTabBarViewController: UITabBarController {

    lazy var completionsViewController: CompletionsViewController = {
        let viewController = CompletionsViewController()
        viewController.tabBarItem.title = "Completions"
        return viewController
    }()

    lazy var imagesViewController: ImagesViewController = {
        let viewController = ImagesViewController()
        viewController.tabBarItem.title = "Images"
        return viewController
    }()

    lazy var editsViewController: ItemViewController = {
        let viewController = ItemViewController()
        viewController.tabBarItem.title = "Edits"
        return viewController
    }()

    lazy var modelsViewController: ModelsViewController = {
        let viewController = ModelsViewController()
        viewController.tabBarItem.title = "Models"
        return viewController
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllers = [
            completionsViewController, imagesViewController, editsViewController, modelsViewController
        ]
    }

}
