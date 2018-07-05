//: Playground - noun: a place where people can play

import UIKit
import RxSwift


public func example(of description: String, action: () -> Void) {
    print("\n----- Example of : " , description , "-----")
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
    
    let secondSubject = subject.subscribe { event in
        print("subscribe 2 : " , event.element ?? event)
    }
    subject.onNext("Thired Element")
    subject.onCompleted()
    let disposeBag = DisposeBag()
    
    subject.subscribe {event in
        print("subscribe 3 : " , event.element ?? event)
    }.disposed(by: disposeBag)
    subject.onNext("fourth element")
}

enum myError: Error {
    case anError_Code
}

example(of: "BehaviorSubject") {
    let subject = BehaviorSubject(value: "Inital Value")
    
    let disposeBag = DisposeBag()
    
    subject.on(.next("second Initial"))
    subject.subscribe { event in
        print("behavior 1 : " , event.element ?? event)
    }.disposed(by: disposeBag)
    
    subject.on(.error(myError.anError_Code))
    subject.subscribe { event in
        print("behavior 2 :" , event.element ?? event)
    }
}

example(of: "Replay Subject") {
    
    let subject = ReplaySubject<String>.create(bufferSize: 2)
    
    let disposeBag = DisposeBag()
    
    subject.onNext("First Element")
    subject.onNext("Second Element")
    subject.onNext("thierd Element")
    
    subject.subscribe {
        print("First Subscribe : " , $0.element ?? $0)
        }.disposed(by: disposeBag)
    
    subject.subscribe {
        print("Second Subescribe : " , $0.element ?? $0)
        }.disposed(by: disposeBag)
    subject.onNext("fourth element")
    subject.onError(myError.anError_Code)
    subject.subscribe {
        print("Thierd Replay : " , $0.element ?? $0)
        }.disposed(by: disposeBag)
    
    
    
}

