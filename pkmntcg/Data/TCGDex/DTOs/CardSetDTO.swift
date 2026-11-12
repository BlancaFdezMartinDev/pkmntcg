//
//  CardSetDTO.swift
//  pkmntcg
//
//  Created by Fernández Martin, Blanca María on 12/11/2026.
//

struct CardSetDTO: Codable {
  let cardCount: CardCountDTO
  let id: String
  let logo: String
  let name: String
  let symbol: String
}

struct CardCountDTO: Codable {
  let official: Int
  let total: Int
}
