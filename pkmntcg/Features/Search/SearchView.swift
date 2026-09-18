//
//  SearchView.swift
//  pkmntcg
//
//  Created by blanca.a.fernandez on 15/09/2026.
//
import SwiftUI

struct SearchView: View {
  @State private var viewModel = SearchViewModel(getIllustratorCardsUseCase: GetIllustratorCardsUseCase())
  @State private var isIllustrationOnly = false
  
  var body: some View {
    HStack{
      CustomText(text: "search_title")
        .padding(.top, 20)
        .padding(.leading, 20)
      Spacer()
    }
    CustomSearchBar(searchText: $viewModel.searchText) {
      viewModel.search()
    }
    Picker("Visualización", selection: $isIllustrationOnly) {
      Text("Carta")
        .tag(false)
      
      Text("Ilustración")
        .tag(true)
    }
    .pickerStyle(.segmented)
    .padding(.horizontal)
    ScrollView {
      CustomGrid(items: viewModel.cards, id: \.id) { card in
        CardItem(
          image: card.imageURL(),
          mode: isIllustrationOnly
          ? CardItem.Mode.illustration
          : .full
        )
      }
    }
  }
}

#Preview {
  SearchView()
}
