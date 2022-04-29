//
//  Window.swift
//  Recipe_App
//
//  Created by Anthony Beasley on 4/1/22.
//

import Foundation

import SwiftUI

@main
struct Recipe_App: App {
    var body: some Scene {
        WindowGroup {
            RecipeCategoryGridView()
        }
    }
}
