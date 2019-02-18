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

class AboutUsView: UIView {
    
    lazy var nameTextField: UITextField = {
       let label = UITextField()
       label.translatesAutoresizingMaskIntoConstraints = false
       return label
    }()
    
    private func setupNameTextFieldConstraints(){
        NSLayoutConstraint.activate([
       //nameTextField
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
    
    
    private func setupFullnameConstraints(){
        
    }
    
    
}
