//
//  DessertDetailView.swift
//  PetalResto
//
//  Created by Rajat Nagavkar on 5/16/22.
//

import Foundation
import UIKit

class DessertDetailView: UIView{
    
    var ingredientsArray: [String: String] = [:]
    let strIngredient = "strIngredient"
    let strMeasure = "strMeasure"
    
    var viewModel: DetailMeals? {
        didSet {
            self.dessertName.text = viewModel?.strMeal ?? ""
            self.instructionDetail.text = viewModel?.strInstructions ?? ""
            fetchDessertImage(urlString: viewModel?.strMealThumb ?? "")
            manageIngredientsAndQuantities()
        }
    }
    
    
    var scrollView: UIScrollView = {
        let sv = UIScrollView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    var mainView: UIView = {
        let vw = UIView()
        vw.translatesAutoresizingMaskIntoConstraints = false
        return vw
    }()

    var dessertName: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 22)
        return lbl
    }()
    
    var dessertImage: UIImageView = {
        let img =  UIImageView()
        img.image = #imageLiteral(resourceName: "cake")
        return img
    }()
    
    var lineView: UIView = {
        let vw = UIView()
        vw.backgroundColor = .black
        return vw
    }()
    
    var descriptionView: UIView = {
        let vw = UIView()
        vw.backgroundColor = .white
        return vw
    }()
    
    var instructionLabel: UILabel = {
       let lbl = UILabel()
       lbl.text = "Instruction"
       lbl.textColor = .black
       lbl.font = UIFont.boldSystemFont(ofSize: 16)
       return lbl
    }()
    
    var instructionDetail: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = .systemFont(ofSize: 16)
        lbl.numberOfLines = 0
        return lbl
    }()
    

    var ingrediantsTable: UITableView = {
        let tblView = UITableView()
        tblView.backgroundColor = .white
        tblView.translatesAutoresizingMaskIntoConstraints = false
        return tblView
    }()
    
    let cellID = "ingrediantsCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        ingrediantsTable.delegate = self
        ingrediantsTable.dataSource = self
        ingrediantsTable.register(IngrediantsCell.self, forCellReuseIdentifier: cellID)
        
        setUpViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        scrollView.delegate = self
        scrollView.contentSize = CGSize(width: frame.size.width, height: 1000)
    }
    
    func setUpViews() {
        
        addSubview(scrollView)
        NSLayoutConstraint.activate([
            scrollView.leftAnchor.constraint(equalTo: leftAnchor),
            scrollView.rightAnchor.constraint(equalTo: rightAnchor),
            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        scrollView.showsVerticalScrollIndicator = true
        scrollView.isScrollEnabled =  true

        scrollView.addSubview(mainView)
        
        mainView.anchor(top: scrollView.topAnchor,
                        left: leftAnchor,
                        right: rightAnchor,
                        bottom: scrollView.bottomAnchor,
                        paddingTop: 0,
                        paddingLeft: 0,
                        paddingRight: 0,
                        paddingBottom: 0,
                        width: frame.width,
                        height:260)


        mainView.addSubview(dessertName)
        dessertName.anchor(top: mainView.topAnchor,
                           left: mainView.leftAnchor,
                           right: mainView.rightAnchor,
                           bottom: nil,
                           paddingTop: 20,
                           paddingLeft: 20,
                           paddingRight: 0,
                           paddingBottom: 0,
                           width: 0,
                           height: 50)

        mainView.addSubview(dessertImage)
        dessertImage.anchor(top: dessertName.bottomAnchor,
                            left: mainView.leftAnchor,
                            right: mainView.rightAnchor,
                            bottom: nil,
                            paddingTop: 15,
                            paddingLeft: 8,
                            paddingRight: -8,
                            paddingBottom: 3,
                            width: 0,
                            height: 200)

        dessertImage.layer.cornerRadius = 10

        dessertImage.clipsToBounds = true

        mainView.addSubview(lineView)
        lineView.anchor(top: dessertImage.bottomAnchor,
                        left: mainView.leftAnchor,
                        right: mainView.rightAnchor,
                        bottom: nil,
                        paddingTop: 10,
                        paddingLeft: 5,
                        paddingRight: -5,
                        paddingBottom: 0,
                        width: 0.5,
                        height: 0.5)


        mainView.addSubview(descriptionView)
        descriptionView.anchor(top: lineView.bottomAnchor,
                               left: mainView.leftAnchor,
                               right: mainView.rightAnchor,
                               bottom: nil,
                               paddingTop: 5,
                               paddingLeft: 5,
                               paddingRight: -5,
                               paddingBottom: 0,
                               width: mainView.frame.width - 10,
                               height: 400)

        descriptionView.layer.cornerRadius = 10

        descriptionView.clipsToBounds = true

        descriptionView.layer.borderColor = UIColor.gray.cgColor
        descriptionView.layer.borderWidth = 0.5

        descriptionView.addSubview(instructionLabel)
        instructionLabel.anchor(top: descriptionView.topAnchor,
                                left: descriptionView.leftAnchor,
                                right: nil,
                                bottom: nil,
                                paddingTop: 15,
                                paddingLeft: 10,
                                paddingRight: 0,
                                paddingBottom: 0,
                                width: 0,
                                height: 0)

        descriptionView.addSubview(instructionDetail)
        instructionDetail.anchor(top: instructionLabel.bottomAnchor,
                                 left: descriptionView.leftAnchor,
                                 right: descriptionView.rightAnchor,
                                 bottom: descriptionView.bottomAnchor,
                                 paddingTop: 2,
                                 paddingLeft: 15,
                                 paddingRight: 0,
                                 paddingBottom: -10,
                                 width: 0,
                                 height: 0)
        
        
        mainView.addSubview(ingrediantsTable)
        ingrediantsTable.anchor(top: descriptionView.bottomAnchor,
                                 left: mainView.leftAnchor,
                                 right: mainView.rightAnchor,
                                 bottom: nil,
                                 paddingTop: 2,
                                 paddingLeft: 8,
                                 paddingRight: -8,
                                 paddingBottom: 8,
                                 width: 0,
                                 height: 500)
        ingrediantsTable.tableFooterView = UIView()
        ingrediantsTable.layer.borderColor = UIColor.gray.cgColor
        ingrediantsTable.layer.borderWidth = 0.5
        ingrediantsTable.clipsToBounds = true
        ingrediantsTable.layer.cornerRadius = 10
    }
    
  
    func fetchDessertImage(urlString: String) {
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
   
    func manageIngredientsAndQuantities() {
        var ingredient: [String: String] = [:]
        var quantity: [String: String] = [:]
        var actualDictionary: [String: String] = [:]
        
        if let dictionary = try? viewModel?.allProperties() {
            
            for element in dictionary {
                // get ingredient non-empty values
                if element.key.contains(strIngredient) {
                    if let value = element.value as? String, !value.isEmpty {
                        ingredient[element.key] = value
                    }
                }
                
                // get quantity non-empty values
                if element.key.contains(strMeasure) {
                    if let value = element.value as? String, !value.isEmpty, value != " " {
                        quantity[element.key] = value
                    }
                }
            }
            
            // map ingredients with quantity
            for element in ingredient {
                let getLastLetter = element.key.last
                if let lastLetter = getLastLetter {
                    let string = "\(String(describing: lastLetter))"
                    let strMeasure: String = strMeasure + string
                    actualDictionary[element.value] = quantity[strMeasure]
                }
            }
            
            // populate ingredientsArray
            ingredientsArray = actualDictionary
            
            
            DispatchQueue.main.async {
                // reload tableView.
                self.ingrediantsTable.reloadData()
            }
        }
    }
}
