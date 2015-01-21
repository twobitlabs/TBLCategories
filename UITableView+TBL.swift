//
//  UITableView+TBL.swift
//
//  Created by Christopher Pickslay on 1/21/15.
//

extension UITableView {
    public typealias CellFactory = String -> UITableViewCell

    func dequeueReusableCellWithIdentifier(identifier: String, orCreateWith cellFactory: CellFactory) -> UITableViewCell {
        if let cell = dequeueReusableCellWithIdentifier(identifier) as? UITableViewCell {
            return cell
        } else {
            return cellFactory(identifier)
        }
    }
}
