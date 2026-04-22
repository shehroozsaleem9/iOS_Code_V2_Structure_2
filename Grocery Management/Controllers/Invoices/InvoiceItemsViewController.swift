//
//  InvoiceItemsViewController.swift
//  Grocery Management
//
//  Created by mac on 15/05/2025.
//

import UIKit

class InvoiceItemsViewController: UIViewController {
    var invoiceTitle: String
     
    init(invoiceTitle: String) {
        self.invoiceTitle = invoiceTitle
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        self.invoiceTitle = ""
        super.init(coder: coder)
    }
    
    @IBAction func AddBucketItems(_ sender: Any) {
        let board = UIStoryboard(name: "Invoice", bundle: nil)
        let controller = board.instantiateViewController(identifier: "AddInvoiceItemViewController")
        self.navigationController?.pushViewController(controller, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = invoiceTitle
        
        self.setupNavigationBackButton(){
            self.navigationController?.popViewController(animated: true)
        }
        
    }
}
