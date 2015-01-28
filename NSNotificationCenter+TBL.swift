//
//  NSNotificationCenter+TBL.swift
//
//  Created by Christopher Pickslay on 1/26/15.
//

    extension NSNotificationCenter {
        
        class func addObserver(#callback: (NSNotification!) -> (), name: String? = nil, object: AnyObject? = nil, queue: NSOperationQueue? = nil) {
            defaultCenter().addObserverForName(name, object: object, queue: nil, usingBlock: callback)
        }
        
    }