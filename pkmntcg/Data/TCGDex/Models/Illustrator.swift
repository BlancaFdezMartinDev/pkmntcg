//
//  Illustrator.swift
//  pkmntcg
//
//  Created by blanca.a.fernandez on 18/09/2026.
//

struct Illustrator: Codable {
  let name: String
  let cards: [IllustratorCard]
}

struct IllustratorCard: Codable {
  let id: String
  let localId: String
  let name: String
  let image: String?
}
