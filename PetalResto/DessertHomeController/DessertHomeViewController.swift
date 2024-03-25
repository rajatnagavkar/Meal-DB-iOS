//
//  ViewController.swift
//  PetalResto
//
//  Created by Rajat Nagavkar on 5/14/22.
//

import UIKit

class DessertHomeViewController: UIViewController, UINavigationControllerDelegate {
    
    
    //Mark:- Properties
    let cellID = "dessertCell"
    var viewModel: DessertViewModel?
    
    var desertTableView: UITableView = {
        let tblView = UITableView()
        tblView.translatesAutoresizingMaskIntoConstraints = false
        return tblView
    }()
    
    //MARK:- Life Cycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        setUpViews()
        fetchData()
    }
    
    func configure() {
        view.backgroundColor = .white
        navigationItem.title = "Petal"
        navigationController?.navigationBar.prefersLargeTitles = true
        desertTableView.delegate = self
        desertTableView.dataSource = self
        
        
        desertTableView.register(DessertTableViewCell.self, forCellReuseIdentifier: cellID)
    }
    
    func setUpViews(){
        // add tabview to the view
        view.addSubview(desertTableView)
        
        // add constraints
        desertTableView
            .anchor(top: view.topAnchor,
                    left: view.leftAnchor,
                    right: view.rightAnchor,
                    bottom: view.bottomAnchor,
                    paddingTop: 80,
                    paddingLeft: 0,
                    paddingRight: 0,
                    paddingBottom: 0,
                    width: view.frame.width,
                    height: view.frame.width
            )
    }
    
    // Fetch data for DessertHomeViewController
    func fetchData() {
        viewModel = DessertViewModel(result: nil)
        viewModel?.fetchRecords(completion: { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(_ ):
                DispatchQueue.main.async {
                    self.desertTableView.reloadData()
                }
            case .failure(_ ):
                // handle service failure errors here.
                print("Failed")
            }
        })
    }
    
}



