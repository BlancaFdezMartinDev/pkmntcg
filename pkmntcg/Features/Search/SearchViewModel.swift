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
  
  init(getIllustratorCardsUseCase: any GetIllustratorCardsUseCaseProtocol) {
    self.getIllustratorCardsUseCase = getIllustratorCardsUseCase
  }
  
  func search() {
    Task {
      let cards = try await getIllustratorCardsUseCase.execute(name: searchText)
      print(cards)
    }
  }
}
