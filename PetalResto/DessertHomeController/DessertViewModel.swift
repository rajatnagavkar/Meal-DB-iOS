//
//  DessertModel.swift
//  PetalResto
//
//  Created by Rajat Nagavkar on 5/16/22.
//

import Foundation
import UIKit

protocol FetchProtocol: AnyObject {
    func fetchRecords(completion: @escaping (Result<Meal, Error>)->())
}

class DessertViewModel {

    var result: Meal?
    let fetchProtocol: FetchProtocol
    
    init(fetchProtocol: FetchProtocol = FetchRequest(), result: Meal?) {
        self.fetchProtocol = fetchProtocol
        self.result = result
    }
    
    
    func fetchRecords(completion: @escaping (Result<Bool, Error>)->()) {

        fetchProtocol.fetchRecords { [weak self] (result) in
            switch result {
                case .success(let results):
                    self?.result = results
                    completion(.success(true))
                case .failure(let error):
                    completion(.failure(error))
            }
        }
    }
}

