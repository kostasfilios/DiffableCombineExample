# DiffableCombineExample
This is an example with usage od DiffableDatasource with Combine framework at MVVM pattern.

1) We create our DiffableDatasource
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

2) We make a Published response to use it for emiting changes over combine framework

```
    @Published var response: ViewState<[User]> = .loading
 ```
 
 3) We hande the response over a ViewState enum 

```
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
    ````
