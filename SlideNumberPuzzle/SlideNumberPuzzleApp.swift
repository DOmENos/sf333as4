//
//  SlideNumberPuzzleApp.swift
//  SlideNumberPuzzle
//
//  Created by Setthanan Thitathanapat on 18/11/2566 BE.
//

// SlideNumberPuzzleApp.swift

import SwiftUI

@main
struct SlideNumberPuzzleApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(gameModel: SlidePuzzle())
        }
    }
}



