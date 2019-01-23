//
//  CreateAccountView.swift
//  MagentoAPI
//
//  Created by Work on 1/19/19.
//  Copyright © 2019 TheMysteryPuzzles. All rights reserved.
//

import UIKit

class CreateAccountView: UIView {
    
    var credentialsContaineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var createAccVc: MagentoApisViewController?
    
    
    private func setupCredentialsContaineViewConstraints(){
        NSLayoutConstraint.activate([
            credentialsContaineView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            credentialsContaineView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            credentialsContaineView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.6),
            credentialsContaineView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.8)
            
            ])
    }
    
    var firstNameTextField: UITextField = {
       let field = UITextField()
       field.placeholder = "First Name"
       field .translatesAutoresizingMaskIntoConstraints = false
       field.backgroundColor = UIColor.lightGray
       field.textColor = UIColor.white
       return field
    }()
    
    
    private func setupFirstNameFieldConstraints(){
        NSLayoutConstraint.activate([
            firstNameTextField.topAnchor.constraint(equalTo: self.credentialsContaineView.topAnchor, constant: 5),
            firstNameTextField.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            firstNameTextField.widthAnchor.constraint(equalTo: self.credentialsContaineView.widthAnchor, constant: -10),
            firstNameTextField.heightAnchor.constraint(equalTo: self.credentialsContaineView.heightAnchor, multiplier: 0.15)
        ])
    }
    
    var lastNameTextField: UITextField = {
        let field = UITextField()
        field.placeholder = "Last Name"
        field .translatesAutoresizingMaskIntoConstraints = false
        field.backgroundColor = UIColor.lightGray
        field.textColor = UIColor.white
        return field
    }()
    
    var productsPageButton: UIButton = {
       let button = UIButton()
       button.setTitle("Prodcust Page", for: .normal)
        button.addTarget(self, action: #selector(handleProductsPage), for: .touchUpInside)
       button.translatesAutoresizingMaskIntoConstraints = false
       button.backgroundColor = UIColor.green
        return button
    }()
    
    @objc func handleProductsPage(){
        createAccVc?.present()
    }
    private func setupProductsPageButton(){
        NSLayoutConstraint.activate([
            productsPageButton.topAnchor.constraint(equalTo: self.credentialsContaineView.bottomAnchor),
            productsPageButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            productsPageButton.heightAnchor.constraint(equalToConstant: 50),
            productsPageButton.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5)
        ])
    }
    
    private func setupLastNameTextFieldConstraints(){
        NSLayoutConstraint.activate([
            lastNameTextField.topAnchor.constraint(equalTo: self.firstNameTextField.bottomAnchor, constant: 5),
            lastNameTextField.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            lastNameTextField.widthAnchor.constraint(equalTo: self.credentialsContaineView.widthAnchor, constant: -10),
            lastNameTextField.heightAnchor.constraint(equalTo: self.credentialsContaineView.heightAnchor, multiplier: 0.15)
            ])
    }
    
    
    var emailTextField: UITextField = {
        let field = UITextField()
        field.placeholder = "Email"
        field .translatesAutoresizingMaskIntoConstraints = false
        field.backgroundColor = UIColor.lightGray
        field.textColor = UIColor.white
        return field
    }()
    
    
    private func setupEmailTextFieldConstraints(){
        NSLayoutConstraint.activate([
            emailTextField.topAnchor.constraint(equalTo: self.lastNameTextField.bottomAnchor, constant: 5),
            emailTextField.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            emailTextField.widthAnchor.constraint(equalTo: self.credentialsContaineView.widthAnchor, constant: -10),
            emailTextField.heightAnchor.constraint(equalTo: self.credentialsContaineView.heightAnchor, multiplier: 0.15)
            ])
    }
    
    
    var passwordTextField: UITextField = {
        let field = UITextField()
        field.placeholder = "Password"
        field.isSecureTextEntry = true
        field .translatesAutoresizingMaskIntoConstraints = false
        field.backgroundColor = UIColor.lightGray
        field.textColor = UIColor.white
        return field
    }()
    
    
    private func setupPasswordTextFieldConstraints(){
        NSLayoutConstraint.activate([
            passwordTextField.topAnchor.constraint(equalTo: self.emailTextField.bottomAnchor, constant: 5),
            passwordTextField.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            passwordTextField.widthAnchor.constraint(equalTo: self.credentialsContaineView.widthAnchor, constant: -10),
            passwordTextField.heightAnchor.constraint(equalTo: self.credentialsContaineView.heightAnchor, multiplier: 0.15)
            ])
    }
    
    var createAccountButton: UIButton = {
        let button = UIButton()
        button.setTitle("Register", for: .normal)
        button.backgroundColor = UIColor.purple
        button.addTarget(self, action: #selector(resgiterCustomer), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private func setupCreateAccountButtonConstraints(){
        NSLayoutConstraint.activate([
            createAccountButton.topAnchor.constraint(equalTo: self.passwordTextField.bottomAnchor, constant: 5),
            createAccountButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            createAccountButton.widthAnchor.constraint(equalTo: self.credentialsContaineView.widthAnchor, multiplier: 0.5),
            createAccountButton.heightAnchor.constraint(equalTo: self.credentialsContaineView.heightAnchor, multiplier: 0.15)
            ])
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(credentialsContaineView)
        setupCredentialsContaineViewConstraints()
        
        self.credentialsContaineView.addSubview(firstNameTextField)
        setupFirstNameFieldConstraints()
        
        self.credentialsContaineView.addSubview(lastNameTextField)
        setupLastNameTextFieldConstraints()
        
        self.credentialsContaineView.addSubview(emailTextField)
        setupEmailTextFieldConstraints()
        
        self.credentialsContaineView.addSubview(passwordTextField)
        setupPasswordTextFieldConstraints()
        
        self.credentialsContaineView.addSubview(createAccountButton)
        setupCreateAccountButtonConstraints()
        
        self.addSubview(productsPageButton)
        setupProductsPageButton()
        
    }
    
    @objc private func resgiterCustomer(){
        createAccVc?.firstName = self.firstNameTextField.text
        createAccVc?.lastName = self.lastNameTextField.text
        createAccVc?.email = self.emailTextField.text
        createAccVc?.password = self.passwordTextField.text
        createAccVc?.registerNewCustomer()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
