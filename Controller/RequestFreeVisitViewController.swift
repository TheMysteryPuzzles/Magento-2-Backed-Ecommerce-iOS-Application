//
//  RequestFreeVisitViewController.swift
//  MagentoAPI
//
//  Created by Work on 2/10/19.
//  Copyright © 2019 TheMysteryPuzzles. All rights reserved.
//

import UIKit

class RequestFreeVisitViewController: UIViewController {

    
    lazy var requestFreeSalesVisitView: RequestFreeSalesVisitView = {
        let view = RequestFreeSalesVisitView(frame: self.view.bounds)
        return view
    }()
    
    override func viewDidAppear(_ animated: Bool) {
           requestFreeSalesVisitView.chooseProductIntrestedInDropDown.bottomOffset = CGPoint(x: 0, y: requestFreeSalesVisitView.chooseProductIntrestedIn.bounds.height)
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        self.view.addSubview(requestFreeSalesVisitView)
    }
    

 
}
