//
//  Post_Reader_AppTests.swift
//  Post_Reader_AppTests
//
//  Created by Neosoft on 21/09/23.
//

import XCTest
@testable import Post_Reader_App

final class Post_Reader_AppTests: XCTestCase {

    var apiHander: APIHandler!
    
    override func setUp() {
           super.setUp()
        apiHander = APIHandler()
       }

       override func tearDown() {
           apiHander = nil
           super.tearDown()
       }
  
    func testFetchSuccess(){
        let expectation = XCTestExpectation(description: "Fetch posts expectation")
        let mockURL = URL(string: "\(URLConstant.postUrl ?? URL(string: "Invalid Url"))")!
        
        // call function
        apiHander.fetch(url: mockURL, responseType: PostModel.self) { result in
            switch result {
            case .success(_):
                XCTAssertNotNil(result)
            case .failure( let error):
                XCTFail("Expected successful API call, but got error: \(error)")

            }
            expectation.fulfill()
        }
         wait(for: [expectation], timeout: 5.0)
    }
    
    
}
