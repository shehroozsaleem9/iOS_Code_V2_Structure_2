//
//  BucketItemsViewController.swift
//  Grocery Management
//
//  Created by mac on 01/05/2025.
//

import UIKit

class BucketItemsViewController: UIViewController {
    var bucketTitle: String
     
    init(bucketTitle: String) {
        self.bucketTitle = bucketTitle
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        self.bucketTitle = ""
        super.init(coder: coder)
    }
    
    @IBAction func AddBucketItems(_ sender: Any) {
        let board = UIStoryboard(name: "bucket", bundle: nil)
        let controller = board.instantiateViewController(identifier: "AddBucketItemViewController")
        self.navigationController?.pushViewController(controller, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = bucketTitle
        
        self.setupNavigationBackButton(){
            self.navigationController?.popViewController(animated: true)
        }
        
    }
}
