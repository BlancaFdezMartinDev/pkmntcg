//
//  TCGDexRepository.swift
//  pkmntcg
//
//  Created by blanca.a.fernandez on 18/09/2026.
//

final class TCGDexRepository: TCGDexRepositoryContract {
  private let apiClient: APIClientProtocol
  
  init(apiClient: APIClientProtocol = APIClient()) {
    self.apiClient = apiClient
  }
  
  func getIllustrator(name: String) async throws -> Illustrator {
    let dto: IllustratorDTO = try await apiClient.get(endpoint: TCGDexEndpoint.illustrator(name: name))
    return IllustratorMapper.map(dto)
  }
  
  func getCardIds(illustrator: String, rarities: [String]) async throws -> Swift.Set<String> {
    let endpoint = TCGDexEndpoint.cards(illustrator: illustrator, rarities: rarities)
    let dtos: [IllustratorCardDTO] = try await apiClient.get(endpoint: endpoint)
    return Swift.Set(dtos.map(\.id))
  }
}
