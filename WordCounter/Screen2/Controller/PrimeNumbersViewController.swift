//
//  PrimeNumbersViewController.swift
//  WordCounter
//
//  Created by Ангелина Мамехина on 1/13/19.
//  Copyright © 2019 Me. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class PrimeNumbersViewController: UIViewController {
   
    var wordsAndPrimeCounts: Dictionary<String, Int> = [:]
    var primeModel = PrimeWordsCountModel()
    let disposeBag = DisposeBag()
    
    @IBOutlet weak var primeTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        primeTableView.layer.cornerRadius = 10
        
        textProcessed()
    }
    
    override func viewDidAppear(_ animated: Bool) {
//        WaitManager.addSpinner(controller: self)
    }
    
    func textProcessed() {
        primeModel.getDictOfWordsWithPrimeCounts().bind(to: primeTableView.rx.items(cellIdentifier: "CellPrime", cellType: WordsAndPrimeNumbersTableViewCell.self)) {
            row, wordsAndPrimeCounts, cell in
            
            cell.countLabel.text = "\(wordsAndPrimeCounts.value)"
            cell.wordLabel.text = "\(wordsAndPrimeCounts.key)"
            } .disposed(by: disposeBag)
        WaitManager.dismissSpinner(controller: self)
    }
    
}
