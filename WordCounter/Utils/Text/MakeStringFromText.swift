//
//  MakeStringFromText.swift
//  TestTask
//
//  Created by Ангелина Мамехина on 1/12/19.
//  Copyright © 2019 anhelina.mamekhina. All rights reserved.
//

import Foundation

public class MakeStringFromText {
    
    public static func transformTextToString() -> String {
        var text = ""
        
        if let path = Bundle.main.path(forResource: "TheHungerGames", ofType: "txt") {
            let fileManager = FileManager()
            let isFileExists = fileManager.fileExists(atPath: path)
            if isFileExists {
                let fileContent = fileManager.contents(atPath: path)
                if let fileAsString = String(data: fileContent!, encoding: String.Encoding.utf8) {
                    text = fileAsString.lowercased()
                }
            }
        }
        
        return text
    }
}
