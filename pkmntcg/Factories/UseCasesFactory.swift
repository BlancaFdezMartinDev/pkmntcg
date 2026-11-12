//
//  UseCasesFactory.swift
//  pkmntcg
//
//  Created by Fernández Martin, Blanca María on 11/11/2026.
//

import Combine

public class UseCasesFactory: ObservableObject {
  
  let tcgDexRepository: any TCGDexRepositoryContract
  
  @MainActor
  init(tcgDexRepository: any TCGDexRepositoryContract) {
    self.tcgDexRepository = tcgDexRepository
  }
  
  func createGetIllustratorCardsUseCase() -> any GetIllustratorCardsUseCaseContract {
    GetIllustratorCardsUseCase(repository: tcgDexRepository)
  }
}
