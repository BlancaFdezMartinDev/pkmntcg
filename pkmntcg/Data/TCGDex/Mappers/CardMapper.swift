//
//  CardMapper.swift
//  pkmntcg
//
//  Created by Fernández Martin, Blanca María on 12/11/2026.
//

import Foundation

enum CardMapper {
  static func map(_ dto: CardDTO) -> Card {
    Card(
      category: dto.category,
      id: dto.id,
      illustrator: dto.illustrator,
      imageBaseURL: dto.image.flatMap { URL(string: $0) },
      localId: dto.localId,
      name: dto.name,
      rarity: dto.rarity,
      set: mapCardSet(dto.set),
      variants: mapVariants(dto.variants),
      hp: dto.hp,
      types: dto.types,
      evolveFrom: dto.evolveFrom,
      description: dto.description,
      stage: dto.stage,
      attacks: dto.attacks.map { mapAttack($0) },
      weaknesses: dto.weaknesses.map { mapWeakness($0) },
      retreat: dto.retreat,
      regulationMark: dto.regulationMark,
      legal: mapLegal(dto.legal)
    )
  }

  static func mapCardSet(_ dto: CardSetDTO) -> CardSet {
    CardSet(
      cardCount: CardCount(official: dto.cardCount.official, total: dto.cardCount.total),
      id: dto.id,
      logo: dto.logo,
      name: dto.name,
      symbol: dto.symbol
    )
  }

  static func mapVariants(_ dto: VariantsDTO) -> Variants {
    Variants(
      firstEdition: dto.firstEdition,
      holo: dto.holo,
      normal: dto.normal,
      reverse: dto.reverse,
      wPromo: dto.wPromo
    )
  }

  static func mapAttack(_ dto: AttackDTO) -> Attack {
    Attack(cost: dto.cost, name: dto.name, effect: dto.effect, damage: dto.damage)
  }

  static func mapWeakness(_ dto: WeaknessDTO) -> Weakness {
    Weakness(type: dto.type, value: dto.value)
  }

  static func mapLegal(_ dto: LegalDTO) -> Legal {
    Legal(standard: dto.standard, expanded: dto.expanded)
  }
}
