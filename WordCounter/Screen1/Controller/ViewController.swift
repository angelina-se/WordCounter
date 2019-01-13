//
//  ViewController.swift
//  TestTask
//
//  Created by anhelina.mamekhina on 1/11/19.
//  Copyright © 2019 anhelina.mamekhina. All rights reserved.
//

import Foundation
import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, TextProcessingDelegate {
    
    var wordsCount: Dictionary<String, Int> = [:]
    let model = WordsCountModel()
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.layer.cornerRadius = 10
        
        model.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        WaitManager.addSpinner(controller: self)
        model.getDictOfWordsAndCounts()
    }
    
    func textProcessed(textDictionary: Dictionary<String, Int>) {
        wordsCount = textDictionary
        tableView.reloadData()
        
        WaitManager.dismissSpinner(controller: self)
    }
    
    // MARK: TableView methods
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "1st part"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return wordsCount.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? ListOfWordsCell else { return UITableViewCell()}
        
        cell.wordLabel.text = "\(Array(wordsCount.keys)[indexPath.row])"
        cell.countLabel.text = "\(Array(wordsCount.values)[indexPath.row])"
    
        return cell
    }
}
