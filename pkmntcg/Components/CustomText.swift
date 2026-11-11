//
//  CustomLabel.swift
//  pkmntcg
//
//  Created by blanca.a.fernandez on 18/09/2026.
//
import SwiftUI

struct CustomText: View {
  let text: LocalizedStringKey

  let font: Font

  let color: Color

  init(
    text: LocalizedStringKey,
    font: Font = CustomFont.body,
    color: Color = CustomColor.textPrimary
  ) {
    self.text = text
    self.font = font
    self.color = color
  }

  var body: some View {
    Text(text)
      .font(font)
      .foregroundStyle(color)
  }
}
