//
//  DessertViewModelTests.swift
//  PetalRestoTests
//
//  Created by Rajat Nagavkar on 5/23/22.
//
import XCTest
@testable import PetalResto

class DessertViewModelTests: XCTestCase {
    // Assert success scenario
    func testFetchRecordSuccess(){
        let mockFetchProtocol = MockFetchRequestSuccess()
        let dessertViewModel = DessertViewModel(fetchProtocol: mockFetchProtocol, result: nil)
        dessertViewModel.fetchRecords { result in
            switch result {
            case .success(let success):
                XCTAssertTrue(success)
                XCTAssertEqual( dessertViewModel.result?.meals.count, 1)
                let desserViewModelFirstMeal = dessertViewModel.result?.meals.first
                XCTAssertEqual(desserViewModelFirstMeal?.strMeal, "123")
            case .failure(_ ):
                XCTFail("Success scenario failed.")
            }
        }
    }
    
    // Assert failure scenario
    func testFetchRecordFailure(){
        let mockFetchProtocol = MockFetchRequestFailure()
        let dessertViewModel = DessertViewModel(fetchProtocol: mockFetchProtocol, result: nil)
        dessertViewModel.fetchRecords { result in
            switch result {
            case .success(_ ):
                XCTFail("Failure scenario failed.")
            case .failure(let error):
                let error = error as? NSError
                XCTAssertEqual(error?.code, 100)
            }
        }
    }
    
    
    class MockFetchRequestSuccess: FetchProtocol {
        func fetchRecords(completion: @escaping (Result<Meal, Error>) -> ()) {
            let meal = Meal(meals: [Meals(strMeal: "123", strMealThumb: "456", idMeal: "789")])
//            let meal = Meal(meals: [])
            completion(.success(meal))
        }
    }
    
    class MockFetchRequestFailure: FetchProtocol {
        func fetchRecords(completion: @escaping (Result<Meal, Error>) -> ()) {
            let error = NSError(domain: "abc", code: 100, userInfo: nil)
            completion(.failure(error))
        }
    }

}
