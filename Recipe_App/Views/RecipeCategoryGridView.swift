//
//  RecipeCategoryGridView.swift
//  Recipe_App
//
//  Created by Anthony Beasley on 4/5/22.
//

import SwiftUI

struct RecipeCategoryGridView: View {
    var recipeData = RecipeData()
    var body: some View {
        NavigationView {
            ScrollView {
            LazyVGrid(columns: [GridItem()], content: {
                ForEach(MainInformation.Category.allCases, id: \.self) { category in
                    NavigationLink(destination: RecipeListView(category: category)
                        .environmentObject(recipeData), label: {CategoryView(category: category)})
            }
        })
            .navigationTitle("Categories")
            }
        }
    }
}

struct CategoryView: View {
    
    var category: MainInformation.Category
    
    var body: some View {
        ZStack {
            Image(category.rawValue)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 250, height: 130)
            Text(category.rawValue)
                .foregroundColor(.white)
                .font(.system(size: 35))
                .shadow(color: .black, radius: 10, x: 1, y: 1)
                .font(.system(.subheadline, design: .rounded))
        }
    }
}

struct RecipeCategoryGridView_Previews: PreviewProvider {
    static var previews: some View {
            RecipeCategoryGridView()
    }
}
