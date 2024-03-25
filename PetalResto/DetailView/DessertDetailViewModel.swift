//
//  DessertDetailViewModel.swift
//  PetalResto
//
//  Created by Rajat Nagavkar on 5/16/22.
//

import Foundation
import UIKit


protocol DetailFetchProtocol: AnyObject {
    func detailFetchRecords(id: String, completion: @escaping (Result<DetailMeal, Error>)->())
}

class DessertDetailViewModel {
    
    var result: DetailMeal?
    let detailFetchProtocol: DetailFetchProtocol
    
    init(detailFetchProtocol: DetailFetchProtocol = DetailFetchRequest(), result: DetailMeal?) {
        self.detailFetchProtocol = detailFetchProtocol
        self.result = result
    }
    
    func detailFetchRecords(id: String, completion: @escaping (Result<DetailMeals, Error>)->()) {

        detailFetchProtocol.detailFetchRecords(id: id) { (result) in
            switch result {
                case .success(let results):
                if let meal = results.meals.first {
                    completion(.success(meal))
                } else {
                    let error = NSError(domain: "decodeError", code: 101)
                    completion(.failure(error))
                }
                case .failure(let error):
                    completion(.failure(error))
            }
        }
    }
}
