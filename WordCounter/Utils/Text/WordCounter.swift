//
//  MakeWordsFromText.swift
//  TestTaskTests
//
//  Created by Ангелина Мамехина on 1/12/19.
//  Copyright © 2019 anhelina.mamekhina. All rights reserved.
//

import Foundation

public class WordCounter {
    
    public static func calculateWordsCountInText(text: String) -> [String : Int] {
        var wordsCount: [String : Int] = [:]
        
        let chararacterSet = CharacterSet.whitespacesAndNewlines.union(.punctuationCharacters)
        let components = text.components(separatedBy: chararacterSet)
        let words = components.filter{!$0.isEmpty}  
        
        for word in words {
            if wordsCount.keys.contains(word) {
                if var currentWordCount = wordsCount[word] {
                    currentWordCount += 1
                    wordsCount[word] = currentWordCount
                }
            } else {
                wordsCount[word] = 1
            }
        }
        
        return wordsCount
    }
}
