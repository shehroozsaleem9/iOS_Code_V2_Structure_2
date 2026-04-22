//
//  LoginViewController.swift
//  Grocery Management
//
//  Created by mac on 18/02/2025.
//

import UIKit
import ProgressHUD

enum LoginError: Error {
    case wrongInformation
}

struct Mutations {
    var pagesRemaining : Int

    mutating func copy(count: Int) throws {
        guard count <= pagesRemaining else {
            throw LoginError.wrongInformation
        }
        pagesRemaining -= count
    }
}

class LoginViewController: UIViewController {
    
    var countRemaining : Int = 10
    
    @IBOutlet weak var lblTermsAndPrivacy: UILabel!
    @IBOutlet weak var tf_password: UITextField!
    @IBOutlet weak var lbl_signup: UILabel!
    @IBOutlet weak var tf_email: UITextField!
    @IBOutlet weak var lbl_forgotPassword: UILabel!
    var main : UIStoryboard? = nil
    var dashboard : UIStoryboard? = nil
    var forgotPassword : UIStoryboard? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        main = UIStoryboard(name: "Main", bundle: .none)
        forgotPassword = UIStoryboard(name: "ForgotPassword", bundle: .none)
        dashboard = UIStoryboard(name: "Dashboard", bundle: .none)
        
    }
    @IBAction func moveToForgotPass(_ sender: Any){
        if let controller = forgotPassword?.instantiateViewController(withIdentifier: "ForgotPassword"){
            self.navigationController?.pushViewController(controller, animated: true)
        }
    }
    @IBAction func registerUser(_ sender: Any){
        if let controller = main?.instantiateViewController(withIdentifier: "RegisterVC"){
            self.navigationController?.pushViewController(controller, animated: true)
        }
    }
   
    
    @IBAction func loginAction(_ sender: Any) {
        guard verifyEmail(email: tf_email.text ?? "") else {
            showToastAlert(message: "Invalid email address")
            return
        }
        if let controller = dashboard?.instantiateViewController(withIdentifier: "DashboardVC")
        {
            ProgressHUD.animate()
            AuthService.login(email: tf_email.text ?? "", password: tf_password.text ?? "") { result in
                switch result {
                case .success(let (response, headers)):
                    print("Login successful: \(String(describing: response.data.email))")
                    
                    if let headerDict = headers as? [String: Any] {
                        let token = headerDict.first { $0.key.lowercased() == "access-token" }?.value as? String
                        let client = headerDict.first { $0.key.lowercased() == "client" }?.value as? String
                        let uid = headerDict.first { $0.key.lowercased() == "uid" }?.value as? String

                        TokenManager.shared.save(token: token, client: client, uid: uid)
                    }

                    ProgressHUD.dismiss()
                    self.present(controller, animated: true)
                    
                case .failure(let error):
                    print("Login failed: \(error.localizedDescription)")
                }
            }

            
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
}

