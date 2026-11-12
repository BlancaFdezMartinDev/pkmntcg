//
//  ViewModelFactory.swift
//  pkmntcg
//
//  Created by Fernández Martin, Blanca María on 11/11/2026.
//

import Combine

class ViewModelFactory: ObservableObject {
  let useCasesFactory: UseCasesFactory
  
  init(useCasesFactory: UseCasesFactory) {
    self.useCasesFactory = useCasesFactory
  }
  
  func makeSearchViewModel() -> SearchViewModel {
    SearchViewModel(useCases: createSearchUseCases())
  }
}
