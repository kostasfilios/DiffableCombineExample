//
//  ViewController.swift
//  DiffableExample
//
//  Created by Kostas Filios on 16/10/19.
//  Copyright © 2019 Kostas Filios. All rights reserved.
//

import UIKit
import Combine

enum Section: CaseIterable {
    case user
    case family
    case coworkers
}

class DiffableViewController: UIViewController {
    
    @IBOutlet private var tableView: UITableView!
    @IBOutlet private var loadingIndicator: UIActivityIndicatorView!
    private lazy var dataSource = makeDataSource()
    private var diffableViewModel = DIffableViewModel()
    private var response: ViewState<[User]> = .loading {
        didSet {
            handle(response: response)
        }
    }
    private var diffableViewModelSubscriber: AnyCancellable?
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = dataSource
        diffableViewModelSubscriber = diffableViewModel.$response
            .receive(on: DispatchQueue.main)
            .assign(to: \.response, on: self)
    }
    
    deinit {
        diffableViewModelSubscriber?.cancel()
    }
    
    private func handle(response: ViewState<[User]>?) {
        switch response ?? .loading {
        case .loading:
            loadingIndicator.isHidden = false
            break
        case .error(_):
            break
        case .loaded(let data):
            loadingIndicator.isHidden = true
            insert(list: data) }
    }
}


private extension DiffableViewController {
    func makeDataSource() -> UITableViewDiffableDataSource<Section, User> {
        return UITableViewDiffableDataSource(
            tableView: tableView,
            cellProvider: {  tableView, indexPath, user in
                let cell = UserTableViewCell.dequeueInTableView(tableView, forIndexPath: indexPath)
                cell.configureCell(with: user)
                return cell
            }
        )
    }
    
    private func insert(list: [User], animated: Bool? = true) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, User>()
        snapshot.appendSections([Section.user])
        snapshot.appendItems(list)
        dataSource.apply(snapshot, animatingDifferences: animated ?? true)
    }
    
}
