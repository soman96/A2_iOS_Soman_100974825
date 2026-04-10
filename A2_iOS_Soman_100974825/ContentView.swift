//
//  ContentView.swift
//  A2_iOS_Soman_100974825
//
//  Created by Soman Ahmad on 2026-04-09.
//

import SwiftUI
import CoreData

struct ContentView: View {
    var body: some View {
        TabView {
            BrowseView()
                .tabItem { Label("Browse", systemImage: "house") }

            SearchView()
                .tabItem { Label("Search", systemImage: "magnifyingglass") }

            ListView()
                .tabItem { Label("All Products", systemImage: "list.bullet") }

            AddView()
                .tabItem { Label("Add Product", systemImage: "plus.circle") }
        }
    }
}

#Preview {
    ContentView()
        .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
