//
//  RemoteDataManagerTests.swift
//  stashTakeHomeChallenge
//
//  Created by Eugene Mammie on 7/12/18.
//  Copyright © 2018 Eugene Mammie. All rights reserved.
//

import XCTest

@testable import stashTakeHomeChallenge

class RemoteDataManagerTests: XCTestCase {
    
    var sut: RemoteDataManager!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = RemoteDataManager()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_AchievementLevelsRequest() {
       
        let mockURLSession = MockURLSession()
        
        sut.session = mockURLSession
    
       let result = try! sut.retrieveAchievementLevels()
        XCTAssertNotNil(result)
    }
    
    func test_AchievementLevelsRequestWithCompletionHandler() {
        
        let mockURLSession = MockURLSession()
        let expectation = XCTestExpectation(description: "levels Expectation")
        sut.session = mockURLSession
        
        sut.retrieveAchievementLevels(completion: { achievementLevels in
            XCTAssertNotNil(achievementLevels)
            expectation.fulfill()
        })
        waitForExpectations(timeout: 3.0, handler: nil)
    }
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}


extension RemoteDataManagerTests {
    
    class MockURLSession: AchievementListURLSessionProtocol {
        
    typealias Handler = (Data?, URLResponse?, Error?) -> Void
        
        var completionHandler: Handler?
        var url: URL?
        var dataTaskCalled = false
        
        func dataTask(with: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask{
            
            url = with
            dataTaskCalled = true
            return URLSession.shared.dataTask(with: url!)
        }
    }
}
