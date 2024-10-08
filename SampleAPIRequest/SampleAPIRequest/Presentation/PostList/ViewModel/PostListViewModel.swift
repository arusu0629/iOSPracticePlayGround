//
//  PostListViewModel.swift
//  SampleAPIRequest
//
//  Created by af_nakandakari_toru on 2024/10/08.
//

import Foundation

@MainActor
final class PostListViewModel: ObservableObject {
    @Published var posts: [Post] = []
    @Published var errorMessage: String? = nil
    @Published var isLoading: Bool = false
    let useCase: GetPostsUseCase

    init(useCase: GetPostsUseCase) {
        self.useCase = useCase
    }

    func fetchPosts() async {
        self.isLoading = true
        defer {
            self.isLoading = false
        }
        do {
            let posts = try await self.useCase.execute()
            self.posts = posts
            self.errorMessage = nil
        } catch {
            self.errorMessage = "Failed to fetch posts: \(error.localizedDescription)"
        }
    }
}
