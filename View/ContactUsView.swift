//
//  ContactUsView.swift
//  MagentoAPI
//
//  Created by Work on 2/15/19.
//  Copyright © 2019 TheMysteryPuzzles. All rights reserved.
//

import UIKit

/*
 http://157.230.218.91/magenta/blindapi/contacts/post?name=Adeel&email=a@a.com&phone=123456&comment=Hello How are you
 */

class ContactUsView: UIView {
    
    lazy var AboutUsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "About Us"
        label.font = UIFont(name: "Cochin-Bold", size: 22)
        label.adjustsFontSizeToFitWidth = true
        label.textColor = UIColor.white
        label.numberOfLines = 0
        label.textAlignment = .center
        label.backgroundColor = UIColor.clear
        return label
    }()
    
    private func setupAboutUsLabelContraints() {
        NSLayoutConstraint.activate([
            aboutUsLabel.topAnchor.constraint(equalTo: self.safeTopAnchor, constant: 20),
            aboutUsLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            aboutUsLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            aboutUsLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
    
    lazy var email: UITextField = {
        let label = UITextField()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var phoneTextField: UITextField = {
       let textField = UITextField()
       textField.translatesAutoresizingMaskIntoConstraints = false
       return textField
    }()
    
    lazy var aboutUsLabel: UILabel = {
        let label = UILabel()
        if isDeviceIPad {
            label.font = UIFont(name: "Hiragino Mincho ProN", size: 32)
        }else{
            label.font = UIFont(name: "Hiragino Mincho ProN", size: 20)
        }
        label.adjustsFontSizeToFitWidth = true
        label.textColor = UIColor.white
        label.text = "abcdefghijklmnopsdjkasbdskj"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var contactUsLabel: UILabel = {
        let label = UILabel()
        if isDeviceIPad {
            label.font = UIFont(name: "Hiragino Mincho ProN", size: 32)
        }else{
            label.font = UIFont(name: "Hiragino Mincho ProN", size: 20)
        }
        label.adjustsFontSizeToFitWidth = true
        label.textColor = UIColor.white
        label.text = "Contact Us:"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
    }()
    
    lazy var fullNameLabel: UILabel = {
        let label = UILabel()
        if isDeviceIPad {
            label.font = UIFont(name: "Hiragino Mincho ProN", size: 32)
        }else{
            label.font = UIFont(name: "Hiragino Mincho ProN", size: 20)
        }
        label.adjustsFontSizeToFitWidth = true
        label.textColor = UIColor.white
        label.text = "Name:"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private func setupFullnameConstraints(){
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(aboutUsLabel)
        setupAboutUsLabelContraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   
    
    
    
}
