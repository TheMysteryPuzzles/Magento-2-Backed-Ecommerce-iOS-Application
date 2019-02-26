//
//  CheckoutViewController.swift
//  MagentoAPI
//
//  Created by Work on 2/21/19.
//  Copyright © 2019 TheMysteryPuzzles. All rights reserved.
//

import UIKit

class CheckoutViewController: UIViewController {

    lazy var checkOutView: CheckoutView = {
        let view = CheckoutView(frame: self.view.bounds)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(checkOutView)
     
    }
}


class CheckoutView: UIView {
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView(frame: .zero)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.contentSize = CGSize(width: self.frame.width, height: self.frame.height)
        scrollView.backgroundColor = UIColor.clear
        return scrollView
    }()
    
    private func setupScrollViewConstraints(){
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: self.safeTopAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.safeBottomAnchor)
        ])
    }
    
    lazy var firstName: UILabel = {
       let label = UILabel()
        label.text = "First Name:"
        label.textColor = UIColor.white
        label.font = UIFont(name: "Cochin", size: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private func setupFirstNameLabelconstraints(){
        NSLayoutConstraint.activate([
            firstName.topAnchor.constraint(equalTo: self.scrollView.topAnchor, constant: 30),
            firstName.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor, constant: 10),
            firstName.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor, multiplier: 0.3),
            firstName.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    lazy var firstNameTextfield: UITextField = {
        let field = UITextField()
        field.textColor = UIColor.white
        field.attributedPlaceholder = NSAttributedString(string: " Enter your first name", attributes: [
            .foregroundColor: UIColor.white,
            .font: UIFont.boldSystemFont(ofSize: 18.0)
            ])
        field.layer.borderColor = UIColor.white.cgColor
        field.layer.borderWidth = 1
        field.layer.cornerRadius = 15
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    
    private func setupFirstNameTextfieldconstraints(){
        NSLayoutConstraint.activate([
            firstNameTextfield.topAnchor.constraint(equalTo: self.firstName.topAnchor),
            firstNameTextfield.leadingAnchor.constraint(equalTo: self.firstName.trailingAnchor, constant: 10),
            firstNameTextfield.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor, constant: -10),
            firstNameTextfield.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    lazy var lastName: UILabel = {
        let label = UILabel()
        label.text = "Last Name:"
        label.textColor = UIColor.white
        label.font = UIFont(name: "Cochin", size: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private func setupLasttNameLabelconstraints(){
        NSLayoutConstraint.activate([
            lastName.topAnchor.constraint(equalTo: self.firstName.bottomAnchor, constant: 10),
            lastName.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor, constant: 10),
            lastName.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor, multiplier: 0.3),
            lastName.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    lazy var lastNameTextfield: UITextField = {
        let field = UITextField()
        field.textColor = UIColor.white
        field.attributedPlaceholder = NSAttributedString(string: " Enter your last name", attributes: [
            .foregroundColor: UIColor.white,
            .font: UIFont.boldSystemFont(ofSize: 18.0)
            ])
        field.layer.borderColor = UIColor.white.cgColor
        field.layer.borderWidth = 1
        field.layer.cornerRadius = 15
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    
    private func setupLastNameTextfieldconstraints(){
        NSLayoutConstraint.activate([
            lastNameTextfield.topAnchor.constraint(equalTo: self.lastName.topAnchor),
            lastNameTextfield.leadingAnchor.constraint(equalTo: self.lastName.trailingAnchor, constant: 10),
            lastNameTextfield.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor, constant: -10),
            lastNameTextfield.heightAnchor.constraint(equalToConstant: 30)
            ])
    }
    
    
    lazy var compantNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Company:"
        label.textColor = UIColor.white
        label.font = UIFont(name: "Cochin", size: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private func setupCompanyNameLabelconstraints(){
        NSLayoutConstraint.activate([
            compantNameLabel.topAnchor.constraint(equalTo: self.lastName.bottomAnchor, constant: 10),
            compantNameLabel.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor, constant: 10),
            compantNameLabel.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor, multiplier: 0.3),
            compantNameLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    lazy var companyNameTextfield: UITextField = {
        let field = UITextField()
        field.textColor = UIColor.white
        field.attributedPlaceholder = NSAttributedString(string: " Enter your company name", attributes: [
            .foregroundColor: UIColor.white,
            .font: UIFont.boldSystemFont(ofSize: 18.0)
            ])
        field.layer.borderColor = UIColor.white.cgColor
        field.layer.borderWidth = 1
        field.layer.cornerRadius = 15
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    
    private func setupCompanyNameTextfieldconstraints(){
        NSLayoutConstraint.activate([
            companyNameTextfield.topAnchor.constraint(equalTo: self.compantNameLabel.topAnchor),
            companyNameTextfield.leadingAnchor.constraint(equalTo: self.compantNameLabel.trailingAnchor, constant: 10),
            companyNameTextfield.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor, constant: -10),
            companyNameTextfield.heightAnchor.constraint(equalToConstant: 30)
            ])
    }
    
    lazy var streetAddressLabel: UILabel = {
        let label = UILabel()
        label.text = "Street Address:"
        label.textColor = UIColor.white
        label.font = UIFont(name: "Cochin", size: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    private func setupStreetAddressLabelconstraints(){
        NSLayoutConstraint.activate([
            streetAddressLabel.topAnchor.constraint(equalTo: self.compantNameLabel.bottomAnchor, constant: 10),
            streetAddressLabel.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor, constant: 10),
            streetAddressLabel.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor, multiplier: 0.4),
            streetAddressLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    lazy var address1Textfield: UITextField = {
        let field = UITextField()
        field.textColor = UIColor.white
        field.attributedPlaceholder = NSAttributedString(string: "", attributes: [
            .foregroundColor: UIColor.white,
            .font: UIFont.boldSystemFont(ofSize: 24.0)
            ])
        field.layer.borderColor = UIColor.white.cgColor
        field.layer.borderWidth = 2
        field.layer.cornerRadius = 10
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    
    private func setupAddress1Textfieldconstraints(){
        NSLayoutConstraint.activate([
            address1Textfield.topAnchor.constraint(equalTo: self.streetAddressLabel.bottomAnchor, constant: 10),
            address1Textfield.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor, constant: 10),
            address1Textfield.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor, constant: -10),
            address1Textfield.heightAnchor.constraint(equalToConstant: 30)
       ])
    }
    
    lazy var address2Textfield: UITextField = {
        let field = UITextField()
        field.textColor = UIColor.white
        field.attributedPlaceholder = NSAttributedString(string: "", attributes: [
            .foregroundColor: UIColor.white,
            .font: UIFont.boldSystemFont(ofSize: 24.0)
            ])
        field.layer.borderColor = UIColor.white.cgColor
        field.layer.borderWidth = 2
        field.layer.cornerRadius = 10
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    
    private func setupAddress2Textfieldconstraints(){
        NSLayoutConstraint.activate([
            address2Textfield.topAnchor.constraint(equalTo: self.address1Textfield.bottomAnchor, constant: 10),
            address2Textfield.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor, constant: 10),
            address2Textfield.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor, constant: -10),
            address2Textfield.heightAnchor.constraint(equalToConstant: 30)
            ])
        
    }
    
    lazy var cityLabel: UILabel = {
        let label = UILabel()
        label.text = "City:"
        label.textColor = UIColor.white
        label.font = UIFont(name: "Cochin", size: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private func setupCityLabelLabelconstraints(){
        NSLayoutConstraint.activate([
            cityLabel.topAnchor.constraint(equalTo: self.address2Textfield.bottomAnchor, constant: 10),
            cityLabel.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor, constant: 10),
            cityLabel.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor, multiplier: 0.3),
            cityLabel.heightAnchor.constraint(equalToConstant: 30)
            ])
    }
    
    lazy var cityNameTextfield: UITextField = {
        let field = UITextField()
        field.textColor = UIColor.white
        field.attributedPlaceholder = NSAttributedString(string: " Enter your City", attributes: [
            .foregroundColor: UIColor.white,
            .font: UIFont.boldSystemFont(ofSize: 18.0)
            ])
        field.layer.borderColor = UIColor.white.cgColor
        field.layer.borderWidth = 1
        field.layer.cornerRadius = 15
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    
    private func setupCityNameTextfieldconstraints(){
        NSLayoutConstraint.activate([
            cityNameTextfield.topAnchor.constraint(equalTo: self.cityLabel.topAnchor),
            cityNameTextfield.leadingAnchor.constraint(equalTo: self.cityLabel.trailingAnchor, constant: 10),
            cityNameTextfield.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor, constant: -10),
            cityNameTextfield.heightAnchor.constraint(equalToConstant: 30)
            ])
    }
    
    
    lazy var stateLabel: UILabel = {
        let label = UILabel()
        label.text = "State:"
        label.textColor = UIColor.white
        label.font = UIFont(name: "Cochin", size: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private func setupStateLabelLabelconstraints(){
        NSLayoutConstraint.activate([
            stateLabel.topAnchor.constraint(equalTo: self.cityLabel.bottomAnchor, constant: 10),
            stateLabel.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor, constant: 10),
            stateLabel.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor, multiplier: 0.3),
            stateLabel.heightAnchor.constraint(equalToConstant: 30)
            ])
    }
    
    lazy var stateNameTextfield: UITextField = {
        let field = UITextField()
        field.textColor = UIColor.white
        field.attributedPlaceholder = NSAttributedString(string: " Enter your State", attributes: [
            .foregroundColor: UIColor.white,
            .font: UIFont.boldSystemFont(ofSize: 18.0)
            ])
        field.layer.borderColor = UIColor.white.cgColor
        field.layer.borderWidth = 1
        field.layer.cornerRadius = 15
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    
    private func setupStateNameTextfieldconstraints(){
        NSLayoutConstraint.activate([
            stateNameTextfield.topAnchor.constraint(equalTo: self.stateLabel.topAnchor),
            stateNameTextfield.leadingAnchor.constraint(equalTo: self.stateLabel.trailingAnchor, constant: 10),
            stateNameTextfield.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor, constant: -10),
            stateNameTextfield.heightAnchor.constraint(equalToConstant: 30)
            ])
    }
    
    
    lazy var zipCodeLabel: UILabel = {
        let label = UILabel()
        label.text = "Zip Code:"
        label.textColor = UIColor.white
        label.font = UIFont(name: "Cochin", size: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private func setupZipCodeLabelconstraints(){
        NSLayoutConstraint.activate([
            zipCodeLabel.topAnchor.constraint(equalTo: self.stateLabel.bottomAnchor, constant: 10),
            zipCodeLabel.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor, constant: 10),
            zipCodeLabel.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor, multiplier: 0.3),
            zipCodeLabel.heightAnchor.constraint(equalToConstant: 30)
            ])
    }
    
    lazy var zipTextfield: UITextField = {
        let field = UITextField()
        field.textColor = UIColor.white
        field.attributedPlaceholder = NSAttributedString(string: " Enter your Zip", attributes: [
            .foregroundColor: UIColor.white,
            .font: UIFont.boldSystemFont(ofSize: 18.0)
            ])
        field.layer.borderColor = UIColor.white.cgColor
        field.layer.borderWidth = 1
        field.layer.cornerRadius = 15
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    
    private func setupZipTextfieldconstraints(){
        NSLayoutConstraint.activate([
            zipTextfield.topAnchor.constraint(equalTo: self.zipCodeLabel.topAnchor),
            zipTextfield.leadingAnchor.constraint(equalTo: self.zipCodeLabel.trailingAnchor, constant: 10),
            zipTextfield.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor, constant: -10),
            zipTextfield.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    lazy var countryLabel: UILabel = {
        let label = UILabel()
        label.text = "Country:"
        label.textColor = UIColor.white
        label.font = UIFont(name: "Cochin", size: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private func setupCountryLabelconstraints(){
        NSLayoutConstraint.activate([
            countryLabel.topAnchor.constraint(equalTo: self.zipCodeLabel.bottomAnchor, constant: 10),
            countryLabel.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor, constant: 10),
            countryLabel.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor, multiplier: 0.3),
            countryLabel.heightAnchor.constraint(equalToConstant: 30)
            ])
    }
    
    lazy var countryTextfield: UITextField = {
        let field = UITextField()
        field.textColor = UIColor.white
        field.attributedPlaceholder = NSAttributedString(string: " Enter your Country", attributes: [
            .foregroundColor: UIColor.white,
            .font: UIFont.boldSystemFont(ofSize: 18.0)
            ])
        field.layer.borderColor = UIColor.white.cgColor
        field.layer.borderWidth = 1
        field.layer.cornerRadius = 15
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    
    private func setupCountryTextfieldconstraints(){
        NSLayoutConstraint.activate([
            countryTextfield.topAnchor.constraint(equalTo: self.countryLabel.topAnchor),
            countryTextfield.leadingAnchor.constraint(equalTo: self.countryLabel.trailingAnchor, constant: 10),
            countryTextfield.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor, constant: -10),
            countryTextfield.heightAnchor.constraint(equalToConstant: 30)
            ])
    }
    
    
    lazy var phoneLabel: UILabel = {
        let label = UILabel()
        label.text = "Phone:"
        label.textColor = UIColor.white
        label.font = UIFont(name: "Cochin", size: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private func setupPhoneLabelconstraints(){
        NSLayoutConstraint.activate([
            phoneLabel.topAnchor.constraint(equalTo: self.countryLabel.bottomAnchor, constant: 10),
            phoneLabel.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor, constant: 10),
            phoneLabel.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor, multiplier: 0.3),
            phoneLabel.heightAnchor.constraint(equalToConstant: 30)
            ])
    }
    
    lazy var phoneTextfield: UITextField = {
        let field = UITextField()
        field.textColor = UIColor.white
        field.attributedPlaceholder = NSAttributedString(string: " Enter your Phone", attributes: [
            .foregroundColor: UIColor.white,
            .font: UIFont.boldSystemFont(ofSize: 18.0)
            ])
        field.layer.borderColor = UIColor.white.cgColor
        field.layer.borderWidth = 1
        field.layer.cornerRadius = 15
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    
    private func setupPhoneTextfieldconstraints(){
        NSLayoutConstraint.activate([
            phoneTextfield.topAnchor.constraint(equalTo: self.phoneLabel.topAnchor),
            phoneTextfield.leadingAnchor.constraint(equalTo: self.phoneLabel.trailingAnchor, constant: 10),
            phoneTextfield.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor, constant: -10),
            phoneTextfield.heightAnchor.constraint(equalToConstant: 30)
            ])
    }
    
    
    lazy var placeOrderButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = button.hexStringToUIColor(hex: "#FF416C")
        button.titleLabel?.font = UIFont(name: "BilaBong", size: 28)
        button.setTitle("Process Order", for: .normal)
        return button
    }()
    
    private func setupPlaceOrderButtonConstraints(){
        NSLayoutConstraint.activate([
            
            placeOrderButton.topAnchor.constraint(equalTo: self.phoneLabel.bottomAnchor, constant: 20),
            placeOrderButton.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor),
            placeOrderButton.heightAnchor.constraint(equalToConstant: 40),
            placeOrderButton.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.7)

            ])
    }
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.applyMainAppTheme()
    
        self.backgroundColor = UIColor.white
        
        self.addSubview(scrollView)
        setupScrollViewConstraints()
        scrollView.applyMainAppTheme()

        self.addSubview(firstName)
        setupFirstNameLabelconstraints()
        
        self.addSubview(firstNameTextfield)
        setupFirstNameTextfieldconstraints()
        
        self.addSubview(lastName)
        setupLasttNameLabelconstraints()
        
        self.addSubview(lastNameTextfield)
        setupLastNameTextfieldconstraints()
        
        self.addSubview(compantNameLabel)
        setupCompanyNameLabelconstraints()
        
        self.addSubview(companyNameTextfield)
        setupCompanyNameTextfieldconstraints()
        
        self.addSubview(streetAddressLabel)
        setupStreetAddressLabelconstraints()
        
        self.addSubview(address1Textfield)
        setupAddress1Textfieldconstraints()
        
        self.addSubview(address2Textfield)
        setupAddress2Textfieldconstraints()
        
        self.addSubview(cityLabel)
        setupCityLabelLabelconstraints()
        
        self.addSubview(cityNameTextfield)
        setupCityNameTextfieldconstraints()
        
        self.addSubview(stateLabel)
        setupStateLabelLabelconstraints()
        
        self.addSubview(stateNameTextfield)
        setupStateNameTextfieldconstraints()
        
        self.addSubview(zipCodeLabel)
        setupZipCodeLabelconstraints()
        
        self.addSubview(zipTextfield)
        setupZipTextfieldconstraints()
        
        self.addSubview(countryLabel)
        setupCountryLabelconstraints()
        
        self.addSubview(countryTextfield)
        setupCountryTextfieldconstraints()
        
        self.addSubview(phoneLabel)
        setupPhoneLabelconstraints()
        
        self.addSubview(phoneTextfield)
        setupPhoneTextfieldconstraints()
        
        self.addSubview(placeOrderButton)
        setupPlaceOrderButtonConstraints()
        
  
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
