//
//  ViewController.swift
//  Magneta Sqquare
//
//  Created by Work on 1/1/19.
//  Copyright © 2019 TheMysteryPuzzles. All rights reserved.
//

import UIKit

class ProductsViewController: UIViewController {
    
    var flag = false
    var items = [String: [Product]]()
    var categories = ["Window Coverings", "Folding Doors", "Wireless Security Systems"]
    var windowCoverings =  [ "Aluminium 1' Blinds",
                             "Aluminium 2' Blinds",
                             "Dark Roller Blinds",
                             "Exterior Rollerup Blinds",
                             "Fabric",
                             "Honeycomb Blinds",
                             "Insect Screen",
                             "Motorization",
                             "Motorized Curtains",
                             "Panel blinds",
                             "Pleated Blinds",
                             "Printed Roller Blinds",
                             "Roman Blinds",
                             "Screen Roller blinds",
                             "Shangrilla Blinds",
                             "Silhoutte Blinds",
                             "Specialized Blinds",
                             "Textured Roller Blinds",
                             "Wood Vertical Blinds",
                             "Wood Horizontal blinds",
                             "Zebra Blinds"]
    
    
    var images = [UIImage(named: "P1"),UIImage(named: "P2"),UIImage(named: "P3"),UIImage(named: "P4"),UIImage(named: "P5"),UIImage(named: "P6"),UIImage(named: "P7")]
    
    var images1 = [UIImage(named: "P13"),UIImage(named: "P6"),UIImage(named: "P8"),UIImage(named: "P8"),UIImage(named: "P5"),UIImage(named: "P5"),UIImage(named: "P16")]
    
    var images2 = [UIImage(named: "P15"),UIImage(named: "P14"),UIImage(named: "P13"),UIImage(named: "P14"),UIImage(named: "P15"),UIImage(named: "P16"),UIImage(named: "P17")]
    
    var images3 = [UIImage(named: "P20"),UIImage(named: "P12"),UIImage(named: "P13"),UIImage(named: "P14"),UIImage(named: "P15"),UIImage(named: "P16"),UIImage(named: "P17")]
    
    var subCategories = [String:[String]]()

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
       productsView.setupCategoryLabelFonts()
    }

    lazy var productsView: ProductsView = {
        let productsView = ProductsView(frame: self.view.bounds)
        productsView.productsList.delegate = self
        productsView.productsList.dataSource = self
        return productsView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(productsView)
    }
}




