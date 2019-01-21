//
//  SecondScreenModel.swift
//  WordCounter
//
//  Created by Ангелина Мамехина on 1/13/19.
//  Copyright © 2019 Me. All rights reserved.
//

import Foundation
import RxSwift

class PrimeWordsCountModel {
    
    func getDictOfWordsWithPrimeCounts() -> Observable<[String : Int]> {
        return Observable<[String : Int]>.create({ (observer) -> Disposable in
            let dictOfWordsAndCounts = WordCounter.calculateWordsCountInText(text: MakeStringFromText.transformTextToString())
            let dictOfWordsWithPrimeCounts = PrimeWordsCountsInText.getPrimeCounts(dictOfWordsAndCounts: dictOfWordsAndCounts)
            
            observer.onNext(dictOfWordsWithPrimeCounts)
            return Disposables.create()
        }).subscribeOn(ConcurrentDispatchQueueScheduler(qos: .background))
    }
}
