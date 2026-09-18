//
//  SearchViewModel.swift
//  pkmntcg
//
//  Created by blanca.a.fernandez on 15/09/2026.
//

import SwiftUI

@Observable
class SearchViewModel {
  var searchText: String = ""
  let getIllustratorCardsUseCase: any GetIllustratorCardsUseCaseProtocol
  var cards: [IllustratorCard] = []
  
  init(getIllustratorCardsUseCase: any GetIllustratorCardsUseCaseProtocol) {
    self.getIllustratorCardsUseCase = getIllustratorCardsUseCase
  }
  
  func search() {
    Task {
      let result = try await getIllustratorCardsUseCase.execute(name: searchText)
      self.cards = result.cards
    }
  }
}
