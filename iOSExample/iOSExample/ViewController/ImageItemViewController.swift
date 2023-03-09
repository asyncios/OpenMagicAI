//
//  ImageItemViewController.swift
//  iOSExample
//
//  Created by admin on 9/03/23.
//

import UIKit

final class ImageItemViewController: UIViewController {

    @IBOutlet weak var iconImageView: UIImageView!
    var imageUrlString: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        guard let imageUrlString = imageUrlString, let url = URL(string: imageUrlString) else {
            return
        }
        iconImageView.load(url: url)
    }

}
