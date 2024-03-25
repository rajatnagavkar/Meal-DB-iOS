//
//  IngrediantsCell.swift
//  PetalResto
//
//  Created by Rajat Nagavkar on 5/16/22.
//

import UIKit

struct CellData {
    let name: String
    let quantity: String
}

class IngrediantsCell: UITableViewCell {
    
    var viewModel: CellData? {
        didSet {
            ingrediantName.text =  viewModel?.name ?? ""
            ingrediantQuantity.text = viewModel?.quantity
        }
    }
    
    var ingrediantName: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.systemFont(ofSize: 14)
        return lbl
    }()
    
    var ingrediantQuantity: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.systemFont(ofSize: 14)
        return lbl
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(ingrediantName)
        ingrediantName.anchor(top: topAnchor, left: leftAnchor, right: nil, bottom: nil, paddingTop: 5, paddingLeft: 15, paddingRight: 0, paddingBottom: 0, width: 0, height: 0)
        
        addSubview(ingrediantQuantity)
        ingrediantQuantity.anchor(top: topAnchor, left: ingrediantName.rightAnchor, right: nil, bottom: nil, paddingTop: 5, paddingLeft: 15, paddingRight: 0, paddingBottom: 0, width: 0, height: 0)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
