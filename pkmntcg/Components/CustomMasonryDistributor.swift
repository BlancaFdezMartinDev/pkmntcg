//
//  CustomMasonryDistributor.swift
//  pkmntcg
//
//  Created by Fernández Martin, Blanca María on 11/11/2026.
//

import CoreGraphics

struct MasonryDistributor {
  let columnCount: Int
  let columnWidth: CGFloat
  let spacing: CGFloat

  func distribute<Item>(_ items: [Item], heightRatio: (Item) -> CGFloat) -> [[Item]] {
    var columns = [[Item]](repeating: [], count: columnCount)
    var heights = [CGFloat](repeating: 0, count: columnCount)
    for item in items {
      let index = heights.indices.min { heights[$0] < heights[$1] } ?? 0
      columns[index].append(item)
      heights[index] += heightRatio(item) * columnWidth + spacing
    }
    return columns
  }
}
