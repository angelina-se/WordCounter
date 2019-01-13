//
//  PrimeWordsCountsInText.swift
//  TestTaskTests
//
//  Created by Ангелина Мамехина on 1/12/19.
//  Copyright © 2019 anhelina.mamekhina. All rights reserved.
//

import Foundation

class PrimeWordsCountsInText {
    
    public static func getPrimeCounts(dictOfWordsAndCounts: Dictionary<String, Int>) -> Dictionary<String, Int>
    {
        var dictOfWordsAndPrimeCounts = [String : Int]()
        
        func isPrime(number: Int) -> Bool {
            switch number {
            case 0, 1:
                return false
            case 2, 3:
                return true
            default:
                for i in 2...Int(sqrt(Double(number))) {
                    if number % i == 0 {
                        return false
                    }
                }
                return true
            }
        }
        
        for (word, count) in dictOfWordsAndCounts {
            if isPrime(number: count) {
                dictOfWordsAndPrimeCounts[word] = count
            }
        }
        
        return dictOfWordsAndPrimeCounts
    }
}
