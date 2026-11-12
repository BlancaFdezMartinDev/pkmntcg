//
//  CardDTO.swift
//  pkmntcg
//
//  Created by Fernández Martin, Blanca María on 12/11/2026.
//

struct CardDTO: Codable {
  let category: String
  let id: String
  let illustrator: String
  let image: String?
  let localId: String
  let name: String
  let rarity: String
  let set: CardSetDTO
  let variants: VariantsDTO
  let hp: Int
  let types: [String]
  let evolveFrom: String?
  let description: String
  let stage: String
  let attacks: [AttackDTO]
  let weaknesses: [WeaknessDTO]
  let retreat: Int
  let regulationMark: String
  let legal: LegalDTO
}
