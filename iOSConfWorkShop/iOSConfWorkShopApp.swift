//
//  iOSConfWorkShopApp.swift
//  iOSConfWorkShop
//
//  Created by Maple Story on 18/1/2567 BE.
//

import SwiftUI
import SwiftData

@main
struct iOSConfWorkShopApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Restaurant.self)
    }
}
