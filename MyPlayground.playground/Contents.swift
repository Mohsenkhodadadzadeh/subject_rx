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

example(of: "just , of , from ") {
    
    let one = 1
    let two = 2
    let three = 3
    
    let _ : Observable<Int> = Observable<Int>.just(one)
    _ = Observable.of(one , two , three)
    _ = Observable.of([one , two , three])
    
    _ = NotificationCenter.default.addObserver(forName: .UIKeyboardDidChangeFrame, object: nil, queue: nil, using: { notic in
        
    })
    
    
    let sequence = 0..<3
    var iterator = sequence.makeIterator()
    
    while let n = iterator.next() {
        print(n)
    }
}
example(of: "Subscribe") {
    let one = 1
    let two = 2
    let three = 3
    
    let observable = Observable.of(one , two , three)
    
    observable.subscribe { event in
        if let element = event.element {
            print(element)
        }
        print(event)
    }
  
}

example(of: "Empty") {
    let observable = Observable<Void>.empty()
    observable.subscribe (onNext : { element in
        print(element)
    } , onCompleted: {
        print("Completed nice")
    })
}

example(of: "never") {
    let observable = Observable<Any>.never()
    
    observable.subscribe (onNext: { element in
        print(element)
    } , onCompleted: {
        print(" never Completed")
    })
}
example(of: "range") {
    let observable = Observable<Int>.range(start: 1, count: 10)
    
    observable.subscribe(onNext: { i in
        print(i)
    })
    
}

example(of: "DisposeBag") {
    
    let disposeBag = DisposeBag()
    
    Observable.of("A" , "B" , "C").subscribe {
        print($0)
    }.disposed(by: disposeBag)
    
}
enum myError: Error {
    case anError_Code
}

example(of: "create") {
    
    let disposeBag = DisposeBag()
    
    Observable<String>.create { observe in
        observe.onNext("next element")
        //observe.onError(myError.anError_Code)
        //observe.onCompleted()
        
        observe.onNext("Second element")
        
        return Disposables.create()
        }.subscribe(
            onNext: { print($0)} ,
            onError: { print($0)} ,
            onCompleted: { print("Compeleted create")} ,
            onDisposed: { print("Dispoose")}
        )
    //.subscribe { event in
         //   print(event)
    //}
}




