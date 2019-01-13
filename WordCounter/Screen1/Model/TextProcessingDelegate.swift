//
//  TextProcessingDelegate.swift
//  WordCounter
//
//  Created by Ангелина Мамехина on 1/13/19.
//  Copyright © 2019 Me. All rights reserved.
//

import Foundation

protocol TextProcessingDelegate {
    
    func textProcessed (textDictionary: Dictionary<String, Int>)
}
