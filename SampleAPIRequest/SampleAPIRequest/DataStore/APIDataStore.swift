//
//  APIDataStore.swift
//  SampleAPIRequest
//
//  Created by af_nakandakari_toru on 2024/10/08.
//

import Foundation

enum APIError: Error {
    case invalidPath
    case serverError
    case decodeError
}

protocol APIDataStore: Sendable {
    func request<T: Decodable>(path: String) async throws -> T
}

struct APIDataStoreImpl: APIDataStore {

    let session = URLSession.shared

    func request<T>(path: String) async throws -> T where T : Decodable {
        guard let url = URL(string: path) else {
            throw APIError.invalidPath
        }
        let request = URLRequest(url: url)
        do {
            let (data, response) = try await session.data(for: request)
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                throw APIError.serverError
            }
            let decoder = JSONDecoder()
            do {
                let response = try decoder.decode(T.self, from: data)
                return response
            } catch {
                throw APIError.decodeError
            }
        }
    }
}
