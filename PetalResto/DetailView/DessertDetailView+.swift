//
//  DessertDetailView+.swift
//  PetalResto
//
//  Created by Rajat Nagavkar on 5/17/22.
//

import Foundation
import UIKit

extension DessertDetailView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ingredientsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as? IngrediantsCell
        let key = Array(ingredientsArray.keys)[indexPath.row]
        let value = Array(ingredientsArray.values)[indexPath.row]
        cell?.viewModel = CellData(name: key, quantity: value)
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 30
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Ingredients"
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }

   
}
