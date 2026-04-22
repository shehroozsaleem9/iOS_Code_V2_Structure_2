//
//  DashboardVC.swift
//  Grocery Management
//
//  Created by mac on 18/02/2025.
//

import UIKit

class DashboardVC: UIViewController, UITableViewDelegate , UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "history_table", for: indexPath)
        
        return cell
    }
    

    @IBAction func settings(_ sender: Any) {
        self.tabBarController?.selectedIndex = 4
    }
    @IBOutlet weak var viewDashboard: UIView!
    
    @IBOutlet weak var searchView: UIView!
    
    @IBAction func notificationsCOntroller(_ sender: Any) {
        self.tabBarController?.selectedIndex = 3
    }
    @IBAction func bucketList(_ sender: Any) {
        let bucketBoard = UIStoryboard(name: "bucket", bundle: nil)
        let bucketController = bucketBoard.instantiateViewController(withIdentifier: "BucketListViewController")
        bucketController.modalPresentationStyle = .fullScreen
        self.present(bucketController, animated: true)
    }
    @IBAction func invoices(_ sender: Any) {
        self.tabBarController?.selectedIndex = 1
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        viewDashboard.layer.cornerRadius = 15
        viewDashboard.layer.masksToBounds = false
        viewDashboard.layer.maskedCorners = [.layerMinXMinYCorner , .layerMaxXMinYCorner]
    }
    

    @IBAction func searchVC(_ sender: Any) {
        let dashboard = UIStoryboard(name: "Dashboard", bundle: nil)
        let searchVC = dashboard.instantiateViewController(withIdentifier: "SearchViewController")
        self.navigationController?.present(searchVC, animated: true)
    }
    override func viewWillAppear(_ animated: Bool){
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
}
