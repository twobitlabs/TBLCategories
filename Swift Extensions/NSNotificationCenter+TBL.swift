import Foundation

public extension NSNotificationCenter {
    
    public class func addObserver(name: String? = nil, object: AnyObject? = nil, queue: NSOperationQueue? = nil, callback: (NSNotification!) -> ()) {
        defaultCenter().addObserverForName(name, object: object, queue: nil, usingBlock: callback)
    }
    
}