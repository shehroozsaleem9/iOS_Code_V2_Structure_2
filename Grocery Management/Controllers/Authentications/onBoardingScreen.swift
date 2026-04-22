//
//  onBoardingScreen.swift
//  Grocery Management
//
//  Created by mac on 25/03/2025.
//

import UIKit
import Vision


class OnBoardingScreen: UIViewController {
    @IBOutlet weak var loginWithGoogle: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func SignIn(_ sender: Any) {
        let main = UIStoryboard(name: "Main", bundle: .none)
        let navcontroller = main.instantiateViewController(withIdentifier: "LoginVC")
       
            self.navigationController?.pushViewController(navcontroller, animated: true)
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    @IBAction func loginWithGoogle(_ sender: Any) {
        
    }
    
    
}
