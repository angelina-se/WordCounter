//
//  TestTaskTests.swift
//  TestTaskTests
//
//  Created by anhelina.mamekhina on 1/11/19.
//  Copyright © 2019 anhelina.mamekhina. All rights reserved.
//

import XCTest
@testable import WordCounter

class TestWordCounter: XCTestCase {

    func testMakeWordsFromString() {
        //given
        let givenText = "in the given section, set up any value needed: in this example, you create a value so you specify how much it differs from you"
        
        //expected
        let expected: [String: Int] = [
            "in" : 2,
            "the" : 1,
            "given" : 1,
            "section" : 1,
            "set" : 1,
            "up" : 1,
            "any" : 1,
            "value" : 2,
            "needed" : 1,
            "this" : 1,
            "example" : 1,
            "you" : 3,
            "create" : 1,
            "a" : 1,
            "so" : 1,
            "specify" : 1,
            "how" : 1,
            "much" : 1,
            "it" : 1,
            "differs" : 1,
            "from" : 1]
        
        //actual
        let actual = WordCounter.calculateWordsCountInText(text: givenText)
        
        XCTAssertEqual(expected, actual)
    }
    
    func testPrimeWordCountsInText() {
        
        //given
        let givenWordsAndCount = [
            "in" : 2,
            "the" : 1,
            "given" : 1,
            "section" : 1,
            "set" : 1,
            "up" : 1,
            "any" : 1,
            "value" : 2,
            "needed" : 1,
            "this" : 1,
            "example" : 1,
            "you" : 3,
            "create" : 1,
            "a" : 1,
            "so" : 1,
            "specify" : 1,
            "how" : 1,
            "much" : 1,
            "it" : 1,
            "differs" : 1,
            "from" : 1]
        
        //expected
        let primeNumberCount = [
        "in" : 2,
        "value" : 2,
        "you" : 3]
        
        //actual
        let actualResult = PrimeWordsCountsInText.getPrimeCounts(dictOfWordsAndCounts: givenWordsAndCount)
        
        XCTAssertEqual(primeNumberCount, actualResult)
    }
}
