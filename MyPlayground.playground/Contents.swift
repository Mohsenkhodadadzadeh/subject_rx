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
    let subject = PublishSubject<String>()
    subject.on(.next("Anyone listen to me"))
    
    let firstSubscribe = subject.subscribe (onNext :{ newString in
        print(newString)
        })
    subject.onNext("first Print")
    subject.on(.next("Second print"))
}

enum myError: Error {
    case anError_Code
}

