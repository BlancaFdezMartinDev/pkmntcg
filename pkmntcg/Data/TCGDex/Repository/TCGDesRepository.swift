//
//  TCGDesRepository.swift
//  pkmntcg
//
//  Created by blanca.a.fernandez on 18/09/2026.
//

final class TCGDexRepository: TCGDexRepositoryProtocol {
    private let apiClient: APIClientProtocol

    init(apiClient: APIClientProtocol = APIClient()) {
        self.apiClient = apiClient
    }

    func getIllustrator(name: String) async throws -> Illustrator {
        try await apiClient.get(endpoint: TCGDexEndpoint.illustrator(name: name))
    }

    func getSet(id: String) async throws -> Illustrator {
        try await apiClient.get(endpoint: TCGDexEndpoint.set(id: id))
    }
}
