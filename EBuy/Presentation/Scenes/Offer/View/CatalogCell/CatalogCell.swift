//
//  CatalogCell.swift
//  EBuy
//
//  Created by user200328 on 7/14/21.
//

import UIKit

class CatalogCell: UICollectionViewCell {

    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    @IBOutlet weak var productShadowView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupShadowView()
        
    }
    
    private func setupShadowView() {
        productShadowView.layer.cornerRadius = 16
        productShadowView.layer.shadowOpacity = 0.1
        productShadowView.layer.shadowRadius = 16
        productShadowView.layer.shadowColor = UIColor.black.cgColor
        productShadowView.layer.masksToBounds = false
        productShadowView.layer.shadowOffset = CGSize(width: 4.0, height: 2.0)
    }
    
    func configure(with product: OfferCatalogModel) {
        productNameLabel.text = product.name
        productPriceLabel.text = product.price
        let url = URL(string: product.image ?? "")
        productImageView.kf.setImage(with: url)
    }
    
    

}
