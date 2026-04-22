//
//  Extensions.swift
//  Grocery Management
//
//  Created by mac on 19/02/2025.
//

import Foundation
import UIKit


extension UIViewController{
    
    func setupNavigationBackButton(aspectRatio: CGFloat = 1.0, size: CGFloat = 30, completion: @escaping () -> Void) {
        self.navigationItem.hidesBackButton = true
        
        let backButton = UIButton(type: .system)
        let image = UIImage(named: "back_arrow")?.withRenderingMode(.alwaysOriginal)
        backButton.setImage(image, for: .normal)
        backButton.tintColor = .black
 
        backButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backButton.widthAnchor.constraint(equalToConstant: size),
            backButton.heightAnchor.constraint(equalTo: backButton.widthAnchor, multiplier: 1/aspectRatio)
        ])
 
        backButton.addAction(UIAction(handler: { _ in
            completion()
        }), for: .touchUpInside)
         
        let barButtonItem = UIBarButtonItem(customView: backButton)
        self.navigationItem.leftBarButtonItem = barButtonItem
    }

   
    
    func verifyEmail(email : String) -> Bool{
        let email = email.trimmingCharacters(in: .whitespaces)
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    func showToastAlert( message : String){
        let controller = UIAlertController(
            title: "",
            message: message,
            preferredStyle: .alert
        )
        DispatchQueue.main.asyncAfter(deadline: .now()+2.5){
            controller.dismiss(animated: true)
        }
        self.present(controller, animated: true)
    }
    func showAlertNoAction( title : String , message : String , actionConfirmationNormal : String? = "ok"){
        let controller = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        controller.addAction(
            UIAlertAction(
                title: actionConfirmationNormal,
                style: .default
            ) {_ in
            controller.dismiss(animated: true)
        })

        self.present(controller, animated: true)
    }
    func showAlertAction( title : String , message : String , canShowCancel : Bool? = false, actionConfirmationNormal : String? = "ok" , action : @escaping () -> Void ){
        let controller = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        if canShowCancel!{
            controller.addAction(
                UIAlertAction(
                    title: "cancel",
                    style: .cancel
                ) {_ in
                    controller.dismiss(animated: true)
                })
        }
        controller.addAction(
            UIAlertAction(
                title: actionConfirmationNormal,
                style: .default
            ) {_ in
            action()
        })
        self.present(controller, animated: true)
    }
}

extension UITableView{
    func reloadData(completion : @escaping () -> () ) {
        UIView.animate(withDuration: 0, animations: reloadData)
        {
            _ in
            completion()
        }
    }
}
extension UIImage {
    static func createCircularIndicator(color: UIColor, diameter: CGFloat) -> UIImage? {
        let size = CGSize(width: diameter, height: diameter)
        let rect = CGRect(origin: .zero, size: size)
        
        let renderer = UIGraphicsImageRenderer(size: size)
        return renderer.image { context in
            let path = UIBezierPath(ovalIn: rect)
            color.setFill()
            path.fill()
        }
    }

}

extension UIColor {
    convenience init(hex: Int, alpha: CGFloat = 1.0) {
        self.init(
            red: CGFloat((hex >> 16) & 0xFF) / 255.0,
            green: CGFloat((hex >> 8) & 0xFF) / 255.0,
            blue: CGFloat(hex & 0xFF) / 255.0,
            alpha: alpha
        )
    }
}
