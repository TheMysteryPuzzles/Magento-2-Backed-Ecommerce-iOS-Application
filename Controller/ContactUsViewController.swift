//
//  ContactUsViewController.swift
//  MagentoAPI
//
//  Created by Work on 2/15/19.
//  Copyright © 2019 TheMysteryPuzzles. All rights reserved.
//

import UIKit

class ContactUsViewController: UIViewController {

    
    lazy var contactUsView: ContactUsView = {
        let view = ContactUsView(frame: self.view.bounds)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(contactUsView)

    }
    
}
