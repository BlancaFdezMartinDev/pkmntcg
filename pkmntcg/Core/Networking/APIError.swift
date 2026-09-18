//
//  APIError.swift
//  pkmntcg
//
//  Created by blanca.a.fernandez on 18/09/2026.
//

enum APIError: Error {
    case invalidURL
    case invalidResponse
    case decodingError(Error)
}
