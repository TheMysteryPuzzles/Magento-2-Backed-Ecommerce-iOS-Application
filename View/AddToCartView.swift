//
//  AddToCartView.swift
//  Magneta Sqquare
//
//  Created by Work on 1/2/19.
//  Copyright © 2019 TheMysteryPuzzles. All rights reserved.
//

import UIKit

class AddToCartView: UIView {
    
    var addToCartViewController: AddToCartViewController?
    
    var emptyCartLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = #colorLiteral(red: 0.8917110295, green: 1, blue: 0.9274043922, alpha: 1)
        label.font = UIFont.boldSystemFont(ofSize: 28)
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = " You have no items in your shopping cart. "
        return label
    }()

    
    private func setupEmptyCartLabelConstraints(){
        NSLayoutConstraint.activate([
            emptyCartLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            emptyCartLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            emptyCartLabel.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.1),
            emptyCartLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.95)
            ])
    }
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        self.addSubview(emptyCartLabel)
        setupEmptyCartLabelConstraints()
   
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
