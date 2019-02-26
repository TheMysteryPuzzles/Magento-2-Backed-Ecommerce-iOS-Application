//
//  ProgessIndicatorView.swift
//  MagentoAPI
//
//  Created by Work on 2/7/19.
//  Copyright © 2019 TheMysteryPuzzles. All rights reserved.
//

import UIKit

class ProgressIndidcatorView: UIView {
    
     var indicatorCenter: CGPoint?{
        didSet{
            self.indicator.center = self.indicatorCenter!
            addBlurEffectLocal()
        }
    }
    
    func startProgress(){
        DispatchQueue.main.async {
              self.indicator.startAnimating()
        }
      
    }
    
    func stopProgress(){
        DispatchQueue.main.async {
             self.indicator.stopAnimating()
        }
        
    }
    
    lazy var indicator: UIActivityIndicatorView = {
        let activityView = UIActivityIndicatorView(style: .gray)
        activityView.center = self.center
        return activityView
    }()
    
    
    @objc func addBlurEffectLocal(){
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = self.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(blurEffectView)
        self.bringSubviewToFront(indicator)
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(indicator)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
