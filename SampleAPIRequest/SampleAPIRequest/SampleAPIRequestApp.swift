//
//  SampleAPIRequestApp.swift
//  SampleAPIRequest
//
//  Created by af_nakandakari_toru on 2024/10/08.
//

import SwiftUI

@main
struct SampleAPIRequestApp: App {
    var body: some Scene {
        WindowGroup {
            PostListView(
                viewModel: PostListViewModel(
                    useCase: GetPostsInteractor()
                )
            )
        }
    }
}
