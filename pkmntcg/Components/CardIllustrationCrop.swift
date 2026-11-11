//
//  CardIllustrationCrop.swift
//  pkmntcg
//
//  Created by Fernández Martin, Blanca María on 10/11/2026.
//

import SwiftUI

struct CardIllustrationCrop {
  static let imageAspectRatio: CGFloat = 498.0 / 695.0

  static let standard = CardIllustrationCrop(originX: 0.0833, originY: 0.1007, width: 0.8333, height: 0.3712)

  static let fullArt = CardIllustrationCrop(originX: 0.0402, originY: 0.0288, width: 0.9197, height: 0.9424)

  let originX: CGFloat

  let originY: CGFloat

  let width: CGFloat

  let height: CGFloat

  var aspectRatio: CGFloat {
    width * Self.imageAspectRatio / height
  }
}

extension CardIllustrationCrop {
  init(layout: CardLayout) {
    switch layout {
    case .standard:
      self = .standard
    case .fullArt:
      self = .fullArt
    }
  }
}
