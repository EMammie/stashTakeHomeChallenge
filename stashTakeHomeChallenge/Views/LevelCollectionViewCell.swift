//
//  LevelCollectionViewCell.swift
//  stashTakeHomeChallenge
//
//  Created by Eugene Mammie on 7/12/18.
//  Copyright © 2018 Eugene Mammie. All rights reserved.
//

import UIKit
import Kingfisher

class LevelCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var backgroundImgView: UIImageView!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var circleView: LevelCircleView!
    
    
    func configure(level: Achievement){
        layer.cornerRadius = 2.0
        backgroundImgView.kf.setImage(with: level.imgURL)
        let progressValue = (level.progress / level.total)
        progressBar.setProgress(progressValue, animated: true)
        circleView.levelNumber = String(level.level)
        
    }
}
