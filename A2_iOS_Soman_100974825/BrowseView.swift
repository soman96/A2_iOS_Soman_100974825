//
//  BrowseView.swift
//  A2_iOS_Soman_100974825
//
//  Created by Soman Ahmad on 2026-04-09.
//

import SwiftUI
import CoreData

struct BrowseView: View {
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Product.name, ascending: true)],
        animation: .default
    ) private var products: FetchedResults<Product>

    @State private var index = 0

    var body: some View {
        NavigationStack {
            if products.isEmpty {
                Text("No products yet. Add some!")
                    .foregroundColor(.secondary)
            } else {
                let product = products[index]

                VStack(alignment: .leading, spacing: 16) {
                    Text(product.name ?? "Unknown Name")
                        .font(.title2).bold()

                    Text("ID: \(product.id?.uuidString.prefix(8).uppercased() ?? "N/A")")
                        .font(.caption)
                        .foregroundColor(.secondary)

                    Divider()

                    Text(product.descriptions ?? "No description provided!")
                        .font(.body)

                    Divider()

                    Text(String(format: "$%.2f", product.price))
                        .font(.title3).bold().foregroundColor(.green)

                    Text(product.provider ?? "")
                        .foregroundColor(.secondary)

                    Spacer()
                }
                .padding()
                .navigationTitle("Browse Products")
            }
        }
    }
}
