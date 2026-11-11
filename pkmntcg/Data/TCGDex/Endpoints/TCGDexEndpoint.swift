//
//  TCGDexEndpoint.swift
//  pkmntcg
//
//  Created by blanca.a.fernandez on 18/09/2026.
//
import Foundation

enum TCGDexEndpoint: Endpoint {
    case illustrator(name: String)
    case set(id: String)
    case card(id: String)
    case cards(illustrator: String, rarities: [String])

    var path: String {
        switch self {
        case .illustrator(let name):
            let formattedName = name.replacingOccurrences(of: " ", with: "+")
            return "/illustrators/\(formattedName)"
        case .set(let id):
            return "/sets/\(id)"
        case .card(let id):
            return "/cards/\(id)"
        case .cards(let illustrator, let rarities):
            let formattedIllustrator = illustrator.replacingOccurrences(of: " ", with: "+")
            let spacedRarities = rarities.map { $0.replacingOccurrences(of: " ", with: "+") }
            let formattedRarities = spacedRarities.joined(separator: "|")
            return "/cards?illustrator=\(formattedIllustrator)&rarity=eq:\(formattedRarities)"
        }
    }
}
