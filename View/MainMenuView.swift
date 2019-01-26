//
//  MainMenuView.swift
//  Magneta Sqquare
//
//  Created by Work on 1/17/19.
//  Copyright © 2019 TheMysteryPuzzles. All rights reserved.
//

import UIKit

class MainMenuView: UIView {

    var mainViewController: MainMenuViewController?
    
    
    var logoImageView: UIImageView = {
       let imageView = UIImageView(image: UIImage(named: "ic_logo"))
        imageView.contentMode = .scaleAspectFit
       imageView.backgroundColor = UIColor.clear

       imageView.translatesAutoresizingMaskIntoConstraints = false
      return imageView
    }()

    private func setupLogoImageViewConstraints(){
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: self.safeTopAnchor, constant: 5),
            logoImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            logoImageView.widthAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.2),
            logoImageView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.2)
            
            ])
    }
    
    lazy var productsLabel: UILabel = {
       let label = UILabel()
        label.text = "Products     ->"
        label.isUserInteractionEnabled = true
        label.textColor = UIColor.white
        label.layer.borderWidth = 1.5
        label.layer.borderColor = UIColor.white.cgColor
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 28)
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
        label.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(productsLabelTapped)))
      return label
    }()
    
    private func setupProductsLabelConstraints(){
        NSLayoutConstraint.activate([
            productsLabel.topAnchor.constraint(equalTo: self.logoImageView.bottomAnchor, constant: 5),
            productsLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            productsLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            productsLabel.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.05)
            
            ])
    }
    
    var productsCategoriesView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.clear
      return view
    }()
    
    private func setupProductsCategoriesViewConstraints(){
        NSLayoutConstraint.activate([
            productsCategoriesView.topAnchor.constraint(equalTo: self.productsLabel.bottomAnchor),
            productsCategoriesView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            productsCategoriesView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            productsCategoriesView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.35)
            
            ])
    }
    
    var windowCoveringsView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = UIColor.white
        view.layer.cornerRadius = 8
        view.image = UIImage(named: "ic_windowCoverings3")
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private func setupWindowCoveringsViewConstraints(){
        NSLayoutConstraint.activate([
            windowCoveringsView.leftAnchor.constraint(equalTo: self.productsCategoriesView.leftAnchor, constant: 2),
            windowCoveringsView.centerYAnchor.constraint(equalTo: self.productsCategoriesView.centerYAnchor),
            windowCoveringsView.widthAnchor.constraint(equalTo: self.productsCategoriesView.widthAnchor, multiplier: 0.49),
            windowCoveringsView.heightAnchor.constraint(equalTo: self.productsCategoriesView.heightAnchor, multiplier: 0.98)
            ])
    }
    
    var windowCoveringsLabel: UILabel = {
        let label = UILabel()
        label.text = "Window Coverings"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.adjustsFontSizeToFitWidth = true
        label.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private func setupWindowCoveringsLabelConstraints(){
        NSLayoutConstraint.activate([
            
            windowCoveringsLabel.centerXAnchor.constraint(equalTo: self.windowCoveringsView.centerXAnchor),
            windowCoveringsLabel.bottomAnchor.constraint(equalTo: self.windowCoveringsView.bottomAnchor),
            windowCoveringsLabel.leadingAnchor.constraint(equalTo: self.windowCoveringsView.leadingAnchor),
            windowCoveringsLabel.trailingAnchor.constraint(equalTo: self.windowCoveringsView.trailingAnchor)
            ])
    }
    
    
    var foldingDoorsView: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = 8
        view.image = UIImage(named: "ic_foldingDoors")
        view.layer.masksToBounds = true
        view.backgroundColor = UIColor.white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private func setupFoldingDoorsViewConstraints(){
        NSLayoutConstraint.activate([
            foldingDoorsView.rightAnchor.constraint(equalTo: self.productsCategoriesView.rightAnchor, constant: -2),
            foldingDoorsView.topAnchor.constraint(equalTo: self.windowCoveringsView.topAnchor),
            foldingDoorsView.widthAnchor.constraint(equalTo: self.productsCategoriesView.widthAnchor, multiplier: 0.49),
            foldingDoorsView.heightAnchor.constraint(equalTo: self.productsCategoriesView.heightAnchor, multiplier: 0.48)
            ])
    }
    
    var foldingDoorsLabel: UILabel = {
        let label = UILabel()
        label.text = "Folding Doors"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.adjustsFontSizeToFitWidth = true
        label.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private func setupFoldingDoorsLabelConstraints(){
        NSLayoutConstraint.activate([
            
            foldingDoorsLabel.centerXAnchor.constraint(equalTo: self.foldingDoorsView.centerXAnchor),
            foldingDoorsLabel.bottomAnchor.constraint(equalTo: self.foldingDoorsView.bottomAnchor),
            foldingDoorsLabel.leadingAnchor.constraint(equalTo: self.foldingDoorsView.leadingAnchor),
            foldingDoorsLabel.trailingAnchor.constraint(equalTo: self.foldingDoorsView.trailingAnchor)
            ])
    }
    
    var wirelessSecuritysView: UIImageView = {
        let view = UIImageView()
         view.image = UIImage(named: "ic_wirelessSecurity")
        view.layer.cornerRadius = 8
        view.layer.masksToBounds = true
        view.backgroundColor = UIColor.white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private func setupWirelessSecuritysViewConstraints(){
        NSLayoutConstraint.activate([
            wirelessSecuritysView.rightAnchor.constraint(equalTo: self.productsCategoriesView.rightAnchor, constant: -2),
            wirelessSecuritysView.bottomAnchor.constraint(equalTo: self.windowCoveringsView.bottomAnchor),
            wirelessSecuritysView.widthAnchor.constraint(equalTo: self.productsCategoriesView.widthAnchor, multiplier: 0.49),
            wirelessSecuritysView.heightAnchor.constraint(equalTo: self.productsCategoriesView.heightAnchor, multiplier: 0.48)
            ])
    }
    
    var wirelessSecurityLabel: UILabel = {
        let label = UILabel()
        label.text = "Wireless Security"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.adjustsFontSizeToFitWidth = true
        label.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private func setupWirelessSecurityLabelConstraints(){
        NSLayoutConstraint.activate([
            
            wirelessSecurityLabel.centerXAnchor.constraint(equalTo: self.wirelessSecuritysView.centerXAnchor),
            wirelessSecurityLabel.bottomAnchor.constraint(equalTo: self.wirelessSecuritysView.bottomAnchor),
            wirelessSecurityLabel.leadingAnchor.constraint(equalTo: self.wirelessSecuritysView.leadingAnchor),
            wirelessSecurityLabel.trailingAnchor.constraint(equalTo: self.wirelessSecuritysView.trailingAnchor)
            ])
    }
    
    
    var otherHomeOptionsContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.clear
        return view
    }()
    
    private func setupOtherHomeOptionsContainerViewConstraints(){
        NSLayoutConstraint.activate([
            otherHomeOptionsContainerView.topAnchor.constraint(equalTo: self.productsCategoriesView.bottomAnchor, constant: 5),
            otherHomeOptionsContainerView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            otherHomeOptionsContainerView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            otherHomeOptionsContainerView.bottomAnchor.constraint(equalTo: self.safeBottomAnchor)
            
            ])
    }
    
    var requestFreeSalesVisitImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "ic_salesPerson")
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = UIColor.clear
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private func setupRequestFreeSalesVisitImageViewConstraints(){
        NSLayoutConstraint.activate([
            requestFreeSalesVisitImageView.leftAnchor.constraint(equalTo: self.otherHomeOptionsContainerView.leftAnchor, constant: 2),
            requestFreeSalesVisitImageView.topAnchor.constraint(equalTo: self.otherHomeOptionsContainerView.topAnchor, constant: 2),
            requestFreeSalesVisitImageView.widthAnchor.constraint(equalTo: self.otherHomeOptionsContainerView.widthAnchor, multiplier: 0.49),
            requestFreeSalesVisitImageView.heightAnchor.constraint(equalTo: self.otherHomeOptionsContainerView.heightAnchor, multiplier: 0.48)
            
            ])
     }
    
    var visitShowRoomImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "ic_visitShowroom")
        imageView.backgroundColor = UIColor.clear
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private func setupVisitShowRoomImageViewConstraints(){
        NSLayoutConstraint.activate([
            visitShowRoomImageView.rightAnchor.constraint(equalTo: self.otherHomeOptionsContainerView.rightAnchor, constant: -2),
            visitShowRoomImageView.topAnchor.constraint(equalTo: self.otherHomeOptionsContainerView.topAnchor, constant: 2),
            visitShowRoomImageView.widthAnchor.constraint(equalTo: self.otherHomeOptionsContainerView.widthAnchor, multiplier: 0.49),
            visitShowRoomImageView.heightAnchor.constraint(equalTo: self.otherHomeOptionsContainerView.heightAnchor, multiplier: 0.48)
            
            ])
    }

    lazy var shopOnlineImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.isUserInteractionEnabled = true
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "ic_shopOnline")
        imageView.backgroundColor = UIColor.clear
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleShopOnlineTapped)))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private func setupShopOnlineImageViewConstraints(){
        NSLayoutConstraint.activate([
            shopOnlineImageView.leftAnchor.constraint(equalTo: self.otherHomeOptionsContainerView.leftAnchor, constant: 2),
            shopOnlineImageView.bottomAnchor.constraint(equalTo: self.otherHomeOptionsContainerView.bottomAnchor, constant: -2),
            shopOnlineImageView.widthAnchor.constraint(equalTo: self.otherHomeOptionsContainerView.widthAnchor, multiplier: 0.49),
            shopOnlineImageView.heightAnchor.constraint(equalTo: self.otherHomeOptionsContainerView.heightAnchor, multiplier: 0.48)
            
            ])
    }
    
    var aboutUsImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "ic_aboutUs")
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = UIColor.clear
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private func setupAboutUsImageViewConstraints(){
        NSLayoutConstraint.activate([
            aboutUsImageView.rightAnchor.constraint(equalTo: self.otherHomeOptionsContainerView.rightAnchor, constant: -2),
            aboutUsImageView.bottomAnchor.constraint(equalTo: self.otherHomeOptionsContainerView.bottomAnchor, constant: -2),
            aboutUsImageView.widthAnchor.constraint(equalTo: self.otherHomeOptionsContainerView.widthAnchor, multiplier: 0.49),
            aboutUsImageView.heightAnchor.constraint(equalTo: self.otherHomeOptionsContainerView.heightAnchor, multiplier: 0.48)
            
            ])
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //self.backgroundColor = hexStringToUIColor(hex: "#89fffd")
        self.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        self.applyBottomBarAppTheme()
        
        self.addSubview(logoImageView)
        setupLogoImageViewConstraints()
        
        self.addSubview(productsLabel)
        setupProductsLabelConstraints()
        
        self.addSubview(productsCategoriesView)
        setupProductsCategoriesViewConstraints()
        
        self.addSubview(otherHomeOptionsContainerView)
        setupOtherHomeOptionsContainerViewConstraints()
        
        self.productsCategoriesView.addSubview(windowCoveringsView)
        setupWindowCoveringsViewConstraints()
        
        self.productsCategoriesView.addSubview(foldingDoorsView)
        setupFoldingDoorsViewConstraints()
        
        self.productsCategoriesView.addSubview(wirelessSecuritysView)
        setupWirelessSecuritysViewConstraints()
        
        self.otherHomeOptionsContainerView.addSubview(requestFreeSalesVisitImageView)
        setupRequestFreeSalesVisitImageViewConstraints()
        
        self.otherHomeOptionsContainerView.addSubview(visitShowRoomImageView)
        setupVisitShowRoomImageViewConstraints()
        
        self.otherHomeOptionsContainerView.addSubview(shopOnlineImageView)
        setupShopOnlineImageViewConstraints()
        
        self.otherHomeOptionsContainerView.addSubview(aboutUsImageView)
        setupAboutUsImageViewConstraints()
        
        self.windowCoveringsView.addSubview(windowCoveringsLabel)
        setupWindowCoveringsLabelConstraints()
        
        self.foldingDoorsView.addSubview(foldingDoorsLabel)
        setupFoldingDoorsLabelConstraints()
        
        self.wirelessSecuritysView.addSubview(wirelessSecurityLabel)
        setupWirelessSecurityLabelConstraints()
    }
    
    
    @objc private func handleShopOnlineTapped(){
         self.mainViewController?.handleShopOnlineTab()
    }
    
    
    @objc private func productsLabelTapped(){
        print("Tapped")
        self.mainViewController?.handleProductsTab()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
