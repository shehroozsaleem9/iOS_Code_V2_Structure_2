//
//  colorCollectionViewCell.swift
//  Grocery Management
//
//  Created by mac on 14/05/2025.
//

import UIKit

class colorCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var color_view: UIView!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let radius = color_view.bounds.width / 2
        color_view.layer.cornerRadius = radius
        color_view.layer.masksToBounds = true
    }
}
