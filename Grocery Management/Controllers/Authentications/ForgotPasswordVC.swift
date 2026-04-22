//
//  ForgotPasswordVC.swift
//  Grocery Management
//
//  Created by mac on 18/02/2025.
//

import UIKit

class ForgotPasswordVC: UIViewController {

    @IBOutlet weak var tf_email: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func sendEmail(_ sender: Any) {
        guard self.verifyEmail(email: tf_email.text ?? "") else {
            self.showToastAlert(message: "Email not valid")
            return
        }
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.navigationController?.navigationBar.isHidden = false
    }
    func sendEmail(){
        
    }

}
