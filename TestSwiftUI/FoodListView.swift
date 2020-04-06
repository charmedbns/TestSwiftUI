//
//  FoodListView.swift
//  TestSwiftUI
//
//  Created by Alexey on 31/03/2020.
//  Copyright © 2020 Alexey. All rights reserved.
//

import SwiftUI

struct Food: Identifiable {
    let id = UUID()
    let name: String
    let isFavorite: Bool
}

final class FoodListViewModel: ObservableObject {
    @Published private(set) var filterButtonName = "Switch Faves"
    
    @Published private(set) var foods = [
        Food(name: "Milk", isFavorite: true),
        Food(name: "Cheese", isFavorite: false),
        Food(name: "Apple", isFavorite: false),
        Food(name: "Srawberry", isFavorite: true),
    ]
}
//MARK: - Views

struct FilterView: View {
    @EnvironmentObject var viewModel: FoodListViewModel
    
    @Binding var favedShowed: Bool
    
    
    var body: some View {
        Toggle(isOn: $favedShowed) {
            Text(viewModel.filterButtonName)
        }
    }
}

struct FoodView: View {
    var body: some View {
        Text("🕊")
            .font(.largeTitle)
    }
}

struct FoodListView: View {
    @EnvironmentObject var viewModel: FoodListViewModel
    
    @State var favedShowed = false
    
    var body: some View {
        NavigationView {
            List {
                FilterView(favedShowed: $favedShowed)
                    .environmentObject(viewModel)
                ForEach(viewModel.foods) { food in
                    if self.favedShowed == false || food.isFavorite {
                        // Row
                        NavigationLink(destination: FoodView()) {
                            Text(food.name)
                                .foregroundColor(.red)
                        }
                    }
                }
            }
            .navigationBarTitle("Foods")
        } //NavigationView
            .padding(.top, 44)
    }
}

struct FoodListView_Previews: PreviewProvider {
    static var previews: some View {
        FoodListView().environmentObject(FoodListViewModel())
    }
} 
