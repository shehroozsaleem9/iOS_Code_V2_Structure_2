//
//  AddBucketViewController.swift
//  Grocery Management
//
//  Created by mac on 30/04/2025.
//

import UIKit

class AddBucketViewController: UIViewController , UICollectionViewDelegate , UICollectionViewDataSource{
    
    @IBOutlet weak var colorCollectionView: UICollectionView!
    @IBOutlet weak var iconCollectionView: UICollectionView!
    
    let itemsInSection = 6

    var listColors : [[Int]] = [[0x047C52 , 0x524C8C, 0xFFE200, 0x6E7972 , 0xD23D33 , 0xC1A386],[ 0x64D2FF , 0xFF9F0A , 0x00EA96 , 0xE1289B , 0xBF5AF2 , 0x734230]]
    var listIcons : [[String]] = [["icon_1", "icon_2", "icon_3", "icon_4", "icon_5", "icon_6"],[ "icon_7", "icon_8", "icon_9", "icon_10", "icon_11", "icon_12"],[ "icon_13", "icon_14", "icon_15", "icon_16", "icon_17", "icon_18"]]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Add New Bucket"
        self.setupNavigationBackButton(){
            self.navigationController?.popViewController(animated: true)
        }
        
        colorCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "colorCell")
        iconCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "iconCell")

        
        colorCollectionView.delegate = self
        iconCollectionView.delegate = self
        colorCollectionView.dataSource = self
        iconCollectionView.dataSource = self
        colorCollectionView.reloadData()
        iconCollectionView.reloadData()
        // Do any additional setup after loading the view.
    }

    @IBAction func saveBucket(_ sender: Any) {
        let board = UIStoryboard(name: "bucket", bundle: nil)
        let controller = board.instantiateViewController(identifier: "BucketItemsViewController")
        self.navigationController?.pushViewController(controller, animated: true)
    }
}
extension AddBucketViewController {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        if collectionView == colorCollectionView {
            return listColors.count
        } else {
            return listIcons.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemsInSection
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == colorCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "colorCollectionViewCell", for: indexPath) as! colorCollectionViewCell
            cell.color_view.backgroundColor = UIColor.init(hex: listColors[indexPath.section][indexPath.row])
            let screenWidth = (collectionView.frame.width )
            let collectionViewWidth = (screenWidth - 25)/10
            cell.color_view.widthAnchor.constraint(equalToConstant: collectionViewWidth).isActive = true
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "iconsCollectionViewCell", for: indexPath) as! iconsCollectionViewCell
            cell.icon_image.image = UIImage(named: listIcons[indexPath.section][indexPath.row])
            let screenWidth = (collectionView.frame.width )
            let collectionViewWidth = (screenWidth - 25)/10
            cell.icon_image.widthAnchor.constraint(equalToConstant: collectionViewWidth).isActive = true
            return cell
        }
    }
}
