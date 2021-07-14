//
//  SavedItemCell.swift
//  EBuy
//
//  Created by user200328 on 7/13/21.
//

import UIKit

class SavedItemCell: UICollectionViewCell {

    @IBOutlet weak var savedItemImageView: UIImageView!
    @IBOutlet weak var savedItemShadowView: UIView!
    @IBOutlet weak var savedItemNameLabel: UILabel!
    @IBOutlet weak var savedItemPriceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupShadowView()
        
    }
    
    private func setupShadowView() {
        savedItemShadowView.layer.cornerRadius = 16
        savedItemShadowView.layer.shadowOpacity = 0.1
        savedItemShadowView.layer.shadowRadius = 16
        savedItemShadowView.layer.shadowColor = UIColor.black.cgColor
        savedItemShadowView.layer.masksToBounds = false
        savedItemShadowView.layer.shadowOffset = CGSize(width: 4.0, height: 2.0)
    }
    
    func configure(with savedItem: SavedItemModel) {
        savedItemNameLabel.text = savedItem.name
        savedItemPriceLabel.text = savedItem.price
        let url = URL(string: savedItem.image ?? "")
        savedItemImageView.kf.setImage(with: url)
    }

}
