//
//  DessertDetailViewModelTests.swift
//  PetalRestoTests
//
//  Created by Rajat Nagavkar on 5/24/22.
//

import Foundation
import XCTest

@testable import PetalResto


class DessertDetailViewModelTests: XCTestCase {
    
    func testDetailFetchRecord() {
        let mockDetailFetchProtocol = MockDetailFetchRequestSuccess()
        let dessertDetailViewModel = DessertDetailViewModel(detailFetchProtocol: mockDetailFetchProtocol, result: nil)
        dessertDetailViewModel.detailFetchRecords(id: "123") { result in
            switch result {
            case .success(let detailMeals):
                XCTAssertEqual(detailMeals.idMeal,"3445")
               // XCTAssertTrue(detailMeals)
            case .failure(_ ):
                XCTFail("Failed")
            }
        }
    }
    
    class MockDetailFetchRequestSuccess: DetailFetchProtocol {
        func detailFetchRecords(id: String, completion: @escaping (Result<DetailMeal, Error>) -> ()) {
            let detailMeal =  DetailMeal(meals: [DetailMeals(idMeal: "3445", strMeal: "", strCategory: "", strArea: "", strInstructions: "", strMealThumb: "", strYoutube: "", strIngredient1: "", strIngredient2: "", strIngredient3: "", strIngredient4: "", strIngredient5: "", strIngredient6: "", strIngredient7: "", strIngredient8: "", strIngredient9: "", strIngredient10: "", strIngredient11: "", strIngredient12: "", strIngredient13: "", strIngredient14: "", strIngredient15: "", strIngredient16: "", strIngredient17: "", strIngredient18: "", strIngredient19: "", strIngredient20: "", strMeasure1: "", strMeasure2: "", strMeasure3: "", strMeasure4: "", strMeasure5: "", strMeasure6: "", strMeasure7: "", strMeasure8: "", strMeasure9: "", strMeasure10: "", strMeasure11: "", strMeasure12: "", strMeasure13: "", strMeasure14: "", strMeasure15: "", strMeasure16: "", strMeasure17: "", strMeasure18: "", strMeasure19: "", strMeasure20: "", strSource: "")])
            completion(.success(detailMeal))
        }
    }
}
