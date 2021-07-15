//
//  OfferCell.swift
//  EBuy
//
//  Created by user200328 on 7/13/21.
//

import UIKit
import Kingfisher

class OfferCell: UITableViewCell, TableCellConfigurable {

    @IBOutlet weak var offerNameLabel: UILabel!
    @IBOutlet weak var offerImageView: UIImageView!
    @IBOutlet weak var offerShadowView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupShadowView()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func setupShadowView() {
        offerShadowView.layer.cornerRadius = 16
        offerShadowView.layer.shadowOpacity = 0.1
        offerShadowView.layer.shadowRadius = 16
        offerShadowView.layer.shadowColor = UIColor.black.cgColor
        offerShadowView.layer.masksToBounds = false
        offerShadowView.layer.shadowOffset = CGSize(width: 4.0, height: 2.0)
    }
    
    func configure(with item: CellItem) {
        
        guard let model = item as? CellViewModel,
              let data = model.userData[.data] as? OfferModel else { return }
        
        offerNameLabel.text = data.name
        let url = URL(string: data.image ?? "")
        offerImageView.kf.setImage(with: url)
    }
    
    
}
