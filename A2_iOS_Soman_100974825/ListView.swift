//
//  ListView.swift
//  A2_iOS_Soman_100974825
//
//  Created by Soman Ahmad on 2026-04-09.
//

import SwiftUI
import CoreData

struct ListView: View {
    @Environment(\.managedObjectContext) private var context
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Product.name, ascending: true)],
        animation: .default
    ) private var products: FetchedResults<Product>

    var body: some View {
        NavigationStack {
            List {
                ForEach(products, id: \.id) { product in
                    Text(product.name ?? "Unknown")
                }
            }
            .navigationTitle("All Products")
        }
    }
}
