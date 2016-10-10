//
//  UIScrollView+TBL.swift
//  TeamStream
//
//  Created by Jeremy Medford on 9/30/15.
//  Copyright © 2015 Bleacher Report. All rights reserved.
//

import Foundation
import UIKit

public extension UIScrollView {
    
    public func scrollToTop() {
        self.setContentOffset(CGPoint(x: 0, y: -self.contentInset.top), animated: true)
    }
}
