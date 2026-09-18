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

    var path: String {
        switch self {
        case .illustrator(let name):
            let formattedName = name.replacingOccurrences(of: " ", with: "+")
            return "/illustrators/\(formattedName)"
        case .set(let id):
            return "/sets/\(id)"
        case .card(let id):
            return "/cards/\(id)"
        }
    }
}
