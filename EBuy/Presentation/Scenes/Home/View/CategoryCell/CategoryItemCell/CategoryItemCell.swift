//
//  CategoryCell.swift
//  EBuy
//
//  Created by user200328 on 7/13/21.
//

import UIKit
import Kingfisher

class CategoryItemCell: UICollectionViewCell {

    @IBOutlet weak var categoryImageView: UIImageView!
    @IBOutlet weak var categoryNameLabel: UILabel!
    @IBOutlet weak var categoryDescriptionLabel: UILabel!
    @IBOutlet weak var categoryShadowView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupShadowView()
        
    }
    
    private func setupShadowView() {
        categoryShadowView.layer.cornerRadius = 16
        categoryShadowView.layer.shadowOpacity = 0.1
        categoryShadowView.layer.shadowRadius = 16
        categoryShadowView.layer.shadowColor = UIColor.black.cgColor
        categoryShadowView.layer.masksToBounds = false
        categoryShadowView.layer.shadowOffset = CGSize(width: 4.0, height: 2.0)
    }
    
    func configure(with category: CategoryModel) {
        categoryNameLabel.text = category.category
        categoryDescriptionLabel.text = category.description
        let url = URL(string: category.image ?? "")
        categoryImageView.kf.setImage(with: url)
    }

}
