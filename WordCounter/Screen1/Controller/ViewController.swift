//
//  ViewController.swift
//  TestTask
//
//  Created by anhelina.mamekhina on 1/11/19.
//  Copyright © 2019 anhelina.mamekhina. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    let model = WordsCountModel()
    let disposeBag = DisposeBag()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.layer.cornerRadius = 10
        textProcessed()
    }
    
    override func viewDidAppear(_ animated: Bool) {
//        WaitManager.addSpinner(controller: self)
    }
    
    func textProcessed() {
        model.getDictOfWordsAndCounts().bind(to: tableView.rx.items(cellIdentifier: "Cell", cellType: ListOfWordsCell.self)) {
            row, dictOfWordsAndCounts, cell in
            
            cell.countLabel.text = "\(dictOfWordsAndCounts.value)"
            cell.wordLabel.text = "\(dictOfWordsAndCounts.key)"
            } .disposed(by: disposeBag)
        
        WaitManager.dismissSpinner(controller: self)
    }
}
