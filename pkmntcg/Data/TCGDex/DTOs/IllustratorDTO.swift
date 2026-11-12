//
//  IllustratorDTO.swift
//  pkmntcg
//
//  Created by Fernández Martin, Blanca María on 12/11/2026.
//

struct IllustratorDTO: Codable {
  let name: String
  let cards: [IllustratorCardDTO]
}
