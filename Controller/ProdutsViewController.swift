//
//  ProdutsViewController.swift
//  Magneta Sqquare
//
//  Created by Work on 1/26/19.
//  Copyright © 2019 TheMysteryPuzzles. All rights reserved.
//

import UIKit

class ProdutsViewController: UIViewController {

    
    lazy var productsView: ProductView = {
    let view = ProductView(frame: self.view.bounds)
    return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(productsView)
    }
    



}
