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
                    VStack(alignment: .leading, spacing: 4) {
                        Text(product.name ?? "Unknown").font(.headline)
                        Text(product.descriptions ?? "")
                            .font(.caption).foregroundColor(.secondary).lineLimit(2)
                        Text(String(format: "$%.2f  •  %@", product.price, product.provider ?? ""))
                            .font(.caption).foregroundColor(.blue)
                    }
                    .padding(.vertical, 2)
                }
                .onDelete(perform: deleteProducts)
            }
            .navigationTitle("All Products (\(products.count))")
            .toolbar { EditButton() }
        }
    }

    private func deleteProducts(at offsets: IndexSet) {
        for i in offsets { context.delete(products[i]) }
        try? context.save()
    }
}
