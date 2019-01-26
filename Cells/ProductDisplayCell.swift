//
//  ProductDisplayCell.swift
//  Magneta Sqquare
//
//  Created by Work on 1/15/19.
//  Copyright © 2019 TheMysteryPuzzles. All rights reserved.
//

import UIKit

class ProductDisplayCell: D3ListViewCell {
    
    lazy var categoryNameLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor.clear
        label.textColor = #colorLiteral(red: 0.5432077646, green: 0.9856193662, blue: 0.9878382087, alpha: 1)
        label.textAlignment = .center
        label.font = UIFont(name: "Kefa", size: 30)
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    lazy var breakLine: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private func setupCategoryNameLabel(){
        NSLayoutConstraint.activate([
            categoryNameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            categoryNameLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            categoryNameLabel.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -20),
            categoryNameLabel.heightAnchor.constraint(equalToConstant: 50)
            ])
    }
    
    private func setupBreakLineConstraints(){
        NSLayoutConstraint.activate([
            breakLine.topAnchor.constraint(equalTo: categoryNameLabel.bottomAnchor, constant: 2),
            breakLine.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            breakLine.heightAnchor.constraint(equalToConstant: 2),
            breakLine.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -80)
            ])
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(categoryNameLabel)
        setupCategoryNameLabel()
        addSubview(breakLine)
        setupBreakLineConstraints()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func layoutSubviews() {
        self.layer.cornerRadius = 12
        super.layoutSubviews()
    }
}

