//
//  DessertTableViewCell.swift
//  PetalResto
//
//  Created by Rajat Nagavkar on 5/16/22.
//

import Foundation
import UIKit

class DessertTableViewCell: UITableViewCell {
    
    var viewModel: Meals? {
        didSet {
            dessertName.text = self.viewModel?.strMeal  ?? "strMeal"
            fetchImage(urlString: viewModel?.strMealThumb ?? "")
        }
    }
    
    var dessertImage: UIImageView = {
        let img =  UIImageView()
        img.contentMode = .scaleToFill
        return img
    }()
    
    var dessertName: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 18)
        return lbl
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        addSubview(dessertImage)
        dessertImage.anchor(top: topAnchor,
                            left: leftAnchor,
                            right: rightAnchor,
                            bottom: nil,
                            paddingTop: 10,
                            paddingLeft: 8,
                            paddingRight: -8,
                            paddingBottom: 3,
                            width: frame.width - 10,
                            height: 200)
       
        dessertImage.layer.cornerRadius = 10
        
        dessertImage.clipsToBounds = true
        
        
        addSubview(dessertName)
        dessertName.anchor(top: dessertImage.bottomAnchor,
                           left: leftAnchor,
                           right: nil,
                           bottom: bottomAnchor,
                           paddingTop: 5,
                           paddingLeft: 20,
                           paddingRight: 0,
                           paddingBottom: 0,
                           width: 0,
                           height: 0)
    }
    
    func fetchImage(urlString: String) {

        Network().fetchData(urlString: urlString) { [weak self] (result) in
            switch result {
            case .success(let data):
                let image = UIImage(data: data)
                DispatchQueue.main.async {
                    self?.dessertImage.image = image
                }
            case .failure(_ ):
                print("Error loading image")
            }
        }
    }
    
}
