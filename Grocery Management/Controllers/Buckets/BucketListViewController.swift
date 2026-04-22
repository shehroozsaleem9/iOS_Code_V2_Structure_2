//
//  BucketListViewController.swift
//  Grocery Management
//
//  Created by mac on 30/04/2025.
//

import UIKit

class BucketListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Bucket List"
        
        self.setupNavigationBackButton(){
            self.navigationController?.dismiss(animated: true)
        }

    }
    
    @IBAction func addBucket(_ sender: Any) {
        let board = UIStoryboard(name: "bucket", bundle: nil)
        let controller = board.instantiateViewController(identifier: "AddBucketViewController")
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
}
