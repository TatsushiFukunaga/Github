//
//  File.swift
//  Github
//
//  Created by Tatsushi Fukunaga on 2021/03/09.
//

import Foundation

struct RepositoryModel: Decodable {
    let totalCount : Int
    let items : [Repository]
}

struct Repository: Decodable {
    let name: String
    let fullName: String
    let language: String?
    let stargazersCount: Int
    let watchersCount: Int
    let forksCount: Int
    let openIssuesCount: Int
    let owner: Owner
    let htmlUrl: String
    let description: String?
}

struct Owner: Decodable {
    let login: String
    let avatarUrl: String
}

