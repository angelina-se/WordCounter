//
//  PrimeNumbersViewController.swift
//  WordCounter
//
//  Created by Ангелина Мамехина on 1/13/19.
//  Copyright © 2019 Me. All rights reserved.
//

import UIKit

class PrimeNumbersViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, TextProcessingDelegate {
   
    var wordsAndPrimeCounts: Dictionary<String, Int> = [:]
    var primeModel = PrimeWordsCountModel()
    @IBOutlet weak var primeTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        primeTableView.layer.cornerRadius = 10
        
        primeModel.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        WaitManager.addSpinner(controller: self)
        primeModel.getDictOfWordsWithPrimeCounts()
    }
    
    func textProcessed(textDictionary: Dictionary<String, Int>) {
        wordsAndPrimeCounts = textDictionary
        primeTableView.reloadData()
        
        WaitManager.dismissSpinner(controller: self)
    }

    //MARK: TableView methods
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "2nd part"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return wordsAndPrimeCounts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CellPrime", for: indexPath) as? WordsAndPrimeNumbersTableViewCell else { return UITableViewCell()}
        
        cell.wordLabel.text = "\(Array(wordsAndPrimeCounts.keys)[indexPath.row])"
        cell.countLabel.text = "\(Array(wordsAndPrimeCounts.values)[indexPath.row])"
        
        return cell
    }
}
