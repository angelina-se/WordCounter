//
//  Model.swift
//  TestTask
//
//  Created by Ангелина Мамехина on 1/12/19.
//  Copyright © 2019 anhelina.mamekhina. All rights reserved.
//

import Foundation
import RxSwift

class WordsCountModel {
    
    func getDictOfWordsAndCounts() -> Observable<[String : Int]> {
        return Observable<[String : Int]>.create( {(observer) -> Disposable in
            print("thread observable 1 -> \(Thread.current)")
            let words = MakeStringFromText.transformTextToString()
            let dictOfWordsAndCounts = WordCounter.calculateWordsCountInText(text: words)
            
            observer.onNext(dictOfWordsAndCounts)
            
            return Disposables.create()
        }).subscribeOn(ConcurrentDispatchQueueScheduler(qos: .background))
    }
}
