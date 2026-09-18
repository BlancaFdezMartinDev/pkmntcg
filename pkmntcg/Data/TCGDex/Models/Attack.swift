//
//  Attack.swift
//  pkmntcg
//
//  Created by blanca.a.fernandez on 18/09/2026.
//

struct Attack: Codable {
    let cost: [String]
    let name: String
    let effect: String
    let damage: Int?
}
