import UIKit

public extension UITableView {
    typealias CellFactory = (String) -> UITableViewCell

    func dequeueReusableCellWithIdentifier(_ identifier: String, orCreateWith cellFactory: CellFactory) -> UITableViewCell {
        if let cell = dequeueReusableCell(withIdentifier: identifier) {
            return cell
        } else {
            return cellFactory(identifier)
        }
    }

    func hideEmptySeparators() {
        tableFooterView = UIView()
    }
}
