//
//  Protocols.swift
//  stashTakeHomeChallenge
//
//  Created by Eugene Mammie on 7/12/18.
//  Copyright © 2018 Eugene Mammie. All rights reserved.
//

import Foundation
import UIKit

/// AchievementList Delegate has two functions
/// show: Displays the items on the screen
/// error: Displays an error graphic
protocol AchievementListDelegate: class {
    func show(items: [Achievement])
    func error()
}

/// AchievementListInteractorInputDelegate has one property and one function
/// var dataManager: A reference to the data manager protocol
/// retrieveAchievementList: Retrieves the Achievement list from the persistance manager
protocol AchievementListInteractorInputDelegate: class {
    var dataManager:  AchievementListRemoteDataManagerInputDelegate? { get set }
    var presenter: AchievementListInteractorOutputDelegate? { get set }
    func retrieveAchievementList()
}


/// AchievementListInteractorOutputDelegate has two functions
/// didRetrieveAchievements: When retrieveAchievementList has completed
/// onError: If there is an error while getting the list
protocol AchievementListInteractorOutputDelegate: class {
    func didRetrieveAchievements(_ Achievements: [Achievement])
    func onError()
}

/// AchievementListPresenterDelegate has two properties and one function
/// var view: A reference to the Achievement list view by the list delegate
/// var interactor: A reference to the interactor input delegate
/// viewDidLoad: Called after the list super call, kicks off the Achievement list retrieval
protocol AchievementListPresenterDelegate: class {
    var view: AchievementListDelegate? { get set }
    var interactor: AchievementListInteractorInputDelegate? { get set }
    var wireframe: AchievementListWireframeDelegate? { get set }
    func viewDidLoad()
    func title() -> String 
}

/// AchievementListWireframeDelegate has one function
/// createAchievementListViewController: Creates the initial Achievement list
//  The router creates the interactor and presenter
protocol AchievementListWireframeDelegate: class {
    static func createAchievementListController() -> UIViewController
}


protocol AchievementListRemoteDataManagerInputDelegate : class {
    
    var remoteRequestHandler : AchievementListRemoteDataManagerOutputDelegate? {get set}
    
    func retrieveAchievementLevels(completion:@escaping ([Achievement]?) -> ())
}

protocol AchievementListRemoteDataManagerOutputDelegate : class {
    func didRetrieveAchievementLevels(_ achievementLevels: [Achievement])
    func onError()
    
}
