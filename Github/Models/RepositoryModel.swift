//
//  File.swift
//  Github
//
//  Created by Tatsushi Fukunaga on 2021/03/09.
//

import Foundation

struct RepositoryModel: Codable {
    let totalCount : Int
    let items : [Repository]
    
    enum CodingKeys: String, CodingKey{
        case totalCount = "total_count"
        case items = "items"
    }
}

struct Repository: Codable {
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
    
    private enum CodingKeys: String, CodingKey {
        case name = "name"
        case fullName = "full_name"
        case language = "language"
        case stargazersCount = "stargazers_count"
        case watchersCount = "watchers_count"
        case forksCount = "forks_count"
        case openIssuesCount = "open_issues_count"
        case owner = "owner"
        case htmlUrl = "html_url"
        case description = "description"
    }
}

struct Owner: Codable {
    let avatarUrl: String
    
    private enum CodingKeys: String, CodingKey {
        case avatarUrl = "avatar_url"
    }
}

