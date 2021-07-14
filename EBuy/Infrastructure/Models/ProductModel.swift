//
//  ProductModel.swift
//  EBuy
//
//  Created by user200328 on 7/13/21.
//

import Foundation

struct ProductModel: Codable {
    let title: String?
    let price: Double?
    let description: String?
    let category: String?
    let image: String?
}
