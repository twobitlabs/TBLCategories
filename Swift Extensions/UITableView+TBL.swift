import UIKit

public extension UITableView {
    public typealias CellFactory = (String) -> UITableViewCell

    public func dequeueReusableCellWithIdentifier(_ identifier: String, orCreateWith cellFactory: CellFactory) -> UITableViewCell {
        if let cell = dequeueReusableCell(withIdentifier: identifier) {
            return cell
        } else {
            return cellFactory(identifier)
        }
    }

    public func hideEmptySeparators() {
        tableFooterView = UIView()
    }
}
