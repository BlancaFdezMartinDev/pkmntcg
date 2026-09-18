//
//  TCGDesRepositoryProtocol.swift
//  pkmntcg
//
//  Created by blanca.a.fernandez on 18/09/2026.
//

protocol TCGDexRepositoryProtocol {
    func getIllustrator(name: String) async throws -> Illustrator
    func getSet(id: String) async throws -> Illustrator
}
