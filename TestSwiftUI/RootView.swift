//
//  ContentView.swift
//  TestSwiftUI
//
//  Created by Alexey on 30/03/2020.
//  Copyright © 2020 Alexey. All rights reserved.
//

import SwiftUI

struct RootView: View {
    
    @EnvironmentObject var foodListViewModel: FoodListViewModel
    
    @State private var selection = 0
    var body: some View {
        TabView(selection: $selection){
            FoodListView()
                .tag(0)
                .tabItem{
                    VStack{
                        Text("Foods")
                        Image(systemName: "flame.fill")
                    }
            }
            AboutView()
                .tag(1)
                .tabItem{
                    VStack {
                        Text("About")
                        Image(systemName: "hare")
                    }
            }
        }
    }
}
struct RootView_Previews: PreviewProvider {
    
    static var previews: some View {
        RootView()
    }
}

// MARK - Views

struct AboutView: View {
    
    @State var aboutShowed: Bool = false
    
    var body: some View {
        VStack {
            Text("About App")
                .simultaneousGesture(TapGesture().onEnded {
                    self.aboutShowed.toggle()
                })
        }
        .sheet(isPresented: $aboutShowed, onDismiss: { print("Modal Closed") }) {
            AboutViewModal()
        }
    }
}

struct AboutViewModal: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        VStack {
            Button(action: {self.presentationMode.wrappedValue.dismiss() }) {
                Text("Close")
            }
            Spacer()
            ActivityIndicatorView()
            Image(systemName: "hare.fill")
                .foregroundColor(.red)
                .font(.largeTitle)
            Spacer()
            Spacer()
        }
    }
}
