//
//  SecondScreenModel.swift
//  WordCounter
//
//  Created by Ангелина Мамехина on 1/13/19.
//  Copyright © 2019 Me. All rights reserved.
//

import Foundation

class PrimeWordsCountModel {
    
    var delegate: TextProcessingDelegate?
    
    func getDictOfWordsWithPrimeCounts() {
        //backgroud
        DispatchQueue.global(qos: .background).async {
            let dictOfWordsAndCounts = WordCounter.calculateWordsCountInText(text: MakeStringFromText.transformTextToString())
            let dictOfWordsWithPrimeCounts = PrimeWordsCountsInText.getPrimeCounts(dictOfWordsAndCounts: dictOfWordsAndCounts)
            
            //ui
            DispatchQueue.main.async {
                self.delegate?.textProcessed(textDictionary: dictOfWordsWithPrimeCounts)
            }
        }
    }
}
