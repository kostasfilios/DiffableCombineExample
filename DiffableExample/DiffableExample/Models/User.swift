//
//  User.swift
//  DiffableExample
//
//  Created by Kostas Filios on 16/10/19.
//  Copyright © 2019 Kostas Filios. All rights reserved.
//

import Foundation

struct User: Hashable {
    
    let id: Int
    let userName: String
    let depositAmmount: String
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: User, rhs: User) -> Bool {
        return lhs.id == rhs.id && lhs.userName == rhs.userName
    }
    
}
