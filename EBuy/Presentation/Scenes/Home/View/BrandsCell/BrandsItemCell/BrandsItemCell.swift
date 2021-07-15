//
//  BrandsItemCell.swift
//  EBuy
//
//  Created by user200328 on 7/13/21.
//

import UIKit

class BrandsItemCell: UICollectionViewCell, CollectionCellConfigurable  {

    @IBOutlet weak var brandsNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    
    func configure(with item: CellItem) {
        
        guard let model = item as? CellViewModel,
              let data = model.userData[.data] as? BrandModel else { return }
        
        brandsNameLabel.text = data.name
    }

}
