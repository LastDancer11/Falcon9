//
//  SavedItemCell.swift
//  EBuy
//
//  Created by user200328 on 7/13/21.
//

import UIKit

class SavedItemCell: UICollectionViewCell, CollectionCellConfigurable  {

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
    
    func configure(with item: CellItem) {
        
        guard let model = item as? CellViewModel,
              let data = model.userData[.data] as? SavedItemModel else { return }
        
        savedItemNameLabel.text = data.name
        savedItemPriceLabel.text = data.price
        let url = URL(string: data.image ?? "")
        savedItemImageView.kf.setImage(with: url)
    }

}
