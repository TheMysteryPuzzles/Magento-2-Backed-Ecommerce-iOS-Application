//
//  GetStartedViewController.swift
//  Magneta Sqquare
//
//  Created by Work on 1/2/19.
//  Copyright © 2019 TheMysteryPuzzles. All rights reserved.
//

import UIKit

class MainMenuViewController: UIViewController {

    
    lazy var mainMenuView: MainMenuView = {
       let view = MainMenuView(frame: self.view.bounds)
       return view
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.view.addSubview(mainMenuView)
    }
    

    override var prefersStatusBarHidden: Bool {
        return true
    }

}
