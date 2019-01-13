//
//  Model.swift
//  TestTask
//
//  Created by Ангелина Мамехина on 1/12/19.
//  Copyright © 2019 anhelina.mamekhina. All rights reserved.
//

import Foundation

class WordsCountModel {
    
    var delegate: TextProcessingDelegate?
    
    func getDictOfWordsAndCounts() {
        //backgroud
        DispatchQueue.global(qos: .background).async {
            let words = MakeStringFromText.transformTextToString()
            let dictOfWordsAndCounts = WordCounter.calculateWordsCountInText(text: words)
            
            //ui
            DispatchQueue.main.async {
                self.delegate?.textProcessed(textDictionary: dictOfWordsAndCounts)
            }
        }
    }
}
