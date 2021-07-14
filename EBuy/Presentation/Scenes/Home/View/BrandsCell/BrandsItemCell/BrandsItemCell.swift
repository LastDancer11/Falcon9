//
//  BrandsItemCell.swift
//  EBuy
//
//  Created by user200328 on 7/13/21.
//

import UIKit

class BrandsItemCell: UICollectionViewCell {

    @IBOutlet weak var brandsNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    
    func configure(with brand: BrandModel) {
        brandsNameLabel.text = brand.name
    }

}
