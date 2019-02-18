//
//  CustomAttributesDetailsHelpView.swift
//  MagentoAPI
//
//  Created by Work on 2/8/19.
//  Copyright © 2019 TheMysteryPuzzles. All rights reserved.
//

import UIKit

class CustomAttributesDetailsHelpView: UIView {
    
    lazy var customAttributeName: UILabel = {
       let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
       label.text = "Fitting Details ?"
        label.adjustsFontSizeToFitWidth = true
       label.textColor = UIColor.white
       label.numberOfLines = 0
       label.translatesAutoresizingMaskIntoConstraints = false
       return label
    }()
    
    private func setupCustomAttributeNameConstraints(){
        NSLayoutConstraint.activate([
            customAttributeName.topAnchor.constraint(equalTo: self.topAnchor),
            customAttributeName.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            customAttributeName.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
            customAttributeName.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.2)
            ])
      }
    
    lazy var customAttributeDetail: UILabel = {
       let label = UILabel()
        label.textColor = UIColor.white
        label.text = "Outside mounted blinds or shades are installed outside the window frame or flat molding frame, with brackets mounted to the wall or flat molding frame. Add 2-4” for light gap coverage."
       label.numberOfLines = 0
       label.translatesAutoresizingMaskIntoConstraints = false
       return label
    }()
    
    private func setupCustomAttributeDetailConstraints(){
        NSLayoutConstraint.activate([
            customAttributeDetail.topAnchor.constraint(equalTo: self.customAttributeName.bottomAnchor, constant: 5),
            customAttributeDetail.leadingAnchor.constraint(equalTo: self.customAttributeName.leadingAnchor, constant: 5),
            customAttributeDetail.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
            customAttributeDetail.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -30)
            ])
        
    }
    lazy var doneButton: UIButton = {
        var button = UIButton()
        button.setTitle("OK", for: .normal)
       button.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
       button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    func setupDoneButtonConstraints(){
        NSLayoutConstraint.activate([
            doneButton.topAnchor.constraint(equalTo: self.customAttributeDetail.bottomAnchor),
            doneButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            doneButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5),
            doneButton.widthAnchor.constraint(equalToConstant: 100)
            ])
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    
        self.addSubview(customAttributeName)
        setupCustomAttributeNameConstraints()
        
        self.addSubview(customAttributeDetail)
        setupCustomAttributeDetailConstraints()
        
        self.addSubview(doneButton)
        setupDoneButtonConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
