//
//  WaitManager.swift
//  WordCounter
//
//  Created by Ангелина Мамехина on 1/13/19.
//  Copyright © 2019 Me. All rights reserved.
//

import Foundation
import UIKit

class WaitManager {
    
    static func addSpinner(controller: UIViewController) {
        let alert = UIAlertController(title: nil, message: "Please wait...", preferredStyle: .alert)
        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.style = UIActivityIndicatorView.Style.gray
        loadingIndicator.startAnimating()
        
        alert.view.addSubview(loadingIndicator)
        controller.present(alert, animated: true, completion: nil)
    }
    
    static func dismissSpinner(controller: UIViewController) {
        controller.dismiss(animated: false, completion: nil)
    }
 
}
