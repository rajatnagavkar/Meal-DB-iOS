//
//  Network.swift
//  PetalResto
//
//  Created by Rajat Nagavkar on 5/16/22.
//

import UIKit


class Network {
    
    func fetchData(urlString: String, completion: @escaping (Result<Data, Error>)->()){
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            if let data = data {
                completion(.success(data))
            }
        }
        .resume()
    }
}
