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

    var body: some View {
        NavigationStack {
            Form {
                Section("Product Info") {
                    TextField("Name", text: $name)
                    TextField("Description", text: $description)
                    TextField("Price)", text: $priceText)
                    TextField("Provider", text: $provider)
                }
            }
            .navigationTitle("Add Product")
        }
    }
}
