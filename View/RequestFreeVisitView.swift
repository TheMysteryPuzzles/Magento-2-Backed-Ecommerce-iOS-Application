//
//  RequestFreeVisitView.swift
//  MagentoAPI
//
//  Created by Work on 2/10/19.
//  Copyright © 2019 TheMysteryPuzzles. All rights reserved.
//

import UIKit

class RequestFreeSalesVisitView: UIView{
    
     var list = ["Panel Blinds", "Roller Blinds", "Royal Blinds"]
    
    lazy var scheduleVisitView: UIView = {
       let view = UIView()
       view.backgroundColor = UIColor.clear
       view.translatesAutoresizingMaskIntoConstraints = false
       return view
    }()
    
    private func setupScheduleVisitViewConstraints(){
        NSLayoutConstraint.activate([
            scheduleVisitView.topAnchor.constraint(equalTo: self.safeTopAnchor, constant: 30),
            scheduleVisitView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            scheduleVisitView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
            scheduleVisitView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.15)
        ])
    }
    
    lazy var scheduleVisitLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Schedule FREE Sales Visit With Samples"
        label.font = UIFont(name: "Cochin-Bold", size: 22)
        label.adjustsFontSizeToFitWidth = true
        label.textColor = UIColor.white
        label.numberOfLines = 0
        label.textAlignment = .center
        label.backgroundColor = UIColor.clear
        return label
    }()
    
    private func setupScheduleVisitLabelConstraints(){
        NSLayoutConstraint.activate([
            scheduleVisitLabel.topAnchor.constraint(equalTo: self.scheduleVisitView.topAnchor, constant: 5),
            scheduleVisitLabel.leadingAnchor.constraint(equalTo: self.scheduleVisitView.leadingAnchor, constant: 0),
            scheduleVisitLabel.widthAnchor.constraint(equalTo: self.scheduleVisitView.widthAnchor, multiplier: 0.6),
            scheduleVisitLabel.bottomAnchor.constraint(equalTo: self.scheduleVisitView.bottomAnchor, constant: 0)
            ])
    }
    
    lazy var scheduleVisitImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "ic-DeliveryTruck")
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = UIColor.clear
        return imageView
    }()
    
    private func setupscheduleVisitImageViewConstraints(){
        NSLayoutConstraint.activate([
            scheduleVisitImageView.topAnchor.constraint(equalTo: self.scheduleVisitView.topAnchor, constant: 5),
            scheduleVisitImageView.leadingAnchor.constraint(equalTo: self.scheduleVisitLabel.trailingAnchor, constant: 5),
            scheduleVisitImageView.trailingAnchor.constraint(equalTo: self.scheduleVisitView.trailingAnchor, constant: -5),
            scheduleVisitImageView.bottomAnchor.constraint(equalTo: self.scheduleVisitView.bottomAnchor, constant: -5)
         ])
    }
    
    
     var textBox: UITextField!
     let chooseProductIntrestedInDropDown = DropDown()
    
     var chooseProductIntrestedIn: UIButton = {
       let button = UIButton()
        if isDeviceIPad {
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 28)
        }else{
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        }
       button.setTitle("Select Product Intrested In 🔽", for: .normal)
       button.setTitleColor(UIColor.white, for: .normal)
       button.layer.borderWidth = 2
       button.layer.cornerRadius = 20
       button.layer.borderColor = UIColor.white.cgColor
       button.translatesAutoresizingMaskIntoConstraints = false
       button.backgroundColor = UIColor.clear
       button.addTarget(self, action: #selector(handleProductIntrestedInSelection), for: .touchUpInside)
        return button
    }()
    
    private func setupchooseProductsIntrestedInConstarints(){
        NSLayoutConstraint.activate([
            chooseProductIntrestedIn.topAnchor.constraint(equalTo: self.formContainerView.topAnchor, constant: 5),
            chooseProductIntrestedIn.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 5),
            chooseProductIntrestedIn.rightAnchor.constraint(equalTo: formContainerView.rightAnchor, constant: -5),
            chooseProductIntrestedIn.heightAnchor.constraint(equalTo: self.formContainerView.heightAnchor, multiplier: 0.08)
            ])
    }
    
    
    @objc private func handleProductIntrestedInSelection(){
        chooseProductIntrestedInDropDown.show()
    }
    
    lazy var formContainerView: UIView = {
      let view = UIView()
      view.translatesAutoresizingMaskIntoConstraints = false
      view.backgroundColor = UIColor.clear
      return view
    }()
    
    private func setupFormContainerViewConstraints(){
        NSLayoutConstraint.activate([
            formContainerView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 5),
            formContainerView.topAnchor.constraint(equalTo: self.scheduleVisitView.bottomAnchor, constant: 5),
            formContainerView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -5),
            formContainerView.bottomAnchor.constraint(equalTo: self.safeBottomAnchor, constant: -10)
         ])
    }
    
  
    
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
    
    private func setupFullNameLabelConstraints(){
        NSLayoutConstraint.activate([
            fullNameLabel.topAnchor.constraint(equalTo: self.chooseProductIntrestedIn.bottomAnchor, constant: 10),
            fullNameLabel.leftAnchor.constraint(equalTo: formContainerView.leftAnchor, constant: 5),
            fullNameLabel.widthAnchor.constraint(equalTo: formContainerView.widthAnchor, multiplier: 0.2),
            fullNameLabel.heightAnchor.constraint(equalTo: self.formContainerView.heightAnchor, multiplier: 0.08)
            ])
    }
    
    lazy var fullNameTextField: PaddingTextField = {
        let field = PaddingTextField()
        if isDeviceIPad {
       field.attributedPlaceholder = NSAttributedString(string: "Enter your name",
                                                        attributes: [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 28)])
        field.font = UIFont.boldSystemFont(ofSize: 28)
        }else{
            field.attributedPlaceholder = NSAttributedString(string: "Enter your name",
                                                             attributes: [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)])
            field.font = UIFont.boldSystemFont(ofSize: 18)
        }
        
        field.textColor = UIColor.white
        field.textColor = .white
        field.layer.borderWidth = 2
        field.layer.cornerRadius = 20
        field.layer.borderColor = UIColor.white.cgColor
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    private func setupFullNameTextFieldConstraints(){
        NSLayoutConstraint.activate([
            fullNameTextField.topAnchor.constraint(equalTo: self.fullNameLabel.topAnchor),
            fullNameTextField.leftAnchor.constraint(equalTo: fullNameLabel.rightAnchor, constant: 5),
            fullNameTextField.rightAnchor.constraint(equalTo: formContainerView.rightAnchor, constant: -5),
            fullNameTextField.heightAnchor.constraint(equalTo: self.formContainerView.heightAnchor, multiplier: 0.08)
              ])
    }
    
   
    lazy var cityLabel: UILabel = {
       let label = UILabel()
        label.text = "City:"
        label.textColor = .white
        if isDeviceIPad {
            label.font = UIFont(name: "Hiragino Mincho ProN", size: 32)
        }else{
            label.font = UIFont(name: "Hiragino Mincho ProN", size: 20)
        }
       label.translatesAutoresizingMaskIntoConstraints = false
       return label
    }()
    
    private func setupCityLabelConstraints(){
        NSLayoutConstraint.activate([
            cityLabel.topAnchor.constraint(equalTo: self.street2TextField.bottomAnchor, constant: 10),
            cityLabel.leadingAnchor.constraint(equalTo: self.formContainerView.leadingAnchor, constant :5),
         cityLabel.widthAnchor.constraint(equalTo: self.formContainerView.widthAnchor, multiplier: 0.2),
            cityLabel.heightAnchor.constraint(equalTo: self.formContainerView.heightAnchor, multiplier: 0.08)
            ])
    }
    
    lazy var cityTextField: PaddingTextField = {
        let label = PaddingTextField()
        if isDeviceIPad {
            label.attributedPlaceholder = NSAttributedString(string: "Enter City",
                                                             attributes: [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 28)])
            label.font = UIFont.boldSystemFont(ofSize: 28)
        }else{
            label.attributedPlaceholder = NSAttributedString(string: "Enter City",
                                                             attributes: [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)])
            label.font = UIFont.boldSystemFont(ofSize: 18)
        }
        label.textColor = UIColor.white
        label.layer.borderWidth = 2
        label.layer.cornerRadius = 20
        label.layer.borderColor = UIColor.white.cgColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private func setupCityTextFieldConstraints(){
        NSLayoutConstraint.activate([
            cityTextField.topAnchor.constraint(equalTo: self.cityLabel.topAnchor),
            cityTextField.leadingAnchor.constraint(equalTo: self.cityLabel.trailingAnchor, constant: 5),
            cityTextField.widthAnchor.constraint(equalTo: self.formContainerView.widthAnchor, multiplier: 0.3),
            cityTextField.heightAnchor.constraint(equalTo: self.formContainerView.heightAnchor, multiplier: 0.08)
        ])
    }
    


    
    lazy var stateTextField: PaddingTextField = {
        let label = PaddingTextField()
        
        if isDeviceIPad {
            label.attributedPlaceholder = NSAttributedString(string: "State",
                                                             attributes: [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 28)])
            label.font = UIFont.boldSystemFont(ofSize: 28)
        }else{
            label.attributedPlaceholder = NSAttributedString(string: "State",
                                                             attributes: [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)])
            label.font = UIFont.boldSystemFont(ofSize: 18)
        }
        label.textColor = .white
        label.layer.borderWidth = 2
        label.layer.cornerRadius = 20
        label.layer.borderColor = UIColor.white.cgColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private func setupStateTextFieldConstraints(){
        NSLayoutConstraint.activate([
            stateTextField.topAnchor.constraint(equalTo: self.cityTextField.topAnchor),
            stateTextField.leadingAnchor.constraint(equalTo: self.cityTextField.trailingAnchor, constant: 5),
            stateTextField.trailingAnchor.constraint(equalTo: self.formContainerView.trailingAnchor, constant: -5),
            stateTextField.heightAnchor.constraint(equalTo: self.formContainerView.heightAnchor, multiplier: 0.08)
            ])
    }
    
    lazy var street1Label: UILabel = {
        let label = UILabel()
        label.text = "Street:"
        label.textColor = .white
        if isDeviceIPad {
            label.font = UIFont(name: "Hiragino Mincho ProN", size: 32)
        }else{
            label.font = UIFont(name: "Hiragino Mincho ProN", size: 20)
        }
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private func setupstreet1LabelConstraints(){
        NSLayoutConstraint.activate([
            street1Label.topAnchor.constraint(equalTo: self.fullNameLabel.bottomAnchor, constant: 10),
            street1Label.leadingAnchor.constraint(equalTo: self.formContainerView.leadingAnchor, constant :5),
            street1Label.widthAnchor.constraint(equalTo: self.formContainerView.widthAnchor, multiplier: 0.2),
            street1Label.heightAnchor.constraint(equalTo: self.formContainerView.heightAnchor, multiplier: 0.08)
            ])
    }
    
    lazy var streetTextField: PaddingTextField = {
        let label = PaddingTextField()
        if isDeviceIPad {
            label.attributedPlaceholder = NSAttributedString(string: "Street Address",
                                                             attributes: [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 28)])
            label.font = UIFont.boldSystemFont(ofSize: 28)
        }else{
            label.attributedPlaceholder = NSAttributedString(string: "Street Address",
                                                             attributes: [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)])
            label.font = UIFont.boldSystemFont(ofSize: 18)
        }
        label.textColor = UIColor.white
        label.layer.borderWidth = 2
        label.layer.cornerRadius = 20
        label.layer.borderColor = UIColor.white.cgColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private func setupStreetTextFieldConstraints(){
        NSLayoutConstraint.activate([
            streetTextField.topAnchor.constraint(equalTo: self.street1Label.topAnchor),
            streetTextField.leadingAnchor.constraint(equalTo: self.street1Label.trailingAnchor, constant: 5),
            streetTextField.trailingAnchor.constraint(equalTo: self.formContainerView.trailingAnchor, constant: -5),
            streetTextField.heightAnchor.constraint(equalTo: self.formContainerView.heightAnchor, multiplier: 0.08)
            ])
    }
    
    lazy var street2TextField: PaddingTextField = {
        let label = PaddingTextField()
        if isDeviceIPad {
            label.attributedPlaceholder = NSAttributedString(string: "Apt,Suite,Unit,Bldg (Optional)",
                                                             attributes: [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 28)])
            label.font = UIFont.boldSystemFont(ofSize: 28)
        }else{
            label.attributedPlaceholder = NSAttributedString(string: "Apt,Suite,Unit,Bldg (Optional)",
                                                             attributes: [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)])
            label.font = UIFont.boldSystemFont(ofSize: 18)
        }
        label.textColor = UIColor.white
        label.layer.borderWidth = 2
        label.layer.cornerRadius = 20
        label.layer.borderColor = UIColor.white.cgColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private func setupStreet2TextFieldConstraints(){
        NSLayoutConstraint.activate([
            street2TextField.topAnchor.constraint(equalTo: self.streetTextField.bottomAnchor, constant: 10),
            street2TextField.leadingAnchor.constraint(equalTo: self.streetTextField.leadingAnchor),
            street2TextField.trailingAnchor.constraint(equalTo: self.streetTextField.trailingAnchor),
            street2TextField.heightAnchor.constraint(equalTo: self.formContainerView.heightAnchor, multiplier: 0.08)
            ])
    }
    
    
    
    
    
    lazy var phoneLabel: UILabel = {
        let label = UILabel()
        label.text = "Phone:"
        if isDeviceIPad {
            label.font = UIFont(name: "Hiragino Mincho ProN", size: 32)
        }else{
            label.font = UIFont(name: "Hiragino Mincho ProN", size: 20)
        }
        label.adjustsFontSizeToFitWidth = true
        label.textColor = UIColor.white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private func setupPhoneLabelConstraints(){
        NSLayoutConstraint.activate([
            phoneLabel.topAnchor.constraint(equalTo: self.cityLabel.bottomAnchor, constant: 10),
            phoneLabel.leftAnchor.constraint(equalTo: formContainerView.leftAnchor, constant: 5),
            phoneLabel.widthAnchor.constraint(equalTo: formContainerView.widthAnchor, multiplier: 0.2),
            phoneLabel.heightAnchor.constraint(equalTo: self.formContainerView.heightAnchor, multiplier: 0.08)
        ])
    }
    
    lazy var phoneTextField: PaddingTextField = {
        let field = PaddingTextField()
        if isDeviceIPad {
            field.attributedPlaceholder = NSAttributedString(string: "Enter your landline number",
                                                             attributes: [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 28)])
            field.font = UIFont.boldSystemFont(ofSize: 28)
        }else{
            field.attributedPlaceholder = NSAttributedString(string: "Enter your landline number",
                                                             attributes: [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)])
            field.font = UIFont.boldSystemFont(ofSize: 18)
        }
        field.textColor = UIColor.white
        field.layer.borderWidth = 2
        field.layer.cornerRadius = 20
        field.layer.borderColor = UIColor.white.cgColor
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    private func setupPhoneTextFieldConstraints(){
        NSLayoutConstraint.activate([
            phoneTextField.topAnchor.constraint(equalTo: self.phoneLabel.topAnchor),
            phoneTextField.leftAnchor.constraint(equalTo: phoneLabel.rightAnchor, constant: 5),
            phoneTextField.rightAnchor.constraint(equalTo: formContainerView.rightAnchor, constant: -5),
            phoneTextField.heightAnchor.constraint(equalTo: self.formContainerView.heightAnchor, multiplier: 0.08)
        ])
    }

    lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.text = "Email:"
        if isDeviceIPad {
            label.font = UIFont(name: "Hiragino Mincho ProN", size: 32)
        }else{
            label.font = UIFont(name: "Hiragino Mincho ProN", size: 20)
        }
        label.adjustsFontSizeToFitWidth = true
        label.textColor = UIColor.white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private func setupEmailLabelConstraints(){
        NSLayoutConstraint.activate([
            emailLabel.topAnchor.constraint(equalTo: self.phoneLabel.bottomAnchor, constant: 10),
            emailLabel.leftAnchor.constraint(equalTo: formContainerView.leftAnchor, constant: 5),
            emailLabel.widthAnchor.constraint(equalTo: formContainerView.widthAnchor, multiplier: 0.2),
            emailLabel.heightAnchor.constraint(equalTo: self.formContainerView.heightAnchor, multiplier: 0.08)
        ])
    }
    
    lazy var emailTextField: PaddingTextField = {
        let label = PaddingTextField()
        if isDeviceIPad {
            label.attributedPlaceholder = NSAttributedString(string: "Enter your email",
                                                             attributes: [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 28)])
            label.font = UIFont.boldSystemFont(ofSize: 28)
        }else{
            label.attributedPlaceholder = NSAttributedString(string: "Enter your email",
                                                             attributes: [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)])
            label.font = UIFont.boldSystemFont(ofSize: 18)
        }
        label.textColor = UIColor.white
        label.layer.borderWidth = 2
        label.layer.cornerRadius = 20
        label.layer.borderColor = UIColor.white.cgColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private func setupEmailTextFieldConstraints(){
        NSLayoutConstraint.activate([
            emailTextField.topAnchor.constraint(equalTo: self.emailLabel.topAnchor),
            emailTextField.leftAnchor.constraint(equalTo: emailLabel.rightAnchor, constant: 5),
            emailTextField.rightAnchor.constraint(equalTo: formContainerView.rightAnchor, constant: -5),
            emailTextField.heightAnchor.constraint(equalTo: self.formContainerView.heightAnchor, multiplier: 0.08)
        ])
    }
    
    lazy var timingLabel: UILabel = {
        let label = UILabel()
        label.text = "Timing:"
        if isDeviceIPad {
            label.font = UIFont(name: "Hiragino Mincho ProN", size: 32)
        }else{
            label.font = UIFont(name: "Hiragino Mincho ProN", size: 20)
        }
        label.adjustsFontSizeToFitWidth = true
        label.textColor = UIColor.white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private func setupTimingLabelConstraints(){
        NSLayoutConstraint.activate([
            timingLabel.topAnchor.constraint(equalTo: self.emailLabel.bottomAnchor, constant: 10),
            timingLabel.leftAnchor.constraint(equalTo: formContainerView.leftAnchor, constant: 5),
            timingLabel.widthAnchor.constraint(equalTo: formContainerView.widthAnchor, multiplier: 0.2),
            timingLabel.heightAnchor.constraint(equalTo: self.formContainerView.heightAnchor, multiplier: 0.08)
        ])
    }
    
    lazy var timingTextField: PaddingTextField = {
        let field = PaddingTextField()
        if isDeviceIPad {
            field.attributedPlaceholder = NSAttributedString(string: "Enter Day&Timing e.g(Monday,2:00pm)",
                                                             attributes: [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 28)])
            field.font = UIFont.boldSystemFont(ofSize: 28)
        }else{
            field.attributedPlaceholder = NSAttributedString(string: "Enter timing",
                                                             attributes: [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)])
            field.font = UIFont.boldSystemFont(ofSize: 18)
        }
        field.textColor = UIColor.white
        field.layer.borderWidth = 2
        field.layer.cornerRadius = 20
        field.layer.borderColor = UIColor.white.cgColor
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    private func setupTimingTextFieldConstraints(){
        NSLayoutConstraint.activate([
            timingTextField.topAnchor.constraint(equalTo: self.timingLabel.topAnchor),
            timingTextField.leftAnchor.constraint(equalTo: timingLabel.rightAnchor, constant: 5),
            timingTextField.rightAnchor.constraint(equalTo: formContainerView.rightAnchor, constant: -5),
            timingTextField.heightAnchor.constraint(equalTo: self.formContainerView.heightAnchor, multiplier: 0.08)
         ])
    }
    
    lazy var requestButon: UIButton = {
       let button = UIButton()
       button.backgroundColor = button.hexStringToUIColor(hex: "#FF416C")
       button.setTitle("Schedule Now !", for: .normal)
        
        button.layer.cornerRadius = 20
        if isDeviceIPad {
              button.titleLabel?.font = UIFont(name: "BillaBong", size: 42)
        }else{
             button.titleLabel?.font = UIFont(name: "BillaBong", size: 32)
        }
      
       button.titleLabel?.adjustsFontSizeToFitWidth = true
       button.translatesAutoresizingMaskIntoConstraints = false
       return button
    }()
    
    private func setupRequestButonConstraints(){
        
        if isDeviceIPad {
             requestButon.widthAnchor.constraint(equalTo: self.formContainerView.widthAnchor, multiplier: 0.6).isActive = true
            requestButon.heightAnchor.constraint(equalToConstant: 50).isActive = true
        }else{
             requestButon.widthAnchor.constraint(equalTo: self.formContainerView.widthAnchor, multiplier: 0.8).isActive = true
              requestButon.heightAnchor.constraint(equalToConstant: 50).isActive = true
        }
        
        NSLayoutConstraint.activate([
            requestButon.topAnchor.constraint(equalTo: self.timingLabel.bottomAnchor, constant: 15),
            requestButon.centerXAnchor.constraint(equalTo: self.centerXAnchor)
            ])
     }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.applyMainAppTheme()
    //self.backgroundColor = #colorLiteral(red: 0.4703475833, green: 0.2535249591, blue: 0.4185587764, alpha: 1)
        
        self.addSubview(scheduleVisitView)
        setupScheduleVisitViewConstraints()
        
        self.scheduleVisitView.addSubview(scheduleVisitLabel)
        setupScheduleVisitLabelConstraints()
        
        self.scheduleVisitView.addSubview(scheduleVisitImageView)
        setupscheduleVisitImageViewConstraints()
        
        self.addSubview(formContainerView)
        setupFormContainerViewConstraints()
        self.formContainerView.addSubview(chooseProductIntrestedIn)
        setupchooseProductsIntrestedInConstarints()
        
        self.formContainerView.addSubview(fullNameLabel)
        setupFullNameLabelConstraints()
        
        self.formContainerView.addSubview(fullNameTextField)
        setupFullNameTextFieldConstraints()
        
        self.formContainerView.addSubview(street1Label)
        setupstreet1LabelConstraints()
        
        self.formContainerView.addSubview(streetTextField)
        setupStreetTextFieldConstraints()
        
       self.formContainerView.addSubview(street2TextField)
        setupStreet2TextFieldConstraints()
   
        self.formContainerView.addSubview(cityLabel)
        setupCityLabelConstraints()
        
        self.formContainerView.addSubview(cityTextField)
        setupCityTextFieldConstraints()
        
        self.formContainerView.addSubview(stateTextField)
        setupStateTextFieldConstraints()
        
        self.formContainerView.addSubview(phoneLabel)
        setupPhoneLabelConstraints()
        
        self.formContainerView.addSubview(phoneTextField)
        setupPhoneTextFieldConstraints()
        
        self.formContainerView.addSubview(emailLabel)
        setupEmailLabelConstraints()
        
        self.formContainerView.addSubview(emailTextField)
        setupEmailTextFieldConstraints()
     
        self.formContainerView.addSubview(timingLabel)
        setupTimingLabelConstraints()
        
        self.formContainerView.addSubview(timingTextField)
        setupTimingTextFieldConstraints()
        self.formContainerView.addSubview(requestButon)
        setupRequestButonConstraints()
 
        setupDropDowns()
    }
    
    private func setupDropDowns(){
        chooseProductIntrestedInDropDown.bottomOffset = CGPoint(x: 0, y: 10)
        chooseProductIntrestedInDropDown.dataSource = [
            "All Products",
            "Wireless Security",
            "Folding Doors",
            "Window Coverings All",
            "Honeycomb Blinds",
            "Pleated Blinds",
            "Roman Blinds",
            "Shangrilla/verman Blinds",
            "Silhouette Blinds",
            "Zebra Blinds",
            "Panel Blinds",
            "Wood Horizontal Blinds",
            "Wood Vertical Blinds",
            "Aluminium 1' Blinds",
            "Aluminium w' Blinds",
            "Screen roller Blinds",
            "Dark Roller Blinds",
            "Textured Roller Blinds",
            "Printed Roller Blinds",
            "Woven bamboo chicks blinds(Roman)",
            "Woven bamboo chicks blinds(rollup)"
        ]
        
        chooseProductIntrestedInDropDown.selectionAction = { [weak self] (index, item) in
            self?.chooseProductIntrestedIn.setTitle(item, for: .normal)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


extension RequestFreeSalesVisitView: UIPickerViewDataSource, UIPickerViewDelegate {
    
    public func numberOfComponents(in pickerView: UIPickerView) -> Int{
        return 1
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        
        return list.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        self.endEditing(true)
        return list[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        print("\(list.count)")
        print("\(row)")
       // self.textBox.text = self.list[row]
       // self.dropDown.isHidden = true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        if textField == self.textBox {
            self.chooseProductIntrestedIn.isHidden = false
            //if you don't want the users to se the keyboard type:
            
            textField.endEditing(true)
        }
    }
}
