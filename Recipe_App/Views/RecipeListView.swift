//
//  ContentView.swift
//  Recipe_App
//
//  Created by Anthony Beasley on 3/29/22.
//

import SwiftUI

struct RecipeListView: View {
    @EnvironmentObject private var recipeData: RecipeData
    var category: MainInformation.Category
    
    @State private var isPresenting = false
    @State private var newRecipe = Recipe()
    
    private let listBackgroundColor = AppColor.background
    private let listForegroundColor = AppColor.foreground
    
    var body: some View {
        List {
            ForEach(recipeData.recipes(for: category)) {recipe in
                VStack {
                    HStack {
                        NavigationLink(recipe.mainInformation.name, destination: RecipeDetailView(recipe: recipe))
                        Spacer()
                    }
                    HStack {
                        Text(recipe.mainInformation.description)
                            .font(.system(size: 12))
                            .foregroundColor(.gray)
                        Spacer()
                    }
                }
            }
            .listRowBackground(listBackgroundColor)
            .foregroundColor(listForegroundColor)
        }
        .navigationTitle(navigationTitle)
        .toolbar(content: {
            ToolbarItem(placement: .navigationBarTrailing){
                Button(action: {
                    isPresenting = true
                }, label: {
                    Image(systemName: "plus")
                })
            }
        })
        .sheet(isPresented: $isPresenting,
               content: {
            NavigationView {
                ModifyRecipeView(recipe: $newRecipe)
                    .navigationTitle("Add a New Recipe")
                    .toolbar(content: {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Dismiss") {
                                isPresenting = false
                            }
                        }
                        ToolbarItem(placement: .confirmationAction) {
                            if newRecipe.isValid {
                            Button("Add") {
                                isPresenting = false
                                recipeData.add(recipe: newRecipe)
                            }}
                        }
                    })
            }
        })
    }
}

extension RecipeListView {
    
    var recipes: [Recipe] {
        recipeData.recipes(for: category)
    }
    
    var navigationTitle: String {
        "\(category.rawValue) Recipes"
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            RecipeListView(category: .breakfast)
                .environmentObject(RecipeData())
        }
    }
}
