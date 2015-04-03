import Foundation

extension NSNotificationCenter {
    
    class func addObserver(#callback: (NSNotification!) -> (), name: String? = nil, object: AnyObject? = nil, queue: NSOperationQueue? = nil) {
        defaultCenter().addObserverForName(name, object: object, queue: nil, usingBlock: callback)
    }
    
}