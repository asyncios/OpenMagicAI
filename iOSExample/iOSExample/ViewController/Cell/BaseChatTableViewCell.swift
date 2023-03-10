//
//  BaseChatTableViewCell.swift
//  iOSExample
//
//  Created by admin on 10/03/23.
//

import UIKit

class BaseChatTableViewCell: UITableViewCell {

    @IBOutlet weak var messageLabel: UILabel!

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
