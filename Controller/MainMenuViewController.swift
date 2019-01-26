//
//  GetStartedViewController.swift
//  Magneta Sqquare
//
//  Created by Work on 1/2/19.
//  Copyright © 2019 TheMysteryPuzzles. All rights reserved.
//

import UIKit

class MainMenuViewController: UIViewController {

    
    
    
    override func viewWillAppear(_ animated: Bool) {
         self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    func handleProductsTab(){
      self.navigationController?.pushViewController(ProdutsViewController(), animated: true)
    }
    
    func handleShopOnlineTab(){
        self.navigationController?.pushViewController(ShopOnlineViewController(), animated: true)
    }
    
    
    
    lazy var mainMenuView: MainMenuView = {
       let view = MainMenuView(frame: self.view.bounds)
       view.mainViewController = self
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
