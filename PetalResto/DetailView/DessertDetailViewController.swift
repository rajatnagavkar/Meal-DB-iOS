//
//  DetailController.swift
//  PetalResto
//
//  Created by Rajat Nagavkar on 5/16/22.
//

import UIKit


class DessertDetailViewController: UIViewController {
    
    // MARK: - Properties
    var id: String?
    var viewModel: DessertDetailViewModel?
    
    let foodView: DessertDetailView = {
        let vw  = DessertDetailView()
        vw.translatesAutoresizingMaskIntoConstraints = false
        return vw
    }()
    
    
    
    //Mark:- Life cycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        setUpViews()
        fetchData()
    }
    
    func configure(){
        view.backgroundColor = .white
        navigationItem.title = "Details"
    }
    
    func setUpViews(){
        view.addSubview(foodView)
        foodView.anchor(top: view.safeAreaLayoutGuide.topAnchor,
                        left: view.leftAnchor,
                        right: view.rightAnchor,
                        bottom: view.bottomAnchor,
                        paddingTop: 10,
                        paddingLeft: 0,
                        paddingRight: 0,
                        paddingBottom: 0,
                        width: view.frame.width,
                        height: 0)
    }
    
    
    func fetchData() {
        viewModel = DessertDetailViewModel(result: nil)
        guard let id = id else { return }
        viewModel?.detailFetchRecords(id: id,completion: { [weak self] result in
            switch result {
            case .success(let meal):
                DispatchQueue.main.async {
                    self?.foodView.viewModel = meal
                }
            case .failure(_ ):
                print("Failed")
            }
        })
    }
}
