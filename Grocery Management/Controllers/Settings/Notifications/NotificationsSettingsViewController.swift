//
//  NotificationsViewController.swift
//  Grocery Management
//
//  Created by mac on 05/05/2025.
//

import UIKit

class NotificationsSettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupNavigationBackButton {
            self.navigationController?.popViewController(animated: true)
        }
    }
    

}
