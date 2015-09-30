import UIKit

public extension UITableView {
    public typealias CellFactory = String -> UITableViewCell

    public func dequeueReusableCellWithIdentifier(identifier: String, orCreateWith cellFactory: CellFactory) -> UITableViewCell {
        if let cell = dequeueReusableCellWithIdentifier(identifier) {
            return cell
        } else {
            return cellFactory(identifier)
        }
    }

    public func hideEmptySeparators() {
        tableFooterView = UIView()
    }
}
