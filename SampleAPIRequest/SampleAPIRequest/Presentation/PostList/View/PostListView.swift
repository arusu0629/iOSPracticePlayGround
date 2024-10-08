//
//  PostListView.swift
//  SampleAPIRequest
//
//  Created by af_nakandakari_toru on 2024/10/08.
//

import SwiftUI

struct PostListView: View {

    @StateObject var viewModel: PostListViewModel

    var body: some View {
        VStack {
            if viewModel.isLoading {
                ProgressView("Loading Posts...")
                    .padding()
            } else if let errorMessage = viewModel.errorMessage {
                Text(errorMessage)
                    .foregroundStyle(.red)
                    .padding()
            } else {
                List {
                    ForEach(self.viewModel.posts, id: \.id) { post in
                        NavigationLink(destination: {
                            PostDetailView(post: post)
                        }) {
                            VStack(alignment: .leading) {
                                Text("id: \(post.id)")
                                Text("title: \(post.title)")
                            }
                        }
                    }
                }
            }
        }
        .navigationTitle("Post List")
        .onAppear {
            Task {
                do {
                    await self.viewModel.fetchPosts()
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        PostListView(
            viewModel: PostListViewModel(useCase: GetPostsInteractor())
        )
    }
}
