//
//  DessertController.swift
//  PetalResto
//
//  Created by Rajat Nagavkar on 5/16/22.
//

import Foundation
import UIKit

// MARK: - DessertHome TableView Delegate and Datasource methods

extension DessertHomeViewController: UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.result?.meals.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID,for: indexPath) as? DessertTableViewCell
        cell?.viewModel = viewModel?.result?.meals[indexPath.row]
        return cell ?? UITableViewCell()
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // navigate to Dessert detail view controller.
        let detailController  = DessertDetailViewController()
        detailController.id = viewModel?.result?.meals[indexPath.row].idMeal
        self.navigationController?.pushViewController(detailController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 260
    }
}
