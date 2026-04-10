//
//  SearchView.swift
//  A2_iOS_Soman_100974825
//
//  Created by Soman Ahmad on 2026-04-09.
//

import SwiftUI

struct SearchView: View {
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Product.name, ascending: true)])
    private var allProducts: FetchedResults<Product>

    @State private var query = ""

    var results: [Product] {
        guard !query.isEmpty else { return [] }
        return allProducts.filter {
            ($0.name ?? "").localizedCaseInsensitiveContains(query) ||
            ($0.descriptions ?? "").localizedCaseInsensitiveContains(query)
        }
    }

    var body: some View {
        NavigationStack {
            List {
                if query.isEmpty {
                    Text("")
                        .foregroundColor(.secondary)
                } else if results.isEmpty {
                    Text("No results for \"\(query)\".")
                        .foregroundColor(.secondary)
                } else {
                    ForEach(results, id: \.id) { product in
                        Text(product.name ?? "")
                    }
                }
            }
            .searchable(text: $query, prompt: "Search by name or description")
            .navigationTitle("Search")
        }
    }
}
