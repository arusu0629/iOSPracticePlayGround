//
//  GetPostsUseCase.swift
//  SampleAPIRequest
//
//  Created by af_nakandakari_toru on 2024/10/08.
//

import Foundation

protocol GetPostsUseCase: Sendable {
    func execute() async throws -> [Post]
}

struct GetPostsInteractor: GetPostsUseCase {

    let apiDataStore: APIDataStore

    init(apiDataStore: APIDataStore = APIDataStoreImpl()) {
        self.apiDataStore = apiDataStore
    }

    func execute() async throws -> [Post] {
        let posts: [Post] = try await self.apiDataStore.request(path: "https://jsonplaceholder.typicode.com/posts")
        return posts
    }
}
