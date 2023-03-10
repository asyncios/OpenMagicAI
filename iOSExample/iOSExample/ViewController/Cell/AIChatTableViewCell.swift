//
//  AIChatTableViewCell.swift
//  iOSExample
//
//  Created by admin on 9/03/23.
//

import UIKit

final class AIChatTableViewCell: UITableViewCell {

    @IBOutlet weak var messageLabel: UILabel!
    static let identifier = "AIChatTableViewCell"

    override func prepareForReuse() {
        super.prepareForReuse()
        messageLabel.text = ""
    }

    var item: ChatItem? {
        didSet {
            messageLabel.text = item?.message
        }
    }
}
