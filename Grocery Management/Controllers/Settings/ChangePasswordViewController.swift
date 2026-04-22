//
//  ChangePasswordViewController.swift
//  Grocery Management
//
//  Created by mac on 05/05/2025.
//

import UIKit

class ChangePasswordViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Change Password"
        
        self.setupNavigationBackButton(){
            self.navigationController?.popViewController(animated: true)
        }
        
    }
    


}
