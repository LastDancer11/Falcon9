//
//  HabitsViewModel.swift
//  EBuy
//
//  Created by user200328 on 7/13/21.
//

import Foundation

protocol HabitsCellViewModelProtocol {
    
    func fetchHabits(completion: @escaping ([HabitModel]) -> Void)
    
    init(with habitsManager: HabitsManagerProtocol)
}

final class HabitsCellViewModel: HabitsCellViewModelProtocol {
    
    private let habitsManager: HabitsManagerProtocol
    
    init(with habitsManager: HabitsManagerProtocol) {
        self.habitsManager = habitsManager
    }
    
    func fetchHabits(completion: @escaping ([HabitModel]) -> Void) {
        habitsManager.fetchHabits(completion: completion)
    }
    
}
