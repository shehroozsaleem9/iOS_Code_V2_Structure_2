//
//  AddBucketItemViewController.swift
//  Grocery Management
//
//  Created by mac on 01/05/2025.
//

import UIKit

class AddBucketItemViewController: UIViewController {

    @IBOutlet weak var buttonSubtract: UIButton!
    @IBOutlet weak var buttonPlus: UIButton!
    @IBOutlet weak var lbl_ItemCount: UILabel!
    @IBOutlet weak var tf_itemName: UITextField!
    var itmQty : Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Add New Item"
        self.setupNavigationBackButton(){
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    @IBAction func actionRemoveItem(_ sender: Any) {
        if(itmQty > 0){
            itmQty -= 1
        }
        lbl_ItemCount.text = String(itmQty)
    }
    
    @IBAction func actionAddItem(_ sender: Any) {
       
            itmQty += 1
        lbl_ItemCount.text = String(itmQty)
    }
}
