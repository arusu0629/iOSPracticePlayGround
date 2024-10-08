//
//  Post.swift
//  SampleAPIRequest
//
//  Created by af_nakandakari_toru on 2024/10/08.
//

import Foundation

/// https://jsonplaceholder.typicode.com/posts
struct Post: Decodable, Sendable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}
