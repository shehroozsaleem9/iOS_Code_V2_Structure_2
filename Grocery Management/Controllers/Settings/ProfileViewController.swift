//
//  ProfileViewController.swift
//  Grocery Management
//
//  Created by mac on 05/05/2025.
//

import UIKit

class ProfileViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Edit Profile"
        self.setupNavigationBackButton(){
            self.navigationController?.popViewController(animated: true)
        }
    }

}
