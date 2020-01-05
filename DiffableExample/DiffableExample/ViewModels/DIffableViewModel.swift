//
//  DIffableVIewModel.swift
//  DiffableExample
//
//  Created by Kostas Filios on 13/11/19.
//  Copyright © 2019 Kostas Filios. All rights reserved.
//

import Foundation
import Combine

class DIffableViewModel {
    
    @Published var response: ViewState<[User]> = .loading
    
    init() {
        DispatchQueue.global().asyncAfter(deadline: .now() + 2) { [weak self] in
            guard let `self` = self else { return }
            var userList = [User]()
            for i in 0...10 {
                userList.append(User(id: i, userName: "\(i)", depositAmmount: "\(i)"))
            }
            self.response = .loaded(userList)
            DispatchQueue.global().asyncAfter(deadline: .now() + 2) {
                self.response = .loading
            }
        }
        DispatchQueue.global().asyncAfter(deadline: .now() + 7) { [weak self] in
            guard let `self` = self else { return }
            var userList = [User]()
            for i in 0...40 {
                if ( i > 2 && i < 7) {
                    userList.append(User(id: i, userName: "\(i + 1)", depositAmmount: "\(i)"))
                } else {
                    userList.append(User(id: i, userName: "\(i)", depositAmmount: "\(i)"))
                }
            }
            self.response = .loaded(userList)
        }
    }
}

