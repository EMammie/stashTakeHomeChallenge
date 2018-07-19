//
//  AchievementListWireframe.swift
//  stashTakeHomeChallenge
//
//  Created by Eugene Mammie on 7/18/18.
//  Copyright © 2018 Eugene Mammie. All rights reserved.
//

import Foundation
import UIKit

class AchievementListWireframe: AchievementListWireframeDelegate {
    
    static let mainStoryboard =  UIStoryboard(name: "Main", bundle: Bundle.main)
    
    class func createAchievementListController() -> UIViewController {
        let navController = mainStoryboard.instantiateViewController(withIdentifier: "AchievementListNavController")
        guard let AchievementListView = navController.childViewControllers.first as? AchievementListViewController else {
            return UIViewController()
        }
        
        let presenter: AchievementListPresenterDelegate & AchievementListInteractorOutputDelegate = AchievementListPresenter()
        let interactor: AchievementListInteractorInputDelegate  = AchievementListInteractor()
        let localDataManager: AchievementListRemoteDataManagerInputDelegate = RemoteDataManager()
        let wireframe: AchievementListWireframeDelegate = AchievementListWireframe()
        
        AchievementListView.presenter = presenter
        presenter.view = AchievementListView
        presenter.wireframe = wireframe
        presenter.interactor = interactor
        interactor.presenter = presenter
        interactor.dataManager = RemoteDataManager()
        
        return navController
    }
    
    
}
