//
//  InvoicesViewController.swift
//  Grocery Management
//
//  Created by mac on 29/04/2025.
//

import UIKit

class InvoicesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.largeContentTitle = "Grocery Invoices"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        // Do any additional setup after loading the view.
    }
    @IBAction func addInvoiceWithAI(_ sender: Any) {
        
    }
    @IBAction func addInvoice(_ sender: Any) {
        let bucketBoard = UIStoryboard(name: "Invoice", bundle: nil)
        let bucketController = bucketBoard.instantiateViewController(withIdentifier: "AddInvoiceViewController")
        bucketController.modalPresentationStyle = .fullScreen
        self.present(bucketController, animated: true)
    }
    
}
