//
//  HelpViewController.swift
//  Grocery Management
//
//  Created by mac on 13/05/2025.
//

import UIKit

class ContactUsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Contact us"
        self.setupNavigationBackButton(){
            self.navigationController?.popViewController(animated: true)
        }
    }
    


}
