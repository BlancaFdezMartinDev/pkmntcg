//
//  CustomSegmentedControl.swift
//  pkmntcg
//
//  Created by Fernández Martin, Blanca María on 10/11/2026.
//

import SwiftUI

struct CustomSegmentedControl<Value: Hashable>: View {
  struct Option: Identifiable {
    let value: Value

    let title: LocalizedStringKey

    var id: Value { value }
  }

  let title: LocalizedStringKey

  @Binding var selection: Value

  let options: [Option]

  let horizontalPadding: CGFloat

  init(
    title: LocalizedStringKey,
    selection: Binding<Value>,
    options: [Option],
    horizontalPadding: CGFloat = CustomSize.size04
  ) {
    self.title = title
    self._selection = selection
    self.options = options
    self.horizontalPadding = horizontalPadding
  }

  var body: some View {
    Picker(title, selection: $selection) {
      ForEach(options) { option in
        CustomText(text: option.title).tag(option.value)
      }
    }
    .pickerStyle(.segmented)
    .padding(.horizontal, horizontalPadding)
  }
}
