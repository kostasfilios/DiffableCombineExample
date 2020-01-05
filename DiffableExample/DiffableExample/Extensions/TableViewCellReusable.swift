//
//  TableViewCellReusable.swift
//  BlueBrown
//
//  Created by Kostas Filios.
//  Copyright © 2018  BlueBrown. All rights reserved.
//

import UIKit

protocol TableViewCellReusable {
    static var cellIdentifier: String { get }
    static var nibIdentifier: String { get }
    
    static func dequeueInTableView(_ tableView: UITableView, forIndexPath: IndexPath) -> Self
}

extension UITableViewCell {
    fileprivate class func dequeueInTableView<T: UITableViewCell>(_ tableView: UITableView, forIndexPath: IndexPath, type: T.Type) -> T {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier) as? T
        if let cell = cell {
            return cell
        } else {
            tableView.register(UINib(nibName: String(describing: self), bundle: nil), forCellReuseIdentifier: self.cellIdentifier)
            return tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: forIndexPath) as! T
        }
    }
}

extension UITableViewCell: TableViewCellReusable {
    static var cellIdentifier: String { return String("\(self)Identifier") }
    static var nibIdentifier: String { return String(describing: self) }
    
    class func dequeueInTableView(_ tableView: UITableView, forIndexPath: IndexPath) -> Self {
        return dequeueInTableView(tableView, forIndexPath: forIndexPath, type: self)
    }
}

