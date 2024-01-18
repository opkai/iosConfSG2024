//
//  EditRestaurant.swift
//  iOSConfWorkShop
//
//  Created by Maple Story on 18/1/2567 BE.
//

import SwiftData
import SwiftUI

struct EditRestaurant: View {
    @Bindable var restaurant: Restaurant
    @Environment(\.modelContext) var modelContext
    
//    init(restaurant: Restaurant = Restaurant(name: "name restera", price: 1, qualityRating: 2, speedRating: 3)) {
//        self.restaurant = restaurant
//    }
    
    init(restaurant: Restaurant) {
        self._restaurant = Bindable(wrappedValue: restaurant)
    }
    
//    var body: some View {
//        Form {
//            TextField("Name of restaurant", text: $restaurant.name)
//            TextField("Price of restaurant", value: $restaurant.price, formatter: NumberFormatter())
//            TextField("Quality of restaurant", value: $restaurant.qualityRating, formatter: NumberFormatter())
//            TextField("Speed of restaurant", value: $restaurant.speedRating, formatter: NumberFormatter())
//        }
//    }
    
    var body: some View {
        Form {
            TextField("Name of restaurant", text: $restaurant.name)
//            TextField("Price of restaurant", value: $restaurant.price, formatter: NumberFormatter())
//            TextField("Quality of restaurant", value: $restaurant.qualityRating, formatter: NumberFormatter())
//            TextField("Speed of restaurant", value: $restaurant.speedRating, formatter: NumberFormatter())
            Stepper("\(restaurant.price) price rateing", value: $restaurant.price)
            Stepper("\(restaurant.qualityRating) price qualityRating", value: $restaurant.qualityRating)
            Stepper("\(restaurant.speedRating) price speedRating", value: $restaurant.speedRating)
        }
        .toolbar {
            Button("Save") {
                saveRestaurant()
            }
        }
        .onDisappear {
            self.restaurant.name = ""
            self.restaurant.price = 0
            self.restaurant.qualityRating = 0
            self.restaurant.speedRating = 0
        }
    }
    
    func saveRestaurant() {
        modelContext.insert(restaurant)
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Restaurant.self, configurations: config)
    let example = Restaurant(name: "name", price: 1, qualityRating: 2, speedRating: 3)
    return EditRestaurant(restaurant: example)
        .modelContainer(container)
}
