//
//  HabitsManager.swift
//  EBuy
//
//  Created by user200328 on 7/14/21.
//

import Foundation

protocol HabitsManagerProtocol: AnyObject {
    func fetchHabits(completion: @escaping ([HabitModel]) -> Void)
}

class HabitsManager: HabitsManagerProtocol {
    func fetchHabits(completion: @escaping ([HabitModel]) -> Void) {
        let url = "https://run.mocky.io/v3/96680335-73f4-4d64-951b-6bf8ca8cfac9"
        NetworkManager.shared.get(url: url) { (result: Result<[HabitModel], Error>) in
            switch result {
            case .success(let books):
                completion(books)
            case .failure(let error):
                print(error)
            }
        }
    }
}

