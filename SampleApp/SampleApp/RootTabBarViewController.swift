//
//  RootTabBarViewController.swift
//  SampleApp
//
//  Created by admin on 9/03/23.
//

import UIKit

final class RootTabBarViewController: UITabBarController {

    private lazy var completionsViewController: CompletionsViewController = {
        let viewController = CompletionsViewController()
        viewController.tabBarItem.title = "Completions"
        viewController.tabBarItem.image = .init(systemName: "terminal")
        return viewController
    }()

    private lazy var imagesViewController: ImagesViewController = {
        let viewController = ImagesViewController()
        viewController.tabBarItem.title = "Images"
        viewController.tabBarItem.image = .init(systemName: "photo")
        return viewController
    }()

    private lazy var chatViewController: ChatViewController = {
        let viewController = ChatViewController()
        viewController.tabBarItem.title = "Chat"
        viewController.tabBarItem.image = .init(systemName: "message")
        return viewController
    }()

    private lazy var modelsViewController: ModelsViewController = {
        let viewController = ModelsViewController()
        viewController.tabBarItem.title = "Models"
        viewController.tabBarItem.image = .init(systemName: "list.bullet")
        return viewController
    }()

    private lazy var editsViewController: EditsViewController = {
        let viewController = EditsViewController()
        viewController.tabBarItem.title = "Edits"
        viewController.tabBarItem.image = .init(systemName: "pencil.line")
        return viewController
    }()

    private lazy var embeddingsViewController: EmbeddingsViewController = {
        let viewController = EmbeddingsViewController()
        viewController.tabBarItem.title = "Embeddings"
        viewController.tabBarItem.image = .init(systemName: "scale.3d")
        return viewController
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllers = [
            completionsViewController,
            imagesViewController,
            chatViewController,
            modelsViewController,
            editsViewController,
            embeddingsViewController
        ]
    }

}
