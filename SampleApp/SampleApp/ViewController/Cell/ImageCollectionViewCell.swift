//
//  ImageCollectionViewCell.swift
//  SampleApp
//
//  Created by admin on 18/03/23.
//

import UIKit

final class ImageCollectionViewCell: UICollectionViewCell {

    static let identifier = "ImageCollectionViewCell"

    @IBOutlet private weak var iconImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        iconImageView.image = nil
    }

    var image: UIImage? {
        didSet {
            iconImageView.image = image
        }
    }

    override var isSelected: Bool {
        didSet {
            if isSelected {
                iconImageView.backgroundColor = .systemBlue
            } else {
                iconImageView.backgroundColor = .clear
            }
        }
    }
}
