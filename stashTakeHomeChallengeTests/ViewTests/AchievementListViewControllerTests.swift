//
//  AchievementListViewControllerTests.swift
//  stashTakeHomeChallengeTests
//
//  Created by Eugene Mammie on 7/17/18.
//  Copyright © 2018 Eugene Mammie. All rights reserved.
//

import XCTest
@testable import stashTakeHomeChallenge

class AchievementListViewControllerTests: XCTestCase {
    
    var sut: AchievementListViewController!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = AchievementListViewController()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_CollectionViewNotNilAfterViewDidLoad() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(withIdentifier: "AchievementList") as! AchievementListViewController
        
        _ = sut.view
      XCTAssertNotNil(sut.LevelsCollectionView.dataSource)
        XCTAssertTrue(sut.LevelsCollectionView.dataSource is AchievementListDelegate)
    }
    
    func test_VC_conformsAchievementList_Protocol() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(withIdentifier: "AchievementList") as! AchievementListViewController
        
        let aMockPresenter = MockPresenter()
        sut.presenter = aMockPresenter
        _ = sut.view
       
       XCTAssertTrue(aMockPresenter.viewDidLoadWasCalled)
    }
}

extension AchievementListViewControllerTests {
    
    class MockPresenter : AchievementListPresenterDelegate {
        func title() -> String {
            return  "mock Presenter"
        }
        
        var view: AchievementListDelegate?
        
        var interactor: AchievementListInteractorInputDelegate?
        
        var wireframe: AchievementListWireframeDelegate?
        
        var viewDidLoadWasCalled = false
        
        func viewDidLoad() {
            viewDidLoadWasCalled = true
        }
    }
    
    
}
