//
//  SearchViewController.swift
//  Grocery Management
//
//  Created by mac on 30/04/2025.
//

import UIKit

class SearchViewController: UIViewController,UISearchBarDelegate, UITextFieldDelegate {

    @IBOutlet weak var searchTF: UITextField!
    @IBOutlet weak var capsuleInvoices: UIButton!
    @IBOutlet weak var capsuleBucketList: UIButton!
    @IBOutlet weak var capsuleAll: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Search"
        self.capsuleAll.layer.cornerRadius = self.capsuleAll.frame.height/2
        self.capsuleBucketList.layer.cornerRadius = self.capsuleAll.frame.height/2
        self.capsuleInvoices.layer.cornerRadius = self.capsuleAll.frame.height/2
        self.selecteCapsule(buttons: [capsuleAll , capsuleInvoices , capsuleBucketList], selectedButton: capsuleAll)
        self.searchTF.delegate = self
        
        self.searchTF.becomeFirstResponder()
        self.view.layoutIfNeeded()
    }
    
    func selecteCapsule(buttons : [UIButton] , selectedButton : UIButton){
        for button in buttons {
            if(button == selectedButton){
                button.backgroundColor = UIColor(named: "CapsuleBG")
                button.layer.borderWidth = 0
                button.tintColor = .white
                
            } else {
                button.backgroundColor = .clear
                button.layer.borderColor = UIColor(named: "borderColor")?.cgColor
                button.layer.borderWidth = 1.4
                button.tintColor = .init(named: "textColor")
                
            }
        }
    }
   
    @IBAction func allSearchSelection(_ sender: Any) {
        self.selecteCapsule(buttons: [capsuleAll , capsuleInvoices , capsuleBucketList], selectedButton: capsuleAll)
        filterSearchResult(text: self.searchTF.text ?? "")
    }
    @IBAction func invoiceSelection(_ sender: Any) {
        self.selecteCapsule(buttons: [capsuleAll , capsuleInvoices , capsuleBucketList], selectedButton: capsuleInvoices)
        filterSearchResult(text: self.searchTF.text ?? "")
    }
    
    @IBAction func bucketlistSelection(_ sender: Any) {
        self.selecteCapsule(buttons: [capsuleAll , capsuleInvoices , capsuleBucketList], selectedButton: capsuleBucketList)
        filterSearchResult(text: self.searchTF.text ?? "")
    }
    func filterSearchResult(text : String){
        
    }
}
