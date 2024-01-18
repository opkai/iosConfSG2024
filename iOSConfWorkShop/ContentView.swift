//
//  ContentView.swift
//  iOSConfWorkShop
//
//  Created by Maple Story on 18/1/2567 BE.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query var restaurants: [Restaurant]
    @State private var isAddingCustomItem = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(restaurants) { item in
                    NavigationLink(value: item) {
                        VStack(alignment: .leading) {
                            Text("name: \(item.name)")
                            Text("price: \(item.price)")
                            Text("quality rating: \(item.qualityRating)")
                            Text("speed raiting: \(item.speedRating)")
                        }
                    }
                }
                .onDelete(perform: { indexSet in
                    deleteRestaurants(indexSet)
                })
            }
            .navigationTitle("Restaurants")
            .navigationDestination(for: Restaurant.self, destination: EditRestaurant.init)
            .toolbar {
                Button("Insert item") {
                    insertItem()
                }
                
                Button("Add custom item") {
                    isAddingCustomItem = true
                }
                .background(
                    NavigationLink(
                        "",
                        destination: EditRestaurant(
                            restaurant: Restaurant(
                                name: "",
                                price: 0,
                                qualityRating: 0,
                                speedRating: 0
                            )
                        ),
                        isActive: $isAddingCustomItem
                    )
                    .isDetailLink(false)
                )
            }
        }
    }
    
    func insertItem() {
        let restaurant1 = Restaurant(name: "name", price: 1, qualityRating: 2, speedRating: 3)
        modelContext.insert(restaurant1)
    }
    
    func deleteRestaurants(_ indexSet: IndexSet) {
        for item in indexSet {
            let object = restaurants[item]
            modelContext.delete(object)
        }
    }
}

#Preview {
    ContentView()
}
