//
//  CustomCardItem.swift
//  pkmntcg
//
//  Created by blanca.a.fernandez on 18/09/2026.
//
import SwiftUI

struct CustomCardItem: View {
  enum Mode { case full, illustration }

  struct Style {
    static let standard = Style(
      cornerRadius: CustomRadius.card,
      shadowColor: CustomColor.shadow,
      shadowOpacity: CustomOpacity.shadow,
      shadowRadius: CustomSize.size02,
      shadowOffsetY: CustomSize.size02
    )

    let cornerRadius: CGFloat

    let shadowColor: Color

    let shadowOpacity: Double

    let shadowRadius: CGFloat

    let shadowOffsetY: CGFloat
  }

  let image: URL?

  let mode: Mode

  let illustrationCrop: CardIllustrationCrop

  let style: Style

  init(
    image: URL?,
    mode: Mode,
    illustrationCrop: CardIllustrationCrop = .standard,
    style: Style = .standard
  ) {
    self.image = image
    self.mode = mode
    self.illustrationCrop = illustrationCrop
    self.style = style
  }

  var body: some View {
    Color.clear
      .aspectRatio(aspectRatio, contentMode: .fit)
      .overlay {
        AsyncImage(url: image) { phase in
          PhaseContent(phase: phase, mode: mode, crop: illustrationCrop)
        }
      }
      .clipShape(RoundedRectangle(cornerRadius: style.cornerRadius))
      .shadow(
        color: style.shadowColor.opacity(style.shadowOpacity),
        radius: style.shadowRadius,
        x: 0,
        y: style.shadowOffsetY
      )
  }

  private var aspectRatio: CGFloat {
    switch mode {
    case .full:
      CardIllustrationCrop.imageAspectRatio
    case .illustration:
      illustrationCrop.aspectRatio
    }
  }

  private struct PhaseContent: View {
    let phase: AsyncImagePhase

    let mode: Mode

    let crop: CardIllustrationCrop

    var body: some View {
      switch phase {
      case .success(let loaded):
        switch mode {
        case .full:
          loaded.resizable().scaledToFit()
        case .illustration:
          IllustrationCropLayout(crop: crop) { loaded.resizable() }
        }
      case .failure:
        Image(systemName: "photo").font(CustomFont.icon)
      case .empty:
        ProgressView()
      @unknown default:
        EmptyView()
      }
    }
  }
}

//TODO: poner url real
#Preview {
  HStack {
    CustomCardItem(image: URL(string: "https://assets.tcgdex.net/en/swsh/swsh3/136/high.webp"), mode: .full)
    CustomCardItem(image: URL(string: "https://assets.tcgdex.net/en/swsh/swsh3/136/high.webp"), mode: .illustration)
    CustomCardItem(image: URL(string: "https://assets.tcgdex.net/en/swsh/swsh3/136/high.webp"), mode: .illustration, illustrationCrop: .fullArt)
  }
}
