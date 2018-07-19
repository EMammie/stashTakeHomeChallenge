//
//  AchieveListInteractor.swift
//  stashTakeHomeChallenge
//
//  Created by Eugene Mammie on 7/12/18.
//  Copyright © 2018 Eugene Mammie. All rights reserved.
//

import Foundation

class AchievementListInteractor: AchievementListInteractorInputDelegate {
    
    weak var presenter: AchievementListInteractorOutputDelegate?
    var dataManager : AchievementListRemoteDataManagerInputDelegate?
    
    func retrieveAchievementList() {
    
            do {
                
                dataManager?.retrieveAchievementLevels(completion: { [weak self] achievementLevels  in
                    if (achievementLevels?.isEmpty)! {
                        self?.presenter?.didRetrieveAchievements([])
                    } else {
                        self?.presenter?.didRetrieveAchievements(achievementLevels!)
                    }
                })
            } 
        
 
        }
        
        
}
    
