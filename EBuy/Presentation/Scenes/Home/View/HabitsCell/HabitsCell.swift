//
//  HabitsCell.swift
//  EBuy
//
//  Created by user200328 on 7/13/21.
//

import UIKit

class HabitsCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    
    private var dataSource: HabitsCellDataSource!
    private var habitsManager: HabitsManagerProtocol!
    private var viewModel: HabitsCellViewModel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.registerNib(class: HabitItemCell.self)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func configure() {
        configureDataSource()
    }
    
    private func configureDataSource() {
        habitsManager = HabitsManager()
        viewModel = HabitsCellViewModel(with: habitsManager)
        dataSource = HabitsCellDataSource(with: collectionView, viewModel: viewModel)
        dataSource.refresh()
    }
    
}
