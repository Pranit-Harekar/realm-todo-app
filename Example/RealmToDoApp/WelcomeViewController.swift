//
//  WelcomeViewController.swift
//  RealmToDoApp
//
//  Created by pranit-harekar on 04/28/2018.
//  Copyright (c) 2018 pranit-harekar. All rights reserved.
//

import UIKit
import RealmSwift

class WelcomeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        title = "Welcome"
        
        if let _ = SyncUser.current {
            // We have already logged in here!
            self.navigationController?.pushViewController(ItemsViewController(), animated: true)
        } else {
            let alertController = UIAlertController(title: "Login to Realm Cloud", message: "Supply a nice nickname!", preferredStyle: .alert)
            
            alertController.addAction(UIAlertAction(title: "Login", style: .default, handler: { [unowned self]
                alert -> Void in
                let textField = alertController.textFields![0] as UITextField
                let creds = SyncCredentials.nickname(textField.text!, isAdmin: true)
                
                SyncUser.logIn(with: creds, server: Constants.AUTH_URL, onCompletion: { [weak self](user, err) in
                    if let _ = user {
                        self?.navigationController?.pushViewController(ItemsViewController(), animated: true)
                    } else if let error = err {
                        fatalError(error.localizedDescription)
                    }
                })
            }))
            alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            alertController.addTextField(configurationHandler: {(textField : UITextField!) -> Void in
                textField.placeholder = "A Name for your user"
            })
            self.present(alertController, animated: true, completion: nil)
        }
    }
}

