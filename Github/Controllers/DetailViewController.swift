//
//  DetailViewController.swift
//  Github
//
//  Created by Tatsushi Fukunaga on 2021/03/09.
//

import UIKit
import Nuke

class DetailViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var starsLabel: UILabel!
    @IBOutlet weak var wathcersLabel: UILabel!
    @IBOutlet weak var forksLabel: UILabel!
    @IBOutlet weak var issuesLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var repository : Repository!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpLabels()
        setUpImage()
    }
    
    func setUpLabels(){
        titleLabel.text = repository.fullName
        languageLabel.text = "Written in \(repository.language ?? "Unspecified Language")"
        starsLabel.text = "\(repository.stargazersCount) stars"
        wathcersLabel.text = "\(repository.watchersCount) watchers"
        forksLabel.text = "\(repository.forksCount) forks"
        issuesLabel.text = "\(repository.openIssuesCount) open issues"
        descriptionLabel.text = repository.description
    }
    
    func setUpImage() {
        if let imageURL = URL(string: repository.owner.avatarUrl) {
            Nuke.loadImage(with: imageURL, into: imageView)
            imageView.layer.cornerRadius = imageView.frame.height / 2
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "WebViewController" {
            let next = segue.destination as? WebViewController
            next?.urlString = self.repository.htmlUrl
        }
    }
    
    @IBAction func button(_ sender: Any) {
        performSegue(withIdentifier: "WebViewController", sender: nil)
    }
    
}

