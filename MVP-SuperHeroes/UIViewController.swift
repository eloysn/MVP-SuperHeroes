//
//  UIViewController.swift
//  MVP-SuperHeroes
//
//  Created by appsistemas on 19/4/18.
//  Copyright © 2018 eloysn. All rights reserved.
//

import UIKit

extension UIViewController {
    // MARK:- show alert
    func showAlert(_ title: String, description: String) {
        
        let alertController = UIAlertController(
            title: title,
            message: description,
            preferredStyle: .alert
        )
        
        let dismissAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(dismissAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
}
