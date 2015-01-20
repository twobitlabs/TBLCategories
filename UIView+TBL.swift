//
//  UIView+TBL.swift
//
//  Created by Christopher Pickslay on 1/15/15.
//

extension UIView {

    func top() -> CGFloat {
        return frame.origin.y
    }
    
    func bottom() -> CGFloat {
        return frame.origin.y + frame.size.height
    }
    
    func left() -> CGFloat {
        return frame.origin.x
    }
    
    func right() -> CGFloat {
        return frame.origin.x + frame.size.width
    }
    
    func height() -> CGFloat {
        return frame.size.height
    }
    
    func width() -> CGFloat {
        return frame.size.width
    }
    
}