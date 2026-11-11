//
//  TCGDexRepositoryProtocol.swift
//  pkmntcg
//
//  Created by blanca.a.fernandez on 18/09/2026.
//

protocol TCGDexRepositoryProtocol {
    func getIllustrator(name: String) async throws -> Illustrator
    func getSet(id: String) async throws -> Illustrator
    func getCardIds(illustrator: String, rarities: [String]) async throws -> Swift.Set<String>
}
