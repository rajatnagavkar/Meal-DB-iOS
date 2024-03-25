//
//  FetchRequest.swift
//  PetalResto
//
//  Created by Rajat Nagavkar on 5/16/22.
//

import Foundation
import UIKit

class FetchRequest: FetchProtocol {
    
    
    func fetchRecords(completion: @escaping (Result<Meal, Error>) -> ()) {
        
        let urlString = "https://www.themealdb.com/api/json/v1/1/filter.php?c=Dessert"
        
        Network().fetchData(urlString: urlString) { (result) in
            switch result {
                case .success(let data):
                if let decodeData = try? JSONDecoder().decode(Meal.self, from: data) {
                    completion(.success(decodeData))
                } 
                case .failure(let error):
                    completion(.failure(error))
            }
        }
    }
}
