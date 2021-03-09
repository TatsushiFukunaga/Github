//
//  DetailModel.swift
//  Github
//
//  Created by Tatsushi Fukunaga on 2021/03/09.
//

import Foundation

protocol DetailModelDelegate: class {
    func updateView(data: Data)
}

class DetailModel {
    
    weak var detailModelDelegate: DetailModelDelegate?
    
    func getImage(url: URL){
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let data = data, error == nil else { return }
            self.detailModelDelegate?.updateView(data: data)
            
        }
        .resume()
        
    }
    
}
