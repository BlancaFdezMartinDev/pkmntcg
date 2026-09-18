//
//  CustomGrid.swift
//  pkmntcg
//
//  Created by blanca.a.fernandez on 18/09/2026.
//
import SwiftUI

struct CustomGrid<Item, ID: Hashable, Content: View>: View {
    
    let items: [Item]
    let columns: Int
    let id: KeyPath<Item, ID>
    let content: (Item) -> Content
    
    init(
        items: [Item],
        columns: Int = 2,
        id: KeyPath<Item, ID>,
        @ViewBuilder content: @escaping (Item) -> Content
    ) {
        self.items = items
        self.columns = columns
        self.id = id
        self.content = content
    }
    
    var body: some View {
        LazyVGrid(
            columns: gridColumns,
            spacing: 16
        ) {
            ForEach(items, id: id) { item in
                content(item)
            }
        }
        .padding(.horizontal, 12)
    }
    
    private var gridColumns: [GridItem] {
        Array(
            repeating: GridItem(.flexible(), spacing: 12),
            count: columns
        )
    }
}
