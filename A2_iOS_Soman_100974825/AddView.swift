//
//  AddView.swift
//  A2_iOS_Soman_100974825
//
//  Created by Soman Ahmad on 2026-04-09.
//

import SwiftUI
import CoreData

struct AddView: View {
    @Environment(\.managedObjectContext) private var context
    @State private var name = ""
    @State private var description = ""
    @State private var priceText = ""
    @State private var provider = ""
    @State private var showConfirmation = false

    var isValid: Bool {
        !name.isEmpty && Double(priceText) != nil
    }

    var body: some View {
        NavigationStack {
            Form {
                Section("Product Info") {
                    TextField("Name", text: $name)
                    TextField("Description", text: $description)
                    TextField("Price)", text: $priceText)
                        .keyboardType(.decimalPad)
                    TextField("Provider", text: $provider)
                }

                Section {
                    Button("Save Product") {
                        saveProduct()
                    }
                    .disabled(!isValid)
                }
            }
            .navigationTitle("Add Product")
            .alert("Saved!", isPresented: $showConfirmation) {
                Button("OK") { clearForm() }
            } message: {
                Text("\"\(name)\" was added successfully.")
            }
        }
    }

    private func saveProduct() {
        let p = Product(context: context)
        p.id = UUID()
        p.name = name
        p.descriptions = description
        p.price = Double(priceText) ?? 0
        p.provider = provider
        try? context.save()
        showConfirmation = true
    }

    private func clearForm() {
        name = ""; description = ""; provider = ""
    }
}
