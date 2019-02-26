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
    
    var vc: ContactUsViewController?
    
    lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.text = "Email: "
        if isDeviceIPad {
            label.font = UIFont(name: "Hiragino Mincho ProN", size: 32)
        }else{
            label.font = UIFont(name: "Hiragino Mincho ProN", size: 20)
        }
        label.textColor = UIColor.white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private func setupEmailLabelConstraints(){
        NSLayoutConstraint.activate([
            emailLabel.topAnchor.constraint(equalTo: self.fullNameLabel.bottomAnchor, constant: 10),
            emailLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            emailLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.3),
            emailLabel.heightAnchor.constraint(equalToConstant: 30)
            ])
    }
    
    
    lazy var emailTextfeild: UITextField = {
        let field = UITextField()
        field.backgroundColor = UIColor.white
        field.layer.cornerRadius = 15
        field.attributedPlaceholder = NSAttributedString(string: " Enter your Email",
                                                               attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray])
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    private func setupEmailTextfeildConstraints(){
        NSLayoutConstraint.activate([
            emailTextfeild.topAnchor.constraint(equalTo: self.emailLabel.topAnchor),
            emailTextfeild.leadingAnchor.constraint(equalTo: self.emailLabel.trailingAnchor, constant: 10),
            emailTextfeild.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            emailTextfeild.heightAnchor.constraint(equalTo: self.emailLabel.heightAnchor)
            ])
    }
    
    lazy var phoneLabel: UILabel = {
       let label = UILabel()
       label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Phone:"
        if isDeviceIPad {
            label.font = UIFont(name: "Hiragino Mincho ProN", size: 32)
        }else{
            label.font = UIFont(name: "Hiragino Mincho ProN", size: 20)
        }
        label.textColor = UIColor.white
       return label
    }()
    
    private func setupPhoneLabelConstraints(){
        NSLayoutConstraint.activate([
            phoneLabel.topAnchor.constraint(equalTo: self.emailLabel.bottomAnchor, constant: 10),
            phoneLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            phoneLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.3),
            phoneLabel.heightAnchor.constraint(equalToConstant: 30)
            ])
    }
    
    
    lazy var phoneTextfeild: UITextField = {
        let field = UITextField()
        field.attributedPlaceholder = NSAttributedString(string: " Enter your Phone",
                                                         attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray])
        field.backgroundColor = UIColor.white
        field.layer.cornerRadius = 15
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    private func setupPhoneTextfeildConstraints(){
        NSLayoutConstraint.activate([
            phoneTextfeild.topAnchor.constraint(equalTo: self.phoneLabel.topAnchor),
            phoneTextfeild.leadingAnchor.constraint(equalTo: self.phoneLabel.trailingAnchor, constant: 10),
            phoneTextfeild.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            phoneTextfeild.heightAnchor.constraint(equalTo: self.phoneLabel.heightAnchor)
            ])
    }
    
    
    lazy var aboutUsLabel: UILabel = {
        let label = UILabel()
        if isDeviceIPad {
            label.font = UIFont(name: "Hiragino Mincho ProN", size: 32)
        }else{
            label.font = UIFont(name: "Hiragino Mincho ProN", size: 26)
        }
        label.adjustsFontSizeToFitWidth = true
        label.textColor = UIColor.white
        label.text = "Contact Details"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private func setupAboutUsLabelConstraints(){
        NSLayoutConstraint.activate([
            aboutUsLabel.topAnchor.constraint(equalTo: self.safeTopAnchor, constant: 10),
            aboutUsLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            aboutUsLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            aboutUsLabel.heightAnchor.constraint(equalToConstant: 30)
            ])
    }
    
    lazy var contactDetailsView: UIView = {
       let view = UIView()
       view.translatesAutoresizingMaskIntoConstraints = false
       return view
    }()
    
    private func setupAboutUsDetailLabelConstraints(){
        NSLayoutConstraint.activate([
            contactDetailsView.topAnchor.constraint(equalTo: self.aboutUsLabel.bottomAnchor, constant: 10),
            contactDetailsView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            contactDetailsView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            contactDetailsView.heightAnchor.constraint(equalToConstant: 200)
            ])
    }
    
    lazy var addressLabel: UILabel = {
       let label = UILabel()
       label.translatesAutoresizingMaskIntoConstraints = false
       label.text = "CORPORATE OFFICE"
        label.font = UIFont.boldSystemFont(ofSize: 30)
       label.textColor = UIColor.white
       return label
    }()

    private func setupAddressLabelConstraints(){
        NSLayoutConstraint.activate([
            addressLabel.topAnchor.constraint(equalTo: self.contactDetailsView.topAnchor, constant: 10),
            addressLabel.leadingAnchor.constraint(equalTo: contactDetailsView.leadingAnchor, constant: 5),
            addressLabel.trailingAnchor.constraint(equalTo: self.contactDetailsView.trailingAnchor, constant: -5),
            addressLabel.heightAnchor.constraint(equalToConstant: 30)
            ])
    }
    
    lazy var addressValueLabel: UILabel = {
       let label = UILabel()
        label.text = "510, 5th Floor, SCP Building,Downtown, Dubai"
        label.textColor = UIColor.white
        label.font = UIFont(name: "Arial", size: 22)
        label.numberOfLines = 0
        label.backgroundColor = UIColor.clear
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
       
    }()
    
    private func setupAddressValueLabelConstraints(){
        NSLayoutConstraint.activate([
            addressValueLabel.leadingAnchor.constraint(equalTo: self.contactDetailsView.leadingAnchor, constant: 5),
            addressValueLabel.trailingAnchor.constraint(equalTo: self.contactDetailsView.trailingAnchor, constant: -5),
            addressValueLabel.heightAnchor.constraint(equalToConstant: 70),
            addressValueLabel.topAnchor.constraint(equalTo: self.addressLabel.bottomAnchor, constant: 5)
            ])
    }
    
    lazy var emailValueLabel: UILabel = {
        let label = UILabel()
        label.text = "sales@magentasquares.com"
        label.textColor = UIColor.white
        label.font = UIFont(name: "Arial", size: 22)
        label.numberOfLines = 0
        label.backgroundColor = UIColor.clear
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
    }()
    
    private func setupEmailValueLabelLabelConstraints(){
        NSLayoutConstraint.activate([
            emailValueLabel.leadingAnchor.constraint(equalTo: self.contactDetailsView.leadingAnchor, constant: 5),
            emailValueLabel.trailingAnchor.constraint(equalTo: self.contactDetailsView.trailingAnchor, constant: -5),
            emailValueLabel.heightAnchor.constraint(equalToConstant: 30),
            emailValueLabel.topAnchor.constraint(equalTo: self.addressValueLabel.bottomAnchor, constant: 5)
            ])
    }
    
    lazy var phoneValueLabel: UILabel = {
        let label = UILabel()
        label.text = "(123)456-7890"
        label.textColor = UIColor.white
        label.font = UIFont(name: "Arial", size: 22)
        label.numberOfLines = 0
        label.backgroundColor = UIColor.clear
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private func setupPhoneValueLabelConstraints(){
        NSLayoutConstraint.activate([
            phoneValueLabel.leadingAnchor.constraint(equalTo: self.contactDetailsView.leadingAnchor, constant: 5),
            phoneValueLabel.trailingAnchor.constraint(equalTo: self.contactDetailsView.trailingAnchor, constant: -5),
            phoneValueLabel.heightAnchor.constraint(equalToConstant: 30),
            phoneValueLabel.topAnchor.constraint(equalTo: self.emailValueLabel.bottomAnchor, constant: 5)
            ])
    }
    
    
    
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
    
    private func setupConstantUsLabelConstrainst(){
        NSLayoutConstraint.activate([
            contactUsLabel.topAnchor.constraint(equalTo: self.contactDetailsView.bottomAnchor, constant: 10),
            contactUsLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            contactUsLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            contactUsLabel.heightAnchor.constraint(equalToConstant: 30)
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

    private func setupFullnameConstraints(){
     NSLayoutConstraint.activate([
        fullNameLabel.topAnchor.constraint(equalTo: self.contactUsLabel.bottomAnchor, constant: 5),
        fullNameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
        fullNameLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.3),
        fullNameLabel.heightAnchor.constraint(equalToConstant: 30)
      ])
        
 }

    lazy var fullNameTextfeild: UITextField = {
       let field = UITextField()
        field.attributedPlaceholder = NSAttributedString(string: " Enter your Name",
                                                         attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray])
        field.backgroundColor = UIColor.white
        field.layer.cornerRadius = 15
       field.translatesAutoresizingMaskIntoConstraints = false
       return field
    }()
    
    private func setupfullNameTextfeildConstraints(){
        NSLayoutConstraint.activate([
            fullNameTextfeild.topAnchor.constraint(equalTo: self.fullNameLabel.topAnchor),
            fullNameTextfeild.leadingAnchor.constraint(equalTo: self.fullNameLabel.trailingAnchor, constant: 10),
            fullNameTextfeild.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            fullNameTextfeild.heightAnchor.constraint(equalTo: self.fullNameLabel.heightAnchor)
        ])
    }
    
    lazy var msgLabel: UILabel = {
       let label = UILabel()
        label.text = "Message:"
        if isDeviceIPad {
            label.font = UIFont(name: "Hiragino Mincho ProN", size: 32)
        }else{
            label.font = UIFont(name: "Hiragino Mincho ProN", size: 20)
        }
        label.textColor = UIColor.white
       label.translatesAutoresizingMaskIntoConstraints = false
       return label
    }()
    
    private func setupMsgLabelConstraints(){
        NSLayoutConstraint.activate([
            msgLabel.topAnchor.constraint(equalTo: self.phoneLabel.bottomAnchor, constant: 10),
            msgLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant:10),
            msgLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.3),
            msgLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    lazy var msgTextfeild: UITextField = {
        let field = UITextField()
        field.attributedPlaceholder = NSAttributedString(string: " Enter your Message",
                                                         attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray])
        field.backgroundColor = UIColor.white
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    private func setupMsgTextfeildConstraints(){
        NSLayoutConstraint.activate([
            msgTextfeild.topAnchor.constraint(equalTo: self.msgLabel.bottomAnchor, constant: 10),
            msgTextfeild.leadingAnchor.constraint(equalTo: self.msgLabel.leadingAnchor),
            msgTextfeild.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            msgTextfeild.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.25)
        ])
    }
    
    lazy var sendButton: UIButton = {
       let button = UIButton()
       button.setTitle("Send", for: .normal)
       button.backgroundColor = button.hexStringToUIColor(hex: "#FF416C")
       button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 5
       button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
       button.addTarget(self, action: #selector(handleContactUsSend), for: .touchUpInside)
       return button
    }()
    
    private func setupSendButtonConstraints(){
        NSLayoutConstraint.activate([
            sendButton.topAnchor.constraint(equalTo: self.msgTextfeild.bottomAnchor, constant: 5),
            sendButton.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.8),
            sendButton.heightAnchor.constraint(equalToConstant: 30),
            sendButton.centerXAnchor.constraint(equalTo: self.centerXAnchor)
            
            ])
    }
    
    @objc func handleContactUsSend(){
        vc?.handleContactUsSend()
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
         self.applyMainAppTheme()
        
        self.addSubview(aboutUsLabel)
        setupAboutUsLabelConstraints()
        
        self.addSubview(contactDetailsView)
        setupAboutUsDetailLabelConstraints()
        
        self.contactDetailsView.addSubview(addressLabel)
        setupAddressLabelConstraints()
        
        self.contactDetailsView.addSubview(addressValueLabel)
        setupAddressValueLabelConstraints()
        
        self.contactDetailsView.addSubview(emailValueLabel)
        setupEmailValueLabelLabelConstraints()
        
        self.contactDetailsView.addSubview(phoneValueLabel)
        setupPhoneValueLabelConstraints()
        
        self.addSubview(contactUsLabel)
        setupConstantUsLabelConstrainst()
        
        self.addSubview(fullNameLabel)
        setupFullnameConstraints()
        
        self.addSubview(fullNameTextfeild)
        setupfullNameTextfeildConstraints()
        
        self.addSubview(emailLabel)
        setupEmailLabelConstraints()
        
        self.addSubview(emailTextfeild)
        setupEmailTextfeildConstraints()
        
        self.addSubview(phoneLabel)
        setupPhoneLabelConstraints()
        
        self.addSubview(phoneTextfeild)
        setupPhoneTextfeildConstraints()
        
        self.addSubview(msgLabel)
        setupMsgLabelConstraints()
        
        self.addSubview(msgTextfeild)
        setupMsgTextfeildConstraints()
        
        self.addSubview(sendButton)
        setupSendButtonConstraints()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   
    
    
    
}
