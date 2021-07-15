//
//  CategoryCell.swift
//  EBuy
//
//  Created by user200328 on 7/13/21.
//

import UIKit
import Kingfisher

class CategoryItemCell: UICollectionViewCell, CollectionCellConfigurable {

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
    
    func configure(with item: CellItem) {
        
        guard let model = item as? CellViewModel,
              let data = model.userData[.data] as? CategoryModel else { return }
        
        categoryNameLabel.text = data.category
        categoryDescriptionLabel.text = data.description
        let url = URL(string: data.image ?? "")
        categoryImageView.kf.setImage(with: url)
    }

}
