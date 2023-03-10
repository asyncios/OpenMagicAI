//
//  UserChatTableViewCell.swift
//  iOSExample
//
//  Created by admin on 9/03/23.
//

import UIKit

final class UserChatTableViewCell: UITableViewCell {

    @IBOutlet weak var messageLabel: UILabel!
    static let identifier = "UserChatTableViewCell"
 
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
