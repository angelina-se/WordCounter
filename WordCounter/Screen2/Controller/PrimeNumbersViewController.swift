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
    
    var primeModel = PrimeWordsCountModel()
    let disposeBag = DisposeBag()
    
    @IBOutlet weak var primeTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        primeTableView.layer.cornerRadius = 10
        
        WaitManager.addSpinner(controller: self)
        makeBinding()
    }
    
    func makeBinding() {
        let countsResult = primeModel.getDictOfWordsWithPrimeCounts().share()
            
        countsResult
            .bind(to: primeTableView.rx.items(cellIdentifier: "CellPrime", cellType: WordsAndPrimeNumbersTableViewCell.self)) {
                row, wordsAndPrimeCounts, cell in
                
                cell.countLabel.text = "\(wordsAndPrimeCounts.value)"
                cell.wordLabel.text = "\(wordsAndPrimeCounts.key)"
            }.disposed(by: disposeBag)
        
        countsResult
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { _ in
                WaitManager.dismissSpinner(controller: self)
            })
            .disposed(by: disposeBag)
    }
}
