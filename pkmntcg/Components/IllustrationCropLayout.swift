//
//  IllustrationCropLayout.swift
//  pkmntcg
//
//  Created by Fernández Martin, Blanca María on 10/11/2026.
//

import SwiftUI

struct IllustrationCropLayout: Layout {
  let crop: CardIllustrationCrop

  func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout Void) -> CGSize {
    let width = proposal.replacingUnspecifiedDimensions().width
    return CGSize(width: width, height: width / crop.aspectRatio)
  }

  func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout Void) {
    let imageWidth = bounds.width / crop.width
    let imageHeight = imageWidth / CardIllustrationCrop.imageAspectRatio
    let origin = CGPoint(x: bounds.minX - crop.originX * imageWidth, y: bounds.minY - crop.originY * imageHeight)
    subviews.first?.place(at: origin, proposal: ProposedViewSize(width: imageWidth, height: imageHeight))
  }
}
