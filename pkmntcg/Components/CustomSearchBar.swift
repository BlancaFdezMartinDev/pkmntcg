//
//  CustomSearchBar.swift
//  pkmntcg
//
//  Created by blanca.a.fernandez on 15/09/2026.
//
import SwiftUI

struct CustomSearchBar: View {
  struct Style {
    static let standard = Style(
      background: CustomColor.searchBarBackground,
      cornerRadius: CustomRadius.searchBar,
      padding: CustomSize.size03,
      horizontalPadding: CustomSize.size04
    )

    let background: Color

    let cornerRadius: CGFloat

    let padding: CGFloat

    let horizontalPadding: CGFloat
  }

  let placeholder: LocalizedStringKey

  @Binding var searchText: String

  let style: Style

  let action: () -> Void

  init(
    placeholder: LocalizedStringKey = "search_placeholder",
    searchText: Binding<String>,
    style: Style = .standard,
    action: @escaping () -> Void
  ) {
    self.placeholder = placeholder
    self._searchText = searchText
    self.style = style
    self.action = action
  }

  var body: some View {
    TextField(placeholder, text: $searchText)
      .padding(style.padding)
      .background(style.background, in: RoundedRectangle(cornerRadius: style.cornerRadius))
      .padding(.horizontal, style.horizontalPadding)
      .onSubmit(action)
  }
}
