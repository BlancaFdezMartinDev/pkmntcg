//
//  AttackDTO.swift
//  pkmntcg
//
//  Created by Fernández Martin, Blanca María on 12/11/2026.
//

struct AttackDTO: Codable {
  let cost: [String]
  let name: String
  let effect: String
  let damage: Int?
}
