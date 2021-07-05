//
//  CardGameApp.swift
//  CardGame
//
//  Created by Usha Natarajan on 7/4/21.
//

import SwiftUI

@main
struct CardGameApp: App {
    let game = EmojiModel()
    var body: some Scene {
        WindowGroup {
            LandingView(viewModel: game)
        }
    }
}
