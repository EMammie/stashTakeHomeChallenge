//
//  AchievementListViewController.swift
//  stashTakeHomeChallenge
//
//  Created by Eugene Mammie on 7/12/18.
//  Copyright © 2018 Eugene Mammie. All rights reserved.
//

import UIKit

class AchievementListViewController: UIViewController {
    @IBOutlet weak var LevelsCollectionView: UICollectionView!
    var presenter: AchievementListPresenterDelegate?
    var achievementLevels = [Achievement]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        title = presenter?.title()
        LevelsCollectionView.delegate = self
        LevelsCollectionView.dataSource = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension AchievementListViewController : UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return achievementLevels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = LevelsCollectionView.dequeueReusableCell(withReuseIdentifier: "AchievementLevelCell", for: indexPath) as! LevelCollectionViewCell
        
        let level = achievementLevels[indexPath.row]
        cell.configure(level: level)
        return cell
    }
}

extension AchievementListViewController : AchievementListDelegate {
    func show(items: [Achievement]){
        achievementLevels = items
        DispatchQueue.main.async { [unowned self] in
            self.LevelsCollectionView.reloadData()
        }
    }
    func error(){
        
        
    }
}
