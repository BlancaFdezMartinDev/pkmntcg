//
//  Set.swift
//  pkmntcg
//
//  Created by blanca.a.fernandez on 18/09/2026.
//

struct Set: Codable {
    let cardCount: CardCount
    let id: String
    let logo: String
    let name: String
    let symbol: String
}

struct CardCount: Codable {
    let official: Int
    let total: Int
}
