//
//  HabitItemCell.swift
//  EBuy
//
//  Created by user200328 on 7/13/21.
//

import UIKit
import Kingfisher

class HabitItemCell: UICollectionViewCell {

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
    
    func configure(with habit: HabitModel) {
        habitItemNameLabel.text = habit.name
        habitItemPriceLabel.text = habit.price
        let url = URL(string: habit.image ?? "")
        habitItemImageView.kf.setImage(with: url)
    }

}
