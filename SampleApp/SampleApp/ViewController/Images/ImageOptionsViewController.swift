//
//  ImageOptionsViewController.swift
//  SampleApp
//
//  Created by admin on 18/03/23.
//

import UIKit

final class ImageOptionsViewController: ListOptionsViewController {

    init() {
        super.init(nibName: "ListOptionsViewController", bundle: nil)
        self.rows = ["Create Image", "Create Image Edit"]
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Image Options"
    }

    override func getViewController(at indexPath: IndexPath) -> UIViewController {
        switch indexPath.row {
        case 0:
            return ImagesViewController()
        case 1:
            return ImageEditViewController()
        default:
            return .init()
        }
    }
}
