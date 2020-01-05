//
//  UserTableViewCell.swift
//  DiffableExample
//
//  Created by Kostas Filios on 16/10/19.
//  Copyright © 2019 Kostas Filios. All rights reserved.
//

import UIKit

class UserTableViewCell: UITableViewCell {

    @IBOutlet private var userNameLabel: UILabel!
    @IBOutlet private var ammountLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(with user: User) {
        userNameLabel.text = user.userName
        ammountLabel.text = user.depositAmmount
    }
    
}
