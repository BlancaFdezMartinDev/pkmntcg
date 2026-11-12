//
//  IllustratorMapper.swift
//  pkmntcg
//
//  Created by Fernández Martin, Blanca María on 12/11/2026.
//

import Foundation

enum IllustratorMapper {
  static func map(_ dto: IllustratorDTO) -> Illustrator {
    Illustrator(name: dto.name, cards: dto.cards.map { mapCard($0) })
  }

  static func mapCard(_ dto: IllustratorCardDTO) -> IllustratorCard {
    IllustratorCard(
      id: dto.id,
      localId: dto.localId,
      name: dto.name,
      imageBaseURL: dto.image.flatMap { URL(string: $0) },
      layout: .standard
    )
  }
}
