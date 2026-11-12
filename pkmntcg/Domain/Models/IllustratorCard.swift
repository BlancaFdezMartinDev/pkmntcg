//
//  IllustratorCard.swift
//  pkmntcg
//
//  Created by Fernández Martin, Blanca María on 12/11/2026.
//

import Foundation

struct IllustratorCard {
  let id: String
  let localId: String
  let name: String
  let imageBaseURL: URL?
  var layout: CardLayout = .standard

  func with(layout: CardLayout) -> IllustratorCard {
    IllustratorCard(id: id, localId: localId, name: name, imageBaseURL: imageBaseURL, layout: layout)
  }

  func imageURL(quality: ImageQuality = .high, format: ImageFormat = .webp) -> URL? {
    imageBaseURL?.appendingPathComponent("\(quality.rawValue).\(format.rawValue)")
  }
}
