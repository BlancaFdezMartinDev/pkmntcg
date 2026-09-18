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
  let id: String
  let localId: String
  let name: String
  let image: String?
  
  func imageURL(
      quality: ImageQuality = .low,
      format: ImageFormat = .webp
  ) -> URL? {
      guard let image else { return nil }

      return URL(
          string: "\(image)/\(quality.rawValue).\(format.rawValue)"
      )
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
