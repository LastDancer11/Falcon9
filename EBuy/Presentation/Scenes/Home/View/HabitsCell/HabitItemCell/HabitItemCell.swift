//
//  HabitItemCell.swift
//  EBuy
//
//  Created by user200328 on 7/13/21.
//

import UIKit
import Kingfisher

class HabitItemCell: UICollectionViewCell, CollectionCellConfigurable  {

    @IBOutlet weak var habitItemImageView: UIImageView!
    @IBOutlet weak var habitItemShadowView: UIView!
    @IBOutlet weak var habitItemPriceLabel: UILabel!
    @IBOutlet weak var habitItemNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    private func setupShadowView() {
        habitItemShadowView.layer.cornerRadius = 16
        habitItemShadowView.layer.shadowOpacity = 0.1
        habitItemShadowView.layer.shadowRadius = 16
        habitItemShadowView.layer.shadowColor = UIColor.black.cgColor
        habitItemShadowView.layer.masksToBounds = false
        habitItemShadowView.layer.shadowOffset = CGSize(width: 4.0, height: 2.0)
    }
    
    func configure(with item: CellItem) {
        
        guard let model = item as? CellViewModel,
              let data = model.userData[.data] as? HabitModel else { return }
        
        habitItemNameLabel.text = data.name
        habitItemPriceLabel.text = data.price
        let url = URL(string: data.image ?? "")
        habitItemImageView.kf.setImage(with: url)
    }

}
