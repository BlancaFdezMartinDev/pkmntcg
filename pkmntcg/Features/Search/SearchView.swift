//
//  SearchView.swift
//  pkmntcg
//
//  Created by blanca.a.fernandez on 15/09/2026.
//
import SwiftUI

struct SearchView: View {
  @State private var viewModel = SearchViewModel(getIllustratorCardsUseCase: GetIllustratorCardsUseCase())

  var body: some View {
    HStack {
      CustomText(text: "search_title", font: CustomFont.title)
        .padding(.top, CustomSize.size04)
        .padding(.leading, CustomSize.size04)
      Spacer()
    }
    CustomSearchBar(searchText: $viewModel.searchText) {
      viewModel.search()
    }
    CustomSegmentedControl(
      title: "search_display_mode",
      selection: $viewModel.displayMode,
      options: [
        .init(value: .illustration, title: "search_mode_illustration"),
        .init(value: .full, title: "search_mode_full")
      ]
    )
    ScrollView {
      if viewModel.displayMode == .illustration {
        CustomMasonryGrid(
          items: viewModel.visibleCards,
          id: \.id,
          heightRatio: { CardIllustrationCrop(layout: $0.layout).cellHeightRatio }
        ) { card in
          CustomCardItem(
            image: card.imageURL(),
            mode: viewModel.displayMode,
            illustrationCrop: CardIllustrationCrop(layout: card.layout)
          )
          .onAppear {
            viewModel.loadMoreIfNeeded(current: card)
          }
        }
      } else {
        CustomGrid(items: viewModel.visibleCards, id: \.id) { card in
          CustomCardItem(
            image: card.imageURL(),
            mode: viewModel.displayMode,
            illustrationCrop: CardIllustrationCrop(layout: card.layout)
          )
          .onAppear {
            viewModel.loadMoreIfNeeded(current: card)
          }
        }
      }
    }
  }
}

#Preview {
  SearchView()
}
