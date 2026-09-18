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
    HStack{
      CustomText(text: "search_title")
        .padding(.top, 20)
        .padding(.leading, 20)
      Spacer()
    }
    CustomSearchBar(searchText: $viewModel.searchText) {
      viewModel.search()
    }
    Spacer()
  }
}

#Preview {
  SearchView()
}
