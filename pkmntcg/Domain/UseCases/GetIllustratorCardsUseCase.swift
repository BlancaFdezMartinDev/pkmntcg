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
        async let illustrator = repository.getIllustrator(name: name)
        async let fullArtIds = repository.getCardIds(illustrator: name, rarities: FullArtRarities.all)
        let result = try await illustrator
        let ids = try await fullArtIds
        let cards = result.cards.map { $0.with(layout: ids.contains($0.id) ? .fullArt : .standard) }
        return Illustrator(name: result.name, cards: cards)
    }
}
