//: Playground - noun: a place where people can play

import UIKit
import RxSwift


public func example(of description: String, action: () -> Void) {
    print("\n Example of : " , description , "-----")
    action()
}


public enum Event<Element> {
    
    case next(Element)
    
    case error(Swift.Error)
    
    case completed
}

example(of : "PublishSubject") {
    
}

enum myError: Error {
    case anError_Code
}

