//
//  ViewController.swift
//  Grocery Management
//
//  Created by mac on 18/02/2025.
//

import UIKit


import Alamofire

class LandingScreen: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        Config.shared.environment = .staging
        startTimer()
    }
    
    func startTimer(){
        let main = UIStoryboard(name: "Main", bundle: .none)
        let navcontroller = main.instantiateViewController(withIdentifier: "OnBoardingScreen")
        DispatchQueue.main.asyncAfter(deadline: .now()+4){
            self.navigationController?.pushViewController(navcontroller, animated: true)
        }
    }


}

