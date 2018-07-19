//
//  LevelCircleView.swift
//  stashTakeHomeChallenge
//
//  Created by Eugene Mammie on 7/18/18.
//  Copyright © 2018 Eugene Mammie. All rights reserved.
//

import UIKit

class LevelCircleView: UIView {
    var levelNumber = "0"

    override func draw(_ rect: CGRect) {
        let maskLayer = CAShapeLayer()
        
        
        let maskPath = CGPath.init(ellipseIn: bounds, transform: nil)
            
        
        maskLayer.bounds = bounds
        maskLayer.path = maskPath
        
        maskLayer.fillColor = UIColor.white.cgColor
        maskLayer.position = CGPoint(x:bounds.size.width/2, y: bounds.size.height/2)
        
        layer.mask = maskLayer

        
        backgroundColor = UIColor.clear
        let path = UIBezierPath(ovalIn: rect)
        UIColor.white.setFill()
        path.fill()
        
        let font = UIFont.init(name: "Arial", size: 24)
        let textColor = UIColor.black
        let stringAttrs = [ NSAttributedStringKey.foregroundColor: textColor ,NSAttributedStringKey.font: font ]
        
        let levelString = NSAttributedString(string: "Level", attributes: stringAttrs)
        let attrString = NSAttributedString(string: levelNumber, attributes: stringAttrs)
        
        //ON A PRODUCTION APP NO Hardcoding Values 
        levelString.draw(at: CGPoint(x: bounds.width/2 - 25, y: bounds.height/2 - 30))
        attrString.draw(at: CGPoint(x: bounds.width/2, y: bounds.height/2))
        
    }

}
