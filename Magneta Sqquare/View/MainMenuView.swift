//
//  MainMenuView.swift
//  Magneta Sqquare
//
//  Created by Work on 1/17/19.
//  Copyright © 2019 TheMysteryPuzzles. All rights reserved.
//

import UIKit

class MainMenuView: UIView {

    
    lazy var logoImageView: UIImageView = {
       let view = UIImageView(image: UIImage(named: "Logo"), highlightedImage: nil)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
       return view
    }()
    
    private func setupLogoImageViewConstraints(){
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            logoImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            logoImageView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5),
            logoImageView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.2)
        ])
    }
    
    lazy var productsView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.applyD3ListBackgroundTheme()
        return view
    }()
    
    private func setupProductsViewConstraints(){
        NSLayoutConstraint.activate([
            productsView.topAnchor.constraint(equalTo: self.logoImageView.bottomAnchor, constant: 5),
            productsView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            productsView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            productsView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.3)
            ])
    }
    
    lazy var productsLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = #colorLiteral(red: 0.9265866876, green: 0.2247058153, blue: 0.8561574221, alpha: 1)
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 38)
        label.adjustsFontSizeToFitWidth = true
        label.textColor = UIColor.white
        label.text = " Products :"
        label.contentMode = .center
        label.layer.borderColor = UIColor.white.cgColor
          label.layer.borderWidth = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private func setupProductsLabelConstraints(){
        NSLayoutConstraint.activate([
            productsLabel.leftAnchor.constraint(equalTo: self.productsView.leftAnchor),
            productsLabel.topAnchor.constraint(equalTo: self.productsView.topAnchor, constant: 5),
            productsLabel.heightAnchor.constraint(equalTo: self.productsView.heightAnchor, multiplier: 0.3),
            productsLabel.rightAnchor.constraint(equalTo: self.productsView.rightAnchor)
        ])
    }
    
    lazy var productsCategoriesLabel: VerticalAlignLabel = {
        let label = VerticalAlignLabel()
        label.backgroundColor = #colorLiteral(red: 0.9306157231, green: 0.2100699246, blue: 0.8561837077, alpha: 1)
         label.textColor = UIColor.white
       
        label.layer.borderWidth = 2
        label.layer.borderColor = UIColor.white.cgColor
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 38)
        label.adjustsFontSizeToFitWidth = true
        label.text = "➡️ Window Coverings\n➡️ Folding Doors\n➡️ Wireless Security"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private func setupProductsCategoriesLabelConstraints(){
        NSLayoutConstraint.activate([
            productsCategoriesLabel.leftAnchor.constraint(equalTo: self.productsView.leftAnchor),
            productsCategoriesLabel.topAnchor.constraint(equalTo: self.productsLabel.bottomAnchor, constant: 5),
            productsCategoriesLabel.heightAnchor.constraint(equalTo: self.productsView.heightAnchor, multiplier: 0.65),
            productsCategoriesLabel.rightAnchor.constraint(equalTo: self.productsView.rightAnchor)
            ])
       }
    
    lazy var requestFreeSalesVisitView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.clear
        return view
    }()
    
    lazy var requestFreeSalesVisitLabel: VerticalAlignLabel = {
        let label = VerticalAlignLabel()
        label.backgroundColor = UIColor.clear
        label.numberOfLines = 1
        label.font = UIFont.boldSystemFont(ofSize: 38)
        label.adjustsFontSizeToFitWidth = true
        let attributedString = NSMutableAttributedString()
        attributedString.append(NSAttributedString(string: " Request ", attributes: [.underlineStyle: 0]))
        attributedString.append(NSAttributedString(string: "FREE", attributes: [.underlineStyle: 1]))
        attributedString.append(NSAttributedString(string: " Sales", attributes: [.underlineStyle: 0]))
        attributedString.append(NSAttributedString(string: " Visit", attributes: [.underlineStyle: 0]))
        label.attributedText = attributedString
         label.textColor = UIColor.white
        label.layer.borderWidth = 2
         label.layer.borderColor = UIColor.white.cgColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private func setupRequestFreeSalesVisitLabelConstraints(){
        NSLayoutConstraint.activate([
            requestFreeSalesVisitLabel.leftAnchor.constraint(equalTo: self.requestFreeSalesVisitView.leftAnchor),
            requestFreeSalesVisitLabel.topAnchor.constraint(equalTo: self.requestFreeSalesVisitView.topAnchor, constant: 5),
            requestFreeSalesVisitLabel.heightAnchor.constraint(equalTo: self.requestFreeSalesVisitView.heightAnchor, multiplier: 0.9),
            requestFreeSalesVisitLabel.rightAnchor.constraint(equalTo: self.requestFreeSalesVisitView.rightAnchor)
            ])
    }
    
    private func setupRequestFreeSalesVisitViewConstraints(){
        NSLayoutConstraint.activate([
            requestFreeSalesVisitView.topAnchor.constraint(equalTo: self.productsView.bottomAnchor),
            requestFreeSalesVisitView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            requestFreeSalesVisitView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            requestFreeSalesVisitView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.1)
            ])
    }
    
    lazy var visitShowroomView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.clear
        return view
    }()
    
    lazy var visitShowroomLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor.clear
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 38)
        label.adjustsFontSizeToFitWidth = true
        label.text = "Visit Showroom"
          label.layer.borderWidth = 2
         label.layer.borderColor = UIColor.white.cgColor
        label.textColor = UIColor.white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    

    private func setupvisitShowroomLabelConstraints(){
        NSLayoutConstraint.activate([
            visitShowroomLabel.leftAnchor.constraint(equalTo: self.visitShowroomView.leftAnchor),
            visitShowroomLabel.topAnchor.constraint(equalTo: self.visitShowroomView.topAnchor, constant: 5),
            visitShowroomLabel.heightAnchor.constraint(equalTo: self.visitShowroomView.heightAnchor, multiplier: 0.9),
            visitShowroomLabel.rightAnchor.constraint(equalTo: self.visitShowroomView.rightAnchor)
            ])
    }
    
    
    private func setupvisitShowroomViewConstraints(){
        NSLayoutConstraint.activate([
            visitShowroomView.topAnchor.constraint(equalTo: self.requestFreeSalesVisitView.bottomAnchor),
            visitShowroomView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            visitShowroomView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            visitShowroomView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.1)
            ])
    }
    
    lazy var shopOnlineView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.clear
        return view
    }()
    
    private func setupShopOnlineLabelConstraints(){
        NSLayoutConstraint.activate([
            shopOnlineLabel.leftAnchor.constraint(equalTo: self.shopOnlineView.leftAnchor),
            shopOnlineLabel.topAnchor.constraint(equalTo: self.shopOnlineView.topAnchor, constant: 5),
            shopOnlineLabel.heightAnchor.constraint(equalTo: self.shopOnlineView.heightAnchor, multiplier: 0.9),
            shopOnlineLabel.rightAnchor.constraint(equalTo: self.shopOnlineView.rightAnchor)
            ])
    }
    
    lazy var shopOnlineLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor.clear
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 38)
        label.adjustsFontSizeToFitWidth = true
        label.text = "Shop Online"
          label.layer.borderWidth = 2
         label.layer.borderColor = UIColor.white.cgColor
        label.textAlignment = .center
         label.textColor = UIColor.white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    
    private func setupShopOnlineViewConstraints(){
        NSLayoutConstraint.activate([
            shopOnlineView.topAnchor.constraint(equalTo: self.visitShowroomView.bottomAnchor),
            shopOnlineView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            shopOnlineView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            shopOnlineView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.1)
            ])
    }
    
    lazy var aboutUsView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.clear
        return view
    }()
    
    lazy var aboutUsLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor.clear
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 38)
        label.adjustsFontSizeToFitWidth = true
        label.text = "About Us"
          label.layer.borderWidth = 2
         label.layer.borderColor = UIColor.white.cgColor
         label.textColor = UIColor.white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private func setupAboutUsLabelConstraints(){
        NSLayoutConstraint.activate([
            aboutUsLabel.leftAnchor.constraint(equalTo: self.aboutUsView.leftAnchor),
            aboutUsLabel.topAnchor.constraint(equalTo: self.aboutUsView.topAnchor, constant: 5),
            aboutUsLabel.heightAnchor.constraint(equalTo: self.aboutUsView.heightAnchor, multiplier: 0.9),
            aboutUsLabel.rightAnchor.constraint(equalTo: self.aboutUsView.rightAnchor)
            ])
    }
    
    private func setupAboutUsViewConstraints(){
        NSLayoutConstraint.activate([
            aboutUsView.topAnchor.constraint(equalTo: self.shopOnlineView.bottomAnchor),
            aboutUsView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            aboutUsView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            aboutUsView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.1)
            ])
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.applyBottomBarAppTheme()
        addSubview(logoImageView)
        setupLogoImageViewConstraints()
        
        addSubview(productsView)
        setupProductsViewConstraints()
        
        addSubview(requestFreeSalesVisitView)
        setupRequestFreeSalesVisitViewConstraints()
        
        addSubview(visitShowroomView)
        setupvisitShowroomViewConstraints()
        
        addSubview(shopOnlineView)
        setupShopOnlineViewConstraints()
        
        addSubview(aboutUsView)
        setupAboutUsViewConstraints()
        
        productsView.addSubview(productsLabel)
        setupProductsLabelConstraints()
        
        addSubview(productsCategoriesLabel)
        setupProductsCategoriesLabelConstraints()
        
        requestFreeSalesVisitView.addSubview(requestFreeSalesVisitLabel)
        setupRequestFreeSalesVisitLabelConstraints()
        
        visitShowroomView.addSubview(visitShowroomLabel)
        setupvisitShowroomLabelConstraints()
        
        shopOnlineView.addSubview(shopOnlineLabel)
        setupShopOnlineLabelConstraints()
        
        aboutUsView.addSubview(aboutUsLabel)
        setupAboutUsLabelConstraints()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
