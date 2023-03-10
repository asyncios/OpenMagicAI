//
//  RootTabBarViewController.swift
//  iOSExample
//
//  Created by admin on 9/03/23.
//

import UIKit

final class RootTabBarViewController: UITabBarController {

    private lazy var completionsViewController: CompletionsViewController = {
        let viewController = CompletionsViewController()
        viewController.tabBarItem.title = "Completions"
        return viewController
    }()

    private lazy var imagesViewController: ImagesViewController = {
        let viewController = ImagesViewController()
        viewController.tabBarItem.title = "Images"
        return viewController
    }()

    private lazy var editsViewController: EditsViewController = {
        let viewController = EditsViewController()
        viewController.tabBarItem.title = "Edits"
        return viewController
    }()

    private lazy var modelsViewController: ModelsViewController = {
        let viewController = ModelsViewController()
        viewController.tabBarItem.title = "Models"
        return viewController
    }()

    private lazy var chatViewController: ChatViewController = {
        let viewController = ChatViewController()
        viewController.tabBarItem.title = "Chat"
        return viewController
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllers = [
            completionsViewController, imagesViewController, editsViewController, modelsViewController, chatViewController
        ]
    }

}
