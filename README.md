# DiffableCombineExample
This is an example with usage od DiffableDatasource with Combine framework at MVVM pattern.


```
func makeDataSource() -> UITableViewDiffableDataSource<Section, User> {
        return UITableViewDiffableDataSource(
            tableView: tableView,
            cellProvider: {  tableView, indexPath, user in
                let cell = UserTableViewCell.dequeueInTableView(tableView, forIndexPath: indexPath)
                cell.configureCell(with: user)
                return cell
            })
    }
 ```
