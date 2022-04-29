//
//  RecipeDetailView.swift
//  Recipe_App
//
//  Created by Anthony Beasley on 4/3/22.
//

import SwiftUI

struct RecipeDetailView: View {
    var recipe: Recipe
    private let listBackgroundColor = AppColor.background
    private let listForegroundColor = AppColor.foreground
    
    var body: some View {
        VStack {
            
            HStack {
                Text("Author: \(recipe.mainInformation.author)")
                    .font(.headline)
                    .multilineTextAlignment(.center)
                    .padding()
                    .foregroundColor(listForegroundColor)
                
            }
            HStack {
                Text("Description:").font(.headline).foregroundColor(listForegroundColor)
            }
            Text("\(recipe.mainInformation.description)")
                                .font(.subheadline)
                                .foregroundColor(listForegroundColor)
            
            List {
                
                Section(header: Text ("Ingredients").foregroundColor(.blue)) {
                    ForEach(recipe.ingredients.indices, id: \.self) { index in
                        let ingredient = recipe.ingredients[index]
                        Text (ingredient.description)
                    }
                }
                .listRowBackground(listBackgroundColor)
                .foregroundColor(listForegroundColor)
                
                Section(header: Text("Directions").foregroundColor(.blue)) {
                    ForEach(recipe.directions.indices, id: \.self) { index in
                        let direction = recipe.directions[index]
                        HStack {
                            Text("\(index + 1).").bold()
                        Text("\(direction.isOptional ? "(Optional)" : "")" + "\(direction.description)")
                        }
                    }
                }
                .listRowBackground(listBackgroundColor)
                .foregroundColor(listForegroundColor)
                
            }
            
        }
        .navigationTitle(recipe.mainInformation.name)
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    @State static var recipe = Recipe.testRecipes[0]
    
    static var previews: some View {
       NavigationView {
           RecipeDetailView(recipe: recipe)
       }
    }
}
