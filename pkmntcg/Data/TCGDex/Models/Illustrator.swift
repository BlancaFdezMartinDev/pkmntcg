//
//  Illustrator.swift
//  pkmntcg
//
//  Created by blanca.a.fernandez on 18/09/2026.
//
import SwiftUI

struct Illustrator: Codable {
  let name: String
  let cards: [IllustratorCard]
}

struct IllustratorCard: Codable {
  enum CodingKeys: String, CodingKey {
    case id, localId, name, image
  }
  let id: String
  let localId: String
  let name: String
  let image: String?
  var layout: CardLayout = .standard

  func with(layout: CardLayout) -> IllustratorCard {
    IllustratorCard(id: id, localId: localId, name: name, image: image, layout: layout)
  }

  func imageURL(quality: ImageQuality = .low, format: ImageFormat = .webp) -> URL? {
    guard let image else { return nil }
    return URL(string: "\(image)/\(quality.rawValue).\(format.rawValue)")
  }
}

enum ImageQuality: String {
  case low
  case high
}

enum ImageFormat: String {
  case webp
  case png
  case jpg
}
