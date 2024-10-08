//
//  PostDetailView.swift
//  SampleAPIRequest
//
//  Created by af_nakandakari_toru on 2024/10/08.
//

import SwiftUI

struct PostDetailView: View {
    let post: Post

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("id: \(post.id)")
            Text("userId: \(post.userId)")
            Text("title: \(post.title)")
            Text("body: \(post.body)")
        }
        .padding()
    }
}

#Preview {
    PostDetailView(
        post: Post(
            userId: 1,
            id: 1,
            title: "hoge",
            body: "fuga"
        )
    )
}
