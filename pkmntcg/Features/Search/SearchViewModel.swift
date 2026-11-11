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
  var displayMode: CustomCardItem.Mode = .illustration
  let getIllustratorCardsUseCase: any GetIllustratorCardsUseCaseProtocol
  var cards: [IllustratorCard] = []
  var visibleCards: [IllustratorCard] = []
  private let pageSize = 16
  
  init(getIllustratorCardsUseCase: any GetIllustratorCardsUseCaseProtocol) {
    self.getIllustratorCardsUseCase = getIllustratorCardsUseCase
  }
  
  func search() {
    Task {
      let result = try await getIllustratorCardsUseCase.execute(name: searchText)
      self.cards = result.cards
      self.visibleCards = Array(cards.prefix(pageSize))
    }
  }
  
  func loadMoreIfNeeded(current card: IllustratorCard) {
    guard visibleCards.count < cards.count,
          let index = visibleCards.firstIndex(where: { $0.id == card.id }),
          index >= visibleCards.count - 4 else { return }
    let next = min(visibleCards.count + pageSize, cards.count)
    visibleCards = Array(cards[0..<next])
  }
}
