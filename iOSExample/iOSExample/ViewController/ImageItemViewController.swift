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


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
