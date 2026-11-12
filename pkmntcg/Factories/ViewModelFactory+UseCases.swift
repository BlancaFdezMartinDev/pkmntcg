//
//  ViewModelFactory+UseCases.swift
//  pkmntcg
//
//  Created by Fernández Martin, Blanca María on 11/11/2026.
//

extension ViewModelFactory {
  func createSearchUseCases() -> SearchUseCases {
    SearchUseCases(getIllustratorCardsUseCase: useCasesFactory.createGetIllustratorCardsUseCase())
  }
  
}
