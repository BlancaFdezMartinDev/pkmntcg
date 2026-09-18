//
//  GetIllustratorCardsUseCase.swift
//  pkmntcg
//
//  Created by blanca.a.fernandez on 18/09/2026.
//

protocol GetIllustratorCardsUseCaseProtocol {
    func execute(name: String) async throws -> Illustrator
}

final class GetIllustratorCardsUseCase: GetIllustratorCardsUseCaseProtocol {
    private let repository: TCGDexRepositoryProtocol

    init(repository: TCGDexRepositoryProtocol = TCGDexRepository()) {
        self.repository = repository
    }

    func execute(name: String) async throws -> Illustrator {
        let illustrator = try await repository.getIllustrator(name: name)
      return illustrator
        // Aquí podrías añadir lógica extra: filtrar, ordenar, cachear, etc.
    }
}
