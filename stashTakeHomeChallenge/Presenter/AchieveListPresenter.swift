//
//  AchieveListPresenter.swift
//  stashTakeHomeChallenge
//
//  Created by Eugene Mammie on 7/17/18.
//  Copyright © 2018 Eugene Mammie. All rights reserved.
//

import Foundation

class AchievementListPresenter: AchievementListPresenterDelegate {
    var view: AchievementListDelegate?
    
    var interactor: AchievementListInteractorInputDelegate?
    
    var wireframe: AchievementListWireframeDelegate?
    
    func viewDidLoad() {
        interactor?.retrieveAchievementList()
    }
    
    func title() -> String {
        return "Smart Investing"
    }
    
}

extension AchievementListPresenter : AchievementListInteractorOutputDelegate {
    func didRetrieveAchievements(_ Achievements: [Achievement]) {
        view?.show(items: Achievements)
    }
    
    func onError() {
        view?.error()
    }
    
    
}
