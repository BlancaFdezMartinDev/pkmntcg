//
//  CustomMasonryGrind.swift
//  pkmntcg
//
//  Created by Fernández Martin, Blanca María on 11/11/2026.
//

import SwiftUI

struct CustomMasonryGrid<Item, ID: Hashable, Content: View>: View {
  let items: [Item]

  let id: KeyPath<Item, ID>

  let heightRatio: (Item) -> CGFloat

  let style: CustomGridStyle

  let content: (Item) -> Content

  @State private var totalWidth: CGFloat = 0

  init(
    items: [Item],
    id: KeyPath<Item, ID>,
    heightRatio: @escaping (Item) -> CGFloat,
    style: CustomGridStyle = .standard,
    @ViewBuilder content: @escaping (Item) -> Content
  ) {
    self.items = items
    self.id = id
    self.heightRatio = heightRatio
    self.style = style
    self.content = content
  }

  private var availableWidth: CGFloat {
    totalWidth - style.horizontalPadding - style.horizontalPadding
  }

  private var columnCount: Int {
    max(
      Int((availableWidth + style.spacing) / (style.minimumItemWidth + style.spacing)),
      CustomLayout.minimumColumnCount
    )
  }

  private var columnWidth: CGFloat {
    (availableWidth + style.spacing) / CGFloat(columnCount) - style.spacing
  }

  private var columns: [[Item]] {
    MasonryDistributor(
      columnCount: columnCount,
      columnWidth: columnWidth,
      spacing: style.spacing
    ).distribute(items, heightRatio: heightRatio)
  }

  var body: some View {
    HStack(alignment: .top, spacing: style.spacing) {
      ForEach(columns.indices, id: \.self) { index in
        LazyVStack(spacing: style.spacing) {
          ForEach(columns[index], id: id) { item in
            content(item)
          }
        }
        .frame(maxWidth: .infinity)
      }
    }
    .frame(maxWidth: .infinity)
    .padding(.horizontal, style.horizontalPadding)
    .onGeometryChange(for: CGFloat.self) { proxy in
      proxy.size.width
    } action: { width in
      totalWidth = width
    }
  }
}
