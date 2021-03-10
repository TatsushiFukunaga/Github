//
//  SearchModel.swift
//  Github
//
//  Created by Tatsushi Fukunaga on 2021/03/09.
//

import Foundation

protocol SearchModelDelegate: class {
    func dataDidUpdate()
}

class SearchModel {
    
    var repositories: [Repository] = []
    weak var searchModelDelegate: SearchModelDelegate?
    
    func getData(word: String) {
        
        let urlString = "https://api.github.com/search/repositories?q=\(word)"
        guard let url = URL(string: urlString) else { return }
        
         let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let data = data, error == nil else { return }
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let object = try decoder.decode(RepositoryModel.self, from: data)
                self.repositories = object.items
                
                DispatchQueue.main.async { [weak self] in
                    guard let self = self else { return }
                    self.searchModelDelegate?.dataDidUpdate()
                }
            } catch {
                print(error)
            }
        }
        task.resume()
        
    }
    
}
