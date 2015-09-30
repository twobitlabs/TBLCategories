//
//  UIScrollView+TBL.swift
//  TeamStream
//
//  Created by Jeremy Medford on 9/30/15.
//  Copyright © 2015 Bleacher Report. All rights reserved.
//

import Foundation

public extension UIScrollView {
    
    public func scrollToTop() {
        self.setContentOffset(CGPointMake(0, -self.contentInset.top), animated: true)
    }
}