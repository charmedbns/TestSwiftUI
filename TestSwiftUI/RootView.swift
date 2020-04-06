//
//  ContentView.swift
//  TestSwiftUI
//
//  Created by Alexey on 30/03/2020.
//  Copyright © 2020 Alexey. All rights reserved.
//

import SwiftUI

struct Food: Identifiable {
    let id = UUID()
    let name: String
}

final class FoodListViewModel: ObservableObject {
    @Published private(set) var foods = [
        Food(name: "Milk"),
        Food(name: "Cheese"),
        Food(name: "Apple"),
        Food(name: "Srawberry"),
    ]
}

struct RootView: View {
    @ObservedObject var viewModel = FoodListViewModel()
  
    var body: some View {
        List {
            ForEach(viewModel.foods) { food in
                Text(food.name)
                
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}


