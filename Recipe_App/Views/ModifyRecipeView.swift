//
//  ModifyRecipeView.swift
//  Recipe_App
//
//  Created by Anthony Beasley on 4/6/22.
//

import SwiftUI

struct ModifyRecipeView: View {
    @Binding var recipe: Recipe
    
    var body: some View {
        Button("This is test data") {
            recipe.mainInformation = MainInformation(name: "test",
                                                     description: "rest",
                                                     author: "agfds",
                                                     category: .breakfast)
            recipe.directions = [Direction(description: "asdaf",
                                           isOptional: true)]
            recipe.ingredients = [Ingredient(name: "sfsaafsd",
                                             quantity: 69,
                                             unit: .none)]
        }
    }
}

struct ModifyRecipeView_Previews: PreviewProvider {
    @State static var recipe = Recipe()
    static var previews: some View {
        ModifyRecipeView(recipe: $recipe)
    }
}
