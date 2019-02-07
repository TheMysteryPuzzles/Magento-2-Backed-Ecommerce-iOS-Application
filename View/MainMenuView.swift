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
        imageView.layer.masksToBounds = true
        imageView.backgroundColor = UIColor.clear
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private func setupLogoImageViewConstraints(){
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: self.safeTopAnchor, constant: 5),
            logoImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            logoImageView.widthAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.3),
            logoImageView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.15)
            
            ])
    }
    
    lazy var productsLabelView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
   func setupProductsLabelViewConstraints(){
        NSLayoutConstraint.activate([
            productsLabelView.topAnchor.constraint(equalTo: self.safeTopAnchor, constant: 15),
            productsLabelView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            productsLabelView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            productsLabelView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.05)
            
            ])
    }
    
    
    
    lazy var productsLabel: UILabel = {
       let label = UILabel()
        label.text = "Our Products"
        label.isUserInteractionEnabled = true
        label.textColor = hexStringToUIColor(hex: "#333333")
      //  label.layer.borderWidth = 1.5
      //  label.layer.borderColor = UIColor.white.cgColor
        label.textAlignment = .center
        label.font = UIFont(name: "BillaBong", size: 32)
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
       // label.backgroundColor = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
        label.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(productsLabelTapped)))
      return label
    }()
    
    private func setupProductsLabelConstraints(){
        NSLayoutConstraint.activate([
            productsLabel.topAnchor.constraint(equalTo: self.productsLabelView.topAnchor),
            productsLabel.leadingAnchor.constraint(equalTo: self.productsLabelView.leadingAnchor),
            productsLabel.trailingAnchor.constraint(equalTo: self.productsLabelView.trailingAnchor),
            productsLabel.heightAnchor.constraint(equalTo: self.productsLabelView.heightAnchor)
            
            ])
    }
    
    var viewAllProductsButton: UIButton = {
        let button = UIButton()
        button.setTitle("View All->", for: .normal)
        button.setTitleColor(#colorLiteral(red: 0.4392156899, green: 0.01176470611, blue: 0.1921568662, alpha: 1), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private func setupViewAllProductsButtonConstraints(){
        NSLayoutConstraint.activate([
            viewAllProductsButton.topAnchor.constraint(equalTo: self.productsLabel.topAnchor),
            viewAllProductsButton.rightAnchor.constraint(equalTo: self.productsLabel.rightAnchor, constant: -5),
            viewAllProductsButton.widthAnchor.constraint(equalTo: self.productsLabel.widthAnchor, multiplier: 0.3),
            viewAllProductsButton.heightAnchor.constraint(equalTo: self.productsLabel.heightAnchor)
            
            ])
    }
    
    var productsCategoriesView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0.9489166141, green: 0.9490789771, blue: 0.9489063621, alpha: 1)
      return view
    }()
    
    private func setupProductsCategoriesViewConstraints(){
        NSLayoutConstraint.activate([
            productsCategoriesView.topAnchor.constraint(equalTo: self.productsLabel.bottomAnchor),
            productsCategoriesView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            productsCategoriesView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
            productsCategoriesView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.55)
            ])
    }
    
    var windowCoveringsView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = UIColor.white
        view.image = UIImage(named: "ic_WindowCoverings3")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private func setupWindowCoveringsViewConstraints(){
        NSLayoutConstraint.activate([
            windowCoveringsView.leadingAnchor.constraint(equalTo: self.productsCategoriesView.leadingAnchor),
            windowCoveringsView.topAnchor.constraint(equalTo: self.productsCategoriesView.topAnchor),
            windowCoveringsView.trailingAnchor.constraint(equalTo: self.productsCategoriesView.trailingAnchor),
            windowCoveringsView.heightAnchor.constraint(equalTo: self.productsCategoriesView.heightAnchor, multiplier: 0.49)
            ])
    }
    
    lazy var windowCoveringsLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.adjustsFontSizeToFitWidth = true
        label.backgroundColor = hexStringToUIColor(hex: "#B066FE")
        label.textColor = UIColor.white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private func setupWindowCoveringsLabelConstraints(){
        NSLayoutConstraint.activate([
            
            windowCoveringsLabel.bottomAnchor.constraint(equalTo: self.windowCoveringsView.bottomAnchor),
            windowCoveringsLabel.heightAnchor.constraint(equalTo: self.windowCoveringsView.heightAnchor, multiplier: 0.15),
            windowCoveringsLabel.leadingAnchor.constraint(equalTo: self.windowCoveringsView.leadingAnchor),
            windowCoveringsLabel.trailingAnchor.constraint(equalTo: self.windowCoveringsView.trailingAnchor)
            ])
    }
    
    
    var foldingDoorsView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "ic_foldingDoors")
        view.backgroundColor = UIColor.white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private func setupFoldingDoorsViewConstraints(){
        NSLayoutConstraint.activate([
            foldingDoorsView.leftAnchor.constraint(equalTo: self.productsCategoriesView.leftAnchor),
            foldingDoorsView.topAnchor.constraint(equalTo: self.windowCoveringsView.bottomAnchor),
            foldingDoorsView.widthAnchor.constraint(equalTo: self.productsCategoriesView.widthAnchor, multiplier: 0.5),
            foldingDoorsView.bottomAnchor.constraint(equalTo: self.productsCategoriesView.bottomAnchor)
            ])
    }
    
    lazy var foldingDoorsLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.adjustsFontSizeToFitWidth = true
       // label.backgroundColor = hexStringToUIColor(hex: "#63E2FF")
        label.backgroundColor = hexStringToUIColor(hex: "#B066FE")
        label.textColor = UIColor.white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private func setupFoldingDoorsLabelConstraints(){
        NSLayoutConstraint.activate([
            
            foldingDoorsLabel.heightAnchor.constraint(equalTo: self.foldingDoorsView.heightAnchor, multiplier: 0.15),
            foldingDoorsLabel.bottomAnchor.constraint(equalTo: self.foldingDoorsView.bottomAnchor),
            foldingDoorsLabel.leadingAnchor.constraint(equalTo: self.foldingDoorsView.leadingAnchor),
            foldingDoorsLabel.trailingAnchor.constraint(equalTo: self.foldingDoorsView.trailingAnchor, constant: -1)
            ])
    }
    
    var wirelessSecuritysView: UIImageView = {
        let view = UIImageView()
         view.image = UIImage(named: "ic_wirelessSecurity")
        view.backgroundColor = UIColor.white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private func setupWirelessSecuritysViewConstraints(){
        NSLayoutConstraint.activate([
            wirelessSecuritysView.leftAnchor.constraint(equalTo: self.foldingDoorsView.rightAnchor),
            wirelessSecuritysView.topAnchor.constraint(equalTo: self.windowCoveringsView.bottomAnchor),
            wirelessSecuritysView.widthAnchor.constraint(equalTo: self.productsCategoriesView.widthAnchor, multiplier: 0.5),
            wirelessSecuritysView.bottomAnchor.constraint(equalTo: self.productsCategoriesView.bottomAnchor)
            ])
        }
    
    lazy var wirelessSecurityLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.adjustsFontSizeToFitWidth = true
        label.textColor = UIColor.white
        label.backgroundColor = hexStringToUIColor(hex: "#B066FE")
       // label.backgroundColor = hexStringToUIColor(hex: "#63E2FF")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private func setupWirelessSecurityLabelConstraints(){
        NSLayoutConstraint.activate([
            
            wirelessSecurityLabel.heightAnchor.constraint(equalTo: self.wirelessSecuritysView.heightAnchor, multiplier: 0.15),
            wirelessSecurityLabel.bottomAnchor.constraint(equalTo: self.wirelessSecuritysView.bottomAnchor),
            wirelessSecurityLabel.leadingAnchor.constraint(equalTo: self.wirelessSecuritysView.leadingAnchor, constant: 1),
            wirelessSecurityLabel.trailingAnchor.constraint(equalTo: self.wirelessSecuritysView.trailingAnchor)
            ])
      }
    
    
    var otherHomeOptionsContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.black.withAlphaComponent(0.05)
        view.isOpaque = false
        return view
    }()
    
    private func setupOtherHomeOptionsContainerViewConstraints(){
        NSLayoutConstraint.activate([
            otherHomeOptionsContainerView.topAnchor.constraint(equalTo: self.productsCategoriesView.bottomAnchor, constant: 5),
            otherHomeOptionsContainerView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            otherHomeOptionsContainerView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            otherHomeOptionsContainerView.bottomAnchor.constraint(equalTo: self.safeBottomAnchor, constant: -5)
            
            ])
        }
    
    var requestFreeSalesVisitView: UIView = {
       let view = UIView()
        view.layer.cornerRadius = 6
        view.layer.masksToBounds = true
      //  imageView.image = UIImage(named: "ic_salesPerson")
       // imageView.contentMode = .scaleAspectFit
        view.backgroundColor = UIColor.red
        view.translatesAutoresizingMaskIntoConstraints = false
      //  imageView.layer.shadowColor = UIColor.gray.cgColor
     //   imageView.layer.shadowOpacity = 1
       // imageView.layer.shadowOffset = CGSize.zero
       // imageView.layer.shadowRadius = 6
        return view
    }()
    
    lazy var requestFreeSalesVisitImageView: UIImageView = {
        let imageView = UIImageView()
          imageView.image = UIImage(named: "ic_salesPerson")
          imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    public func setuprequestFreeSalesVisitImageViewConstraints(){
        NSLayoutConstraint.activate([
            requestFreeSalesVisitImageView.topAnchor.constraint(equalTo: self.requestFreeSalesVisitView.topAnchor, constant: 5),
            requestFreeSalesVisitImageView.leadingAnchor.constraint(equalTo: self.requestFreeSalesVisitView.leadingAnchor),
            requestFreeSalesVisitImageView.trailingAnchor.constraint(equalTo: self.requestFreeSalesVisitView.trailingAnchor),
            requestFreeSalesVisitImageView.heightAnchor.constraint(equalTo: self.requestFreeSalesVisitView.heightAnchor, multiplier: 0.7),
            ])
    }
    
    private func setupRequestFreeSalesVisitViewConstraints(){
        NSLayoutConstraint.activate([
            requestFreeSalesVisitView.rightAnchor.constraint(equalTo: self.otherHomeOptionsContainerView.rightAnchor, constant: -5),
            requestFreeSalesVisitView.topAnchor.constraint(equalTo: self.otherHomeOptionsContainerView.topAnchor, constant: 5),
            requestFreeSalesVisitView.widthAnchor.constraint(equalTo: self.otherHomeOptionsContainerView.widthAnchor, multiplier: 0.48),
            requestFreeSalesVisitView.heightAnchor.constraint(equalTo: self.otherHomeOptionsContainerView.heightAnchor, multiplier: 0.48)
            
            ])
        }
    
    lazy var requestFreeSalesVisitLabel: UILabel = {
       let label = UILabel()
        label.text = "Request FREE Sales Visit"
        label.textColor = UIColor.white
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    public func setupRequestFreeSalesVisitLabelConstraints(){
        NSLayoutConstraint.activate([
            requestFreeSalesVisitLabel.topAnchor.constraint(equalTo: self.requestFreeSalesVisitImageView.bottomAnchor),
            requestFreeSalesVisitLabel.leadingAnchor.constraint(equalTo: self.requestFreeSalesVisitView.leadingAnchor),
            requestFreeSalesVisitLabel.trailingAnchor.constraint(equalTo: self.requestFreeSalesVisitView.trailingAnchor),
            requestFreeSalesVisitLabel.heightAnchor.constraint(equalTo: self.requestFreeSalesVisitView.heightAnchor, multiplier: 0.3),
            
            ])
    }
    
    var visitShowRoomView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 6
        view.layer.masksToBounds = true
        view.contentMode = .scaleAspectFit
      //  imageView.image = UIImage(named: "ic_visitShowroom")
        view.backgroundColor = UIColor.purple
      /*  imageView.layer.shadowColor = UIColor.gray.cgColor
        imageView.layer.shadowOpacity = 1
        imageView.layer.shadowOffset = CGSize.zero
        imageView.layer.shadowRadius = 6*/
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private func setupVisitShowRoomViewConstraints(){
        NSLayoutConstraint.activate([
            visitShowRoomView.leftAnchor.constraint(equalTo: self.otherHomeOptionsContainerView.leftAnchor, constant: 5),
            visitShowRoomView.topAnchor.constraint(equalTo: self.shopOnlineView.bottomAnchor, constant: 5),
            visitShowRoomView.widthAnchor.constraint(equalTo: self.otherHomeOptionsContainerView.widthAnchor, multiplier: 0.48),
            visitShowRoomView.heightAnchor.constraint(equalTo: self.otherHomeOptionsContainerView.heightAnchor, multiplier: 0.48)
            
            ])
        }

    var visitShowRoomImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "ic_visitShowroom")
        imageView.backgroundColor = UIColor.clear
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    public func setupVisitShowRoomImageViewConstraints(){
        NSLayoutConstraint.activate([
            visitShowRoomImageView.topAnchor.constraint(equalTo: self.visitShowRoomView.topAnchor, constant: 5),
            visitShowRoomImageView.leadingAnchor.constraint(equalTo: self.visitShowRoomView.leadingAnchor),
            visitShowRoomImageView.trailingAnchor.constraint(equalTo: self.visitShowRoomView.trailingAnchor),
            visitShowRoomImageView.heightAnchor.constraint(equalTo: self.visitShowRoomView.heightAnchor, multiplier: 0.7)
            ])
    }
    
    lazy var visitShowroomLabel: UILabel = {
       let label = UILabel()
        label.text = "Visit Showroom"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.white
        return label
    }()
    
    func setupVisitShowroomLabelConstraints(){
        NSLayoutConstraint.activate([
            visitShowroomLabel.topAnchor.constraint(equalTo: self.visitShowRoomImageView.bottomAnchor),
            visitShowroomLabel.leadingAnchor.constraint(equalTo: self.visitShowRoomView.leadingAnchor),
            visitShowroomLabel.trailingAnchor.constraint(equalTo: self.visitShowRoomView.trailingAnchor),
            visitShowroomLabel.heightAnchor.constraint(equalTo: self.visitShowRoomView.heightAnchor, multiplier: 0.3)
            
            ])
    }


    lazy var shopOnlineView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 6
        view.layer.masksToBounds = true
        view.contentMode = .scaleAspectFit
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleShopOnlineTapped)))
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private func setupShopOnlineViewConstraints(){
        NSLayoutConstraint.activate([
            shopOnlineView.leftAnchor.constraint(equalTo: self.otherHomeOptionsContainerView.leftAnchor, constant: 5),
            shopOnlineView.topAnchor.constraint(equalTo: self.otherHomeOptionsContainerView.topAnchor, constant: 5),
            shopOnlineView.widthAnchor.constraint(equalTo: self.otherHomeOptionsContainerView.widthAnchor, multiplier: 0.48),
            shopOnlineView.heightAnchor.constraint(equalTo: self.otherHomeOptionsContainerView.heightAnchor, multiplier: 0.48)
            
            ])
        }
    
     var shopOnlineImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.masksToBounds = true
        imageView.isUserInteractionEnabled = true
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = UIColor.clear
        
       imageView.image = UIImage(named: "ic_shopOnline")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    public func setupShopOnlineImageViewConstraints(){
        NSLayoutConstraint.activate([
            shopOnlineImageView.topAnchor.constraint(equalTo: self.shopOnlineView.topAnchor, constant: 5),
            shopOnlineImageView.leadingAnchor.constraint(equalTo: self.shopOnlineView.leadingAnchor),
            shopOnlineImageView.trailingAnchor.constraint(equalTo: self.shopOnlineView.trailingAnchor),
            shopOnlineImageView.heightAnchor.constraint(equalTo: self.shopOnlineView.heightAnchor, multiplier: 0.7)
            ])
    }
    
    lazy var shopOnlineLabel: UILabel = {
       let label = UILabel()
        label.textColor = UIColor.white
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Shop Online"
       return label
    }()
    
    func setupShopOnlineLabelConstraints(){
        NSLayoutConstraint.activate([
            shopOnlineLabel.topAnchor.constraint(equalTo: self.shopOnlineImageView.bottomAnchor),
            shopOnlineLabel.leadingAnchor.constraint(equalTo: self.shopOnlineView.leadingAnchor),
            shopOnlineLabel.trailingAnchor.constraint(equalTo: self.shopOnlineView.trailingAnchor),
            shopOnlineLabel.heightAnchor.constraint(equalTo: self.shopOnlineView.heightAnchor, multiplier: 0.3)
            
            ])
    }
    
    
    lazy var aboutUsView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 6
        view.layer.masksToBounds = true
        view.backgroundColor = UIColor.green
       // imageView.image = UIImage(named: "ic_aboutUs")
        view.contentMode = .scaleAspectFit
        /* imageView.layer.shadowColor = UIColor.gray.cgColor
         imageView.layer.shadowOpacity = 1
         imageView.layer.shadowOffset = CGSize.zero
         imageView.layer.shadowRadius = 6
         imageView.backgroundColor = UIColor.clear*/
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    private func setupAboutUsViewConstraints(){
        NSLayoutConstraint.activate([
            aboutUsView.rightAnchor.constraint(equalTo: self.otherHomeOptionsContainerView.rightAnchor, constant: -5),
            aboutUsView.topAnchor.constraint(equalTo: self.requestFreeSalesVisitView.bottomAnchor ,constant: 5),
            aboutUsView.widthAnchor.constraint(equalTo: self.otherHomeOptionsContainerView.widthAnchor, multiplier: 0.48),
            aboutUsView.heightAnchor.constraint(equalTo: self.otherHomeOptionsContainerView.heightAnchor, multiplier: 0.48)
            
            ])
    }
    
    lazy var aboutUsImageView: UIImageView = {
       let imageView = UIImageView()
       imageView.image = UIImage(named: "ic_aboutUs")
       imageView.contentMode = .scaleAspectFit
       imageView.translatesAutoresizingMaskIntoConstraints = false
        //imageView.backgroundColor = UIColor.red
        return imageView
    }()
    
    public func setupAboutUsImageViewConstraints(){
        NSLayoutConstraint.activate([
            aboutUsImageView.topAnchor.constraint(equalTo: self.aboutUsView.topAnchor, constant: 5),
            aboutUsImageView.leadingAnchor.constraint(equalTo: self.aboutUsView.leadingAnchor),
            aboutUsImageView.trailingAnchor.constraint(equalTo: self.aboutUsView.trailingAnchor),
            aboutUsImageView.heightAnchor.constraint(equalTo: self.aboutUsView.heightAnchor, multiplier: 0.7)
            
            ])
    }
    
    lazy var aboutUsLabel: UILabel = {
       let label = UILabel()
        label.text = "About Us"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.adjustsFontSizeToFitWidth = true
        label.textColor = UIColor.white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func setupAboutUsLabelConstraints(){
        NSLayoutConstraint.activate([
            aboutUsLabel.topAnchor.constraint(equalTo: self.aboutUsImageView.bottomAnchor),
            aboutUsLabel.leadingAnchor.constraint(equalTo: self.aboutUsView.leadingAnchor),
            aboutUsLabel.trailingAnchor.constraint(equalTo: self.aboutUsView.trailingAnchor),
            aboutUsLabel.heightAnchor.constraint(equalTo: self.aboutUsView.heightAnchor, multiplier: 0.3)
            
            ])
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //self.backgroundColor = hexStringToUIColor(hex: "#89fffd")
       // self.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
       // self.applyBottomBarAppTheme()
        
       // self.addSubview(logoImageView)
      //  setupLogoImageViewConstraints()
        
        self.addSubview(productsLabelView)
        setupProductsLabelViewConstraints()
        
        self.productsLabelView.addSubview(productsLabel)
        setupProductsLabelConstraints()
        
       // self.productsLabel.addSubview(viewAllProductsButton)
       // setupViewAllProductsButtonConstraints()
        
        self.addSubview(productsCategoriesView)
        setupProductsCategoriesViewConstraints()
        
        self.addSubview(otherHomeOptionsContainerView)
        setupOtherHomeOptionsContainerViewConstraints()
        //self.otherHomeOptionsContainerView.Hide()
    
        
        
        self.productsCategoriesView.addSubview(windowCoveringsView)
        setupWindowCoveringsViewConstraints()
        
        self.productsCategoriesView.addSubview(foldingDoorsView)
        setupFoldingDoorsViewConstraints()
    
       self.productsCategoriesView.addSubview(wirelessSecuritysView)
      setupWirelessSecuritysViewConstraints()
        
        self.otherHomeOptionsContainerView.addSubview(requestFreeSalesVisitView)
        setupRequestFreeSalesVisitViewConstraints()
        
       
        
        self.otherHomeOptionsContainerView.addSubview(shopOnlineView)
        setupShopOnlineViewConstraints()
        
        self.otherHomeOptionsContainerView.addSubview(visitShowRoomView)
        setupVisitShowRoomViewConstraints()
        
        self.otherHomeOptionsContainerView.addSubview(aboutUsView)
        setupAboutUsViewConstraints()
        
        
       // self.aboutUsView.addSubview(aboutUsImageView)
     //   self.setupAboutUsImageViewConstraints()
        
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
