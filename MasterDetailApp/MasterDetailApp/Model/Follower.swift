//
//  Follower.swift
//  MasterDetailApp
//
//  Created by Atalay Aşa on 10.09.2020.
//  Copyright © 2020 Atalay Aşa. All rights reserved.
//

import Foundation

struct Follower: Decodable {
    let userId: Int
    let loginName: String
    let followersUrl: URL
    let organizationsUrl: URL
    let reposUrl: URL
}

extension Follower {
    enum CodingKeys: String, CodingKey {
        case userId = "id"
        case loginName = "login"
        case followersUrl = "followers_url"
        case organizationsUrl = "organizations_url"
        case reposUrl = "repos_url"
    }
}
