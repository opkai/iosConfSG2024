//
//  Restaurant.swift
//  iOSConfWorkShop
//
//  Created by Maple Story on 18/1/2567 BE.
//

import SwiftData
import Foundation

@Model
class Restaurant {
    var name: String
    var price: Int
    var qualityRating: Int
    var speedRating: Int
    
    init(name: String, price: Int, qualityRating: Int, speedRating: Int) {
        self.name = name
        self.price = price
        self.qualityRating = qualityRating
        self.speedRating = speedRating
    }
}
