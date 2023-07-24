//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by 장세희 on 2023/07/17.
//

import SwiftUI

@main
struct LandmarksApp: App {
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
