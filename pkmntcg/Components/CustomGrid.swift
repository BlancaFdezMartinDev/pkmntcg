//
//  CustomGrid.swift
//  pkmntcg
//
//  Created by blanca.a.fernandez on 18/09/2026.
//
import SwiftUI

struct CustomGridStyle {
  static let standard = CustomGridStyle(
    minimumItemWidth: CustomLayout.gridItemMinimumWidth,
    spacing: CustomSize.size02,
    horizontalPadding: CustomSize.size04
  )

  let minimumItemWidth: CGFloat

  let spacing: CGFloat

  let horizontalPadding: CGFloat
}

struct CustomGrid<Item, ID: Hashable, Content: View>: View {
  let items: [Item]

  let id: KeyPath<Item, ID>

  let style: CustomGridStyle

  let content: (Item) -> Content

  init(
    items: [Item],
    id: KeyPath<Item, ID>,
    style: CustomGridStyle = .standard,
    @ViewBuilder content: @escaping (Item) -> Content
  ) {
    self.items = items
    self.id = id
    self.style = style
    self.content = content
  }

  var body: some View {
    LazyVGrid(
      columns: [GridItem(.adaptive(minimum: style.minimumItemWidth), spacing: style.spacing)],
      spacing: style.spacing
    ) {
      ForEach(items, id: id) { item in
        content(item)
      }
    }
    .padding(.horizontal, style.horizontalPadding)
  }
}
