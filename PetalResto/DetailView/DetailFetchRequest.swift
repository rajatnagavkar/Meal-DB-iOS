//
//  DetailFetchRequest.swift
//  PetalResto
//
//  Created by Rajat Nagavkar on 5/16/22.
//

import UIKit

class DetailFetchRequest: DetailFetchProtocol {
    
    func detailFetchRecords(id: String, completion: @escaping (Result<DetailMeal, Error>) -> ()) {
        
        let urlString = "https://www.themealdb.com/api/json/v1/1/lookup.php?i=\(id)"
        
        Network().fetchData(urlString: urlString) { (result) in
            switch result {
                case .success(let data):
                if let decodeData = try? JSONDecoder().decode(DetailMeal.self, from: data) {
                    completion(.success(decodeData))
                }
                case .failure(let error):
                    completion(.failure(error))
            }
        }
    }
    
}
