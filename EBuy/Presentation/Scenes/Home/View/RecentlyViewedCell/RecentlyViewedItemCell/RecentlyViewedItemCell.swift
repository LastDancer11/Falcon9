//
//  RecentrlyViewedItemCell.swift
//  EBuy
//
//  Created by user200328 on 7/13/21.
//

import UIKit
import Kingfisher

class RecentlyViewedItemCell: UICollectionViewCell {

    @IBOutlet weak var recentlyViewedImageView: UIImageView!
    @IBOutlet weak var recentlyViewedItemDescriptionLabel: UILabel!
    @IBOutlet weak var recentlyViewedShadowView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupShadowView()
        
    }
    
    private func setupShadowView() {
        recentlyViewedShadowView.layer.cornerRadius = 16
        recentlyViewedShadowView.layer.shadowOpacity = 0.1
        recentlyViewedShadowView.layer.shadowRadius = 16
        recentlyViewedShadowView.layer.shadowColor = UIColor.black.cgColor
        recentlyViewedShadowView.layer.masksToBounds = false
        recentlyViewedShadowView.layer.shadowOffset = CGSize(width: 4.0, height: 2.0)
    }
    
    func configure(with item: RecentlyViewedModel) {
        recentlyViewedItemDescriptionLabel.text = item.description
        let url = URL(string: item.image ?? "")
        recentlyViewedImageView.kf.setImage(with: url)
    }

    @IBAction func likePressed(_ sender: Any) {
    }
    
}
