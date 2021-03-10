//
//  ViewController.swift
//  Github
//
//  Created by Tatsushi Fukunaga on 2021/03/09.
//

import UIKit

class SearchViewController: UIViewController, UISearchBarDelegate, SearchModelDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet var tableView: UITableView!
    
    var searchModel = SearchModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.placeholder = "GitHubのリポジトリを検索"
        searchBar.delegate = self
        
        let nib = UINib(nibName: "RepositoryCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "RepositoryCell")
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let word = searchBar.text {
            searchModel.searchModelDelegate = self
            searchModel.getData(word: word)
        }
    }
    
    func dataDidUpdate() {
        tableView.reloadData()
    }
    
}

extension SearchViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchModel.repositories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "RepositoryCell", for: indexPath ) as! RepositoryCell
        let repository = searchModel.repositories[indexPath.row]
        cell.nameLabel.text = repository.name
        cell.starLabel.text = "\(repository.stargazersCount)"
        cell.languageLabel.text = repository.language ?? "Unspecified Language"
        return cell
        
    }
    
}

extension SearchViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let detailVC = self.storyboard!.instantiateViewController(identifier: "DetailViewController") as? DetailViewController
        detailVC!.repository = searchModel.repositories[indexPath.row]
        self.navigationController?.pushViewController(detailVC!, animated: true)
        
    }
    
}


