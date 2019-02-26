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
    var sloganCurrentIndex: Int = 0
    var slogans = [String]()
    
    lazy var logoImageView: UIImageView = {
       let imageView = UIImageView(image: UIImage(named: "ic_logo"))
        imageView.contentMode = .scaleAspectFit
        imageView.layer.masksToBounds = true
        imageView.layer.masksToBounds = true
        imageView.backgroundColor = UIColor.clear
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private func setupLogoImageViewConstraints(){
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: self.safeTopAnchor, constant: 5),
            logoImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 5),
            logoImageView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.22),
            logoImageView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.1)
            
            ])
    }
    
    lazy var magentaSquareLabel: UILabel = {
        let label = UILabel()
        label.text = "MAGENTA SQUARE"
        label.textAlignment = .center
        label.font = UIFont(name: "Cochin-Bold", size: 32)
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = UIColor.clear
        return label
    }()
    
    private func setupSetupMagentaSquareLabelConstraints(){
        NSLayoutConstraint.activate([
            magentaSquareLabel.topAnchor.constraint(equalTo: self.logoImageView.topAnchor),
            magentaSquareLabel.leadingAnchor.constraint(equalTo: self.logoImageView.trailingAnchor, constant: 5),
            magentaSquareLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
            magentaSquareLabel.heightAnchor.constraint(equalTo: self.logoImageView.heightAnchor, multiplier: 0.45)
        ])
    }
    
    lazy var sloganLabel: PaddingLabel = {
        let label = PaddingLabel()
        label.leftInset = 5
        label.rightInset = 5
        label.topInset = 0
        label.bottomInset = 0
        label.text = "Welcome!"
        label.numberOfLines = 0
        label.textColor = UIColor.white
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.backgroundColor = hexStringToUIColor(hex: "#B066FE")
        label.translatesAutoresizingMaskIntoConstraints = false
        let slogan = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(runTimedCode), userInfo: nil, repeats: true)
        return label
    }()
    
    @objc private func runTimedCode(){
        self.sloganLabel.slideInFromLeft()
        
        if sloganCurrentIndex >= slogans.count - 1{
            sloganCurrentIndex = 0
        }else{
            sloganCurrentIndex += 1
        }
        if sloganCurrentIndex <= slogans.count - 1 {
            self.sloganLabel.text = self.slogans[sloganCurrentIndex]
        }
    }
    
    private func setupSloganLabelConstraints(){
       NSLayoutConstraint.activate([
        sloganLabel.bottomAnchor.constraint(equalTo: self.logoImageView.bottomAnchor),
        sloganLabel.leadingAnchor.constraint(equalTo: self.logoImageView.trailingAnchor, constant: 5),
        sloganLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
        sloganLabel.topAnchor.constraint(equalTo: self.magentaSquareLabel.bottomAnchor, constant: 5)
      ])
    }
    
    
    
    
    lazy var productsLabelView: UIView = {
       let view = UIView()
        view.isUserInteractionEnabled = true
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(productsLabelTapped)))
        view.backgroundColor = UIColor.clear
       // view.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 2)
        
        return view
    }()
    
   func setupProductsLabelViewConstraints(){
    
    if isDeviceIPad {
        productsLabelView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.6).isActive = true
    }else{
          productsLabelView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.45).isActive = true
    }
        NSLayoutConstraint.activate([
            productsLabelView.topAnchor.constraint(equalTo: self.logoImageView.bottomAnchor, constant: 5),
            productsLabelView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 5),
            productsLabelView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.1)
            
            ])
    }
        
    lazy var productsLabel: UILabel = {
       let label = UILabel()
        //label.inset
        label.text = "PRODUCTS"
        label.numberOfLines = 0
        label.isUserInteractionEnabled = true
        label.textColor = UIColor.white
      //  label.layer.borderWidth = 1.5
      //  label.layer.borderColor = UIColor.white.cgColor
        label.textAlignment = .center
        if isDeviceIPad {
              label.lineBreakMode = .byCharWrapping
             label.font = UIFont.boldSystemFont(ofSize: 72)
        }else{
            label.font = UIFont.boldSystemFont(ofSize: 38)
              label.lineBreakMode = .byClipping
        }
       // label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = #colorLiteral(red: 0.5626288056, green: 0.4406049252, blue: 0.6889387965, alpha: 1)
        label.minimumScaleFactor = 0.1    //or whatever suits your need
        label.adjustsFontSizeToFitWidth = true
       // label.linesp
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
            productsCategoriesView.topAnchor.constraint(equalTo: self.sloganLabel.bottomAnchor, constant: 5),
            productsCategoriesView.leadingAnchor.constraint(equalTo: self.productsLabelView.trailingAnchor, constant: 5),
            productsCategoriesView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
            productsCategoriesView.heightAnchor.constraint(equalTo: self.productsLabelView.heightAnchor)
            ])
    }
    
    lazy var windowCoveringsView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = UIColor.white
        view.isUserInteractionEnabled = true
        view.image = UIImage(named: "ic_WindowCoverings3")
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleWindowCoveringsSelected)))
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    @objc  private func handleWindowCoveringsSelected(){
        self.mainViewController?.handleWindowCoveringsSelected()
    }
    
    private func setupWindowCoveringsViewConstraints(){
        NSLayoutConstraint.activate([
            windowCoveringsView.leadingAnchor.constraint(equalTo: self.productsCategoriesView.leadingAnchor),
            windowCoveringsView.topAnchor.constraint(equalTo: self.productsCategoriesView.topAnchor),
            windowCoveringsView.widthAnchor.constraint(equalTo: self.productsCategoriesView.widthAnchor, multiplier: 0.4),
            windowCoveringsView.heightAnchor.constraint(equalTo: self.productsCategoriesView.heightAnchor, multiplier: 0.33)
            ])
    }
    
    lazy var windowCoveringsLabel: PaddingLabel = {
        let label = PaddingLabel()
        label.topInset = 20
        label.bottomInset = 10
        label.text = ""
        label.textAlignment = .center
        label.numberOfLines = 0
        //label.lineBreakMode = .byWordWrapping
        label.font = UIFont(name: "DIN Condensed", size: 72)
        label.adjustsFontSizeToFitWidth = true
        label.backgroundColor = #colorLiteral(red: 0.4703475833, green: 0.2535249591, blue: 0.4185587764, alpha: 1)
        label.textColor = UIColor.white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private func setupWindowCoveringsLabelConstraints(){
        NSLayoutConstraint.activate([
            
            windowCoveringsLabel.topAnchor.constraint(equalTo: self.windowCoveringsView.topAnchor),
            windowCoveringsLabel.heightAnchor.constraint(equalTo: self.windowCoveringsView.heightAnchor),
            windowCoveringsLabel.leadingAnchor.constraint(equalTo: self.windowCoveringsView.trailingAnchor),
            windowCoveringsLabel.trailingAnchor.constraint(equalTo: self.productsCategoriesView.trailingAnchor)
            ])
    }
    
    
    lazy var foldingDoorsView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "ic_foldingDoors")
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleFoldingDoorsSelected)))
          view.isUserInteractionEnabled = true
        view.backgroundColor = UIColor.white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    @objc private func handleFoldingDoorsSelected(){
        self.mainViewController?.handleFoldingDoorsSelected()
    }
    
    private func setupFoldingDoorsViewConstraints(){
        NSLayoutConstraint.activate([
            foldingDoorsView.leftAnchor.constraint(equalTo: self.productsCategoriesView.leftAnchor),
            foldingDoorsView.topAnchor.constraint(equalTo: self.windowCoveringsView.bottomAnchor, constant: 5),
            foldingDoorsView.widthAnchor.constraint(equalTo: self.productsCategoriesView.widthAnchor, multiplier: 0.4),
            foldingDoorsView.heightAnchor.constraint(equalTo: self.productsCategoriesView.heightAnchor, multiplier: 0.33)
            ])
    }
    
    lazy var foldingDoorsLabel: PaddingLabel = {
        let label = PaddingLabel()
        label.text = ""
        label.topInset = 20
        label.bottomInset = 10
        label.textAlignment = .center
        label.numberOfLines = 0
       // label.lineBreakMode = .byWordWrapping
        label.font = UIFont(name: "DIN Condensed", size: 72)
        label.adjustsFontSizeToFitWidth = true
       // label.backgroundColor = hexStringToUIColor(hex: "#63E2FF")
        label.backgroundColor = #colorLiteral(red: 0.364770174, green: 0.07211238891, blue: 0.2606086731, alpha: 1)
        label.textColor = UIColor.white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private func setupFoldingDoorsLabelConstraints(){
        NSLayoutConstraint.activate([
            
            foldingDoorsLabel.topAnchor.constraint(equalTo: self.foldingDoorsView.topAnchor),
            foldingDoorsLabel.bottomAnchor.constraint(equalTo: self.foldingDoorsView.bottomAnchor),
            foldingDoorsLabel.leadingAnchor.constraint(equalTo: self.foldingDoorsView.trailingAnchor),
            foldingDoorsLabel.trailingAnchor.constraint(equalTo: self.productsCategoriesView.trailingAnchor)
            ])
    }
    
    lazy var wirelessSecuritysView: UIImageView = {
        let view = UIImageView()
          view.isUserInteractionEnabled = true
         view.image = UIImage(named: "ic_wirelessSecurity")
        view.backgroundColor = UIColor.white
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleWirelessSecuritySelected)))
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    @objc private func handleWirelessSecuritySelected(){
    self.mainViewController?.handleWirelesSecuritySelected()
    }
    
    private func setupWirelessSecuritysViewConstraints(){
        NSLayoutConstraint.activate([
            wirelessSecuritysView.leftAnchor.constraint(equalTo: self.productsCategoriesView.leftAnchor),
            wirelessSecuritysView.topAnchor.constraint(equalTo: self.foldingDoorsView.bottomAnchor, constant: 5),
            wirelessSecuritysView.widthAnchor.constraint(equalTo: self.productsCategoriesView.widthAnchor, multiplier: 0.4),
            wirelessSecuritysView.bottomAnchor.constraint(equalTo: self.productsCategoriesView.bottomAnchor)
            ])
        }
    
    lazy var wirelessSecurityLabel: PaddingLabel = {
        let label = PaddingLabel()
        label.text = ""
        label.topInset = 20
        label.bottomInset = 10
        label.textAlignment = .center
        label.numberOfLines = 0
        //label.lineBreakMode = .byWordWrapping
        label.font = UIFont(name: "DIN Condensed", size: 72)
        label.adjustsFontSizeToFitWidth = true
        label.textColor = UIColor.white
        label.backgroundColor = #colorLiteral(red: 0.70550102, green: 0.1076406315, blue: 0.5133620501, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private func setupWirelessSecurityLabelConstraints(){
        NSLayoutConstraint.activate([
            
            wirelessSecurityLabel.topAnchor.constraint(equalTo: self.wirelessSecuritysView.topAnchor),
            wirelessSecurityLabel.bottomAnchor.constraint(equalTo: self.wirelessSecuritysView.bottomAnchor),
            wirelessSecurityLabel.leadingAnchor.constraint(equalTo: self.wirelessSecuritysView.trailingAnchor),
            wirelessSecurityLabel.trailingAnchor.constraint(equalTo: self.productsCategoriesView.trailingAnchor)
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
    
    lazy var requestFreeSalesVisitView: UIView = {
       let view = UIView()
        view.layer.masksToBounds = true
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleRequestSalesVisit)))
        view.backgroundColor = UIColor.red
        view.isUserInteractionEnabled = true
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0.419416666, green: 0.423350811, blue: 0.4357591569, alpha: 1)
        return view
    }()
    
    @objc func handleRequestSalesVisit(){
        mainViewController?.handleRequestSalesVisit()
    }
    
    lazy var requestFreeSalesVisitImageView: UIImageView = {
        let imageView = UIImageView()
          imageView.image = UIImage(named: "ic_salesPerson")
          imageView.contentMode = .scaleAspectFit
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    public func setuprequestFreeSalesVisitImageViewConstraints(){
        NSLayoutConstraint.activate([
            requestFreeSalesVisitImageView.topAnchor.constraint(equalTo: self.requestFreeSalesVisitView.topAnchor, constant: 5),
            requestFreeSalesVisitImageView.leadingAnchor.constraint(equalTo: self.requestFreeSalesVisitLabel.trailingAnchor, constant: 5),
            requestFreeSalesVisitImageView.trailingAnchor.constraint(equalTo: self.requestFreeSalesVisitView.trailingAnchor, constant: -5),
            requestFreeSalesVisitImageView.bottomAnchor.constraint(equalTo: self.requestFreeSalesVisitView.bottomAnchor, constant: -5)
            ])
    }
    
    private func setupRequestFreeSalesVisitViewConstraints(){
        NSLayoutConstraint.activate([
            requestFreeSalesVisitView.leadingAnchor.constraint(equalTo: self.otherHomeOptionsContainerView.leadingAnchor, constant: 5),
            requestFreeSalesVisitView.topAnchor.constraint(equalTo: self.shopOnlineView.bottomAnchor, constant: 5),
            requestFreeSalesVisitView.trailingAnchor.constraint(equalTo: self.otherHomeOptionsContainerView.trailingAnchor, constant: -5),
            requestFreeSalesVisitView.heightAnchor.constraint(equalTo: self.otherHomeOptionsContainerView.heightAnchor, multiplier: 0.36)
            
            ])
        }
    
    lazy var requestFreeSalesVisitLabel: UILabel = {
       let label = UILabel()
      
        let formattedString = NSMutableAttributedString()
        formattedString
            .normal("Schedule ")
            .bold("FREE")
            .normal(" Sales Visit ")
            .normal("With Samples")
        label.attributedText = formattedString
        label.textColor = UIColor.white
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont(name: "Times New Roman", size: 42)
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    public func setupRequestFreeSalesVisitLabelConstraints(){
        NSLayoutConstraint.activate([
            requestFreeSalesVisitLabel.topAnchor.constraint(equalTo: self.requestFreeSalesVisitView.topAnchor, constant: 5),
            requestFreeSalesVisitLabel.leadingAnchor.constraint(equalTo: self.requestFreeSalesVisitView.leadingAnchor, constant: 5),
            requestFreeSalesVisitLabel.widthAnchor.constraint(equalTo: self.requestFreeSalesVisitView.widthAnchor, multiplier: 0.6),
            requestFreeSalesVisitLabel.heightAnchor.constraint(equalTo: self.requestFreeSalesVisitView.heightAnchor, multiplier: 0.98),
            
            ])
    }
    
    lazy var visitShowRoomView: UIView = {
        let view = UIView()
        view.isUserInteractionEnabled = true
        view.layer.masksToBounds = true
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleVisitShowRoomViewSelected)))
        view.contentMode = .scaleAspectFit
        view.backgroundColor = #colorLiteral(red: 0.419416666, green: 0.423350811, blue: 0.4357591569, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private func setupVisitShowRoomViewConstraints(){
        NSLayoutConstraint.activate([
            visitShowRoomView.leftAnchor.constraint(equalTo: self.otherHomeOptionsContainerView.leftAnchor, constant: 5),
            visitShowRoomView.topAnchor.constraint(equalTo: self.requestFreeSalesVisitView.bottomAnchor, constant: 5),
            visitShowRoomView.widthAnchor.constraint(equalTo: self.otherHomeOptionsContainerView.widthAnchor, multiplier: 0.48),
            visitShowRoomView.bottomAnchor.constraint(equalTo: self.otherHomeOptionsContainerView.bottomAnchor, constant: -5)
            ])
        }

    @objc func handleVisitShowRoomViewSelected(){
        self.mainViewController?.handleVisitShowRoomViewSelected()
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
            visitShowRoomImageView.leadingAnchor.constraint(equalTo: self.visitShowRoomView.leadingAnchor, constant: 5),
            visitShowRoomImageView.widthAnchor.constraint(equalTo: self.visitShowRoomView.widthAnchor, multiplier: 0.3),
            visitShowRoomImageView.bottomAnchor.constraint(equalTo: self.visitShowRoomView.bottomAnchor, constant: -5)
            ])
    }
    
    lazy var visitShowroomLabel: UILabel = {
       let label = UILabel()
        label.text = "Visit Showroom"
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 38)
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.white
        return label
    }()
    
    func setupVisitShowroomLabelConstraints(){
        NSLayoutConstraint.activate([
            visitShowroomLabel.topAnchor.constraint(equalTo: self.visitShowRoomView.topAnchor, constant: 2),
            visitShowroomLabel.leadingAnchor.constraint(equalTo: self.visitShowRoomImageView.trailingAnchor, constant: 5),
            visitShowroomLabel.trailingAnchor.constraint(equalTo: self.visitShowRoomView.trailingAnchor, constant: -5),
            visitShowroomLabel.bottomAnchor.constraint(equalTo: self.visitShowRoomView.bottomAnchor, constant: -2)
            
            ])
    }


    lazy var shopOnlineView: UIView = {
        let view = UIView()
        view.layer.masksToBounds = true
        view.contentMode = .scaleAspectFit
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleShopOnlineTapped)))
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0.419416666, green: 0.423350811, blue: 0.4357591569, alpha: 1)
        return view
    }()
    
    private func setupShopOnlineViewConstraints(){
        NSLayoutConstraint.activate([
            shopOnlineView.leadingAnchor.constraint(equalTo: self.otherHomeOptionsContainerView.leadingAnchor, constant: 5),
            shopOnlineView.topAnchor.constraint(equalTo: self.otherHomeOptionsContainerView.topAnchor, constant: 5),
            shopOnlineView.trailingAnchor.constraint(equalTo: self.otherHomeOptionsContainerView.trailingAnchor, constant: -5),
            shopOnlineView.heightAnchor.constraint(equalTo: self.otherHomeOptionsContainerView.heightAnchor, multiplier: 0.36)
            
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
            shopOnlineImageView.leadingAnchor.constraint(equalTo: self.shopOnlineLabel.trailingAnchor, constant: 5),
            shopOnlineImageView.trailingAnchor.constraint(equalTo: self.shopOnlineView.trailingAnchor, constant: -5),
            shopOnlineImageView.heightAnchor.constraint(equalTo: self.shopOnlineView.heightAnchor, multiplier: 0.98)
            ])
    }
    
    lazy var shopOnlineLabel: UILabel = {
       let label = UILabel()
        label.textColor = UIColor.white
        label.font = UIFont(name: "BillaBong", size: 72)
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Order now!"
       return label
    }()
    
    func setupShopOnlineLabelConstraints(){
        NSLayoutConstraint.activate([
            shopOnlineLabel.topAnchor.constraint(equalTo: self.shopOnlineView.topAnchor, constant: 5),
            shopOnlineLabel.leadingAnchor.constraint(equalTo: self.shopOnlineView.leadingAnchor, constant: 5),
            shopOnlineLabel.widthAnchor.constraint(equalTo: self.shopOnlineView.widthAnchor, multiplier: 0.6),
            shopOnlineLabel.heightAnchor.constraint(equalTo: self.shopOnlineView.heightAnchor, multiplier: 0.98)
            
            ])
    }
    
    
    lazy var aboutUsView: UIView = {
        let view = UIView()
        view.layer.masksToBounds = true
       view.backgroundColor = #colorLiteral(red: 0.419416666, green: 0.423350811, blue: 0.4357591569, alpha: 1)
        view.isUserInteractionEnabled = true
        view.contentMode = .scaleAspectFit
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleContactUs)))
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    @objc func handleContactUs(){
        self.mainViewController?.handleContactUs()
    }
    
    private func setupAboutUsViewConstraints(){
        NSLayoutConstraint.activate([
            aboutUsView.leftAnchor.constraint(equalTo: self.visitShowRoomView.rightAnchor, constant: 5),
            aboutUsView.topAnchor.constraint(equalTo: self.requestFreeSalesVisitView.bottomAnchor ,constant: 5),
            aboutUsView.rightAnchor.constraint(equalTo: self.otherHomeOptionsContainerView.rightAnchor, constant: -5),
            aboutUsView.bottomAnchor.constraint(equalTo: self.otherHomeOptionsContainerView.bottomAnchor, constant: -5)
            
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
            aboutUsImageView.leadingAnchor.constraint(equalTo: self.aboutUsView.leadingAnchor, constant: 5),
            aboutUsImageView.widthAnchor.constraint(equalTo: self.aboutUsView.widthAnchor, multiplier: 0.3),
            aboutUsImageView.bottomAnchor.constraint(equalTo: self.aboutUsView.bottomAnchor, constant: -4)
        ])
    }
    
    lazy var aboutUsLabel: UILabel = {
       let label = UILabel()
        label.text = "Contact Us"
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 42)
        label.adjustsFontSizeToFitWidth = true
        label.textColor = UIColor.white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func setupAboutUsLabelConstraints(){
        NSLayoutConstraint.activate([
            aboutUsLabel.topAnchor.constraint(equalTo: self.aboutUsView.topAnchor, constant: 2),
            aboutUsLabel.leadingAnchor.constraint(equalTo: self.aboutUsImageView.trailingAnchor, constant: 5),
            aboutUsLabel.trailingAnchor.constraint(equalTo: self.aboutUsView.trailingAnchor, constant: -5),
            aboutUsLabel.bottomAnchor.constraint(equalTo: self.aboutUsView.bottomAnchor, constant: -2)
            ])
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //self.backgroundColor = hexStringToUIColor(hex: "#89fffd")
       // self.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
       // self.applyBottomBarAppTheme()
        
        self.addSubview(logoImageView)
       setupLogoImageViewConstraints()
        
        self.addSubview(magentaSquareLabel)
        setupSetupMagentaSquareLabelConstraints()
        
        self.addSubview(sloganLabel)
        setupSloganLabelConstraints()
        
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
     
        self.productsCategoriesView.addSubview(windowCoveringsView)
        setupWindowCoveringsViewConstraints()
        
        self.productsCategoriesView.addSubview(foldingDoorsView)
        setupFoldingDoorsViewConstraints()
    
       self.productsCategoriesView.addSubview(wirelessSecuritysView)
       setupWirelessSecuritysViewConstraints()
        
        self.otherHomeOptionsContainerView.addSubview(shopOnlineView)
        setupShopOnlineViewConstraints()
        
        self.shopOnlineView.addSubview(shopOnlineLabel)
        setupShopOnlineLabelConstraints()
        
        self.shopOnlineView.addSubview(shopOnlineImageView)
        setupShopOnlineImageViewConstraints()
      
        self.otherHomeOptionsContainerView.addSubview(requestFreeSalesVisitView)
        setupRequestFreeSalesVisitViewConstraints()
        
        self.requestFreeSalesVisitView.addSubview(requestFreeSalesVisitLabel)
        setupRequestFreeSalesVisitLabelConstraints()
        
        self.requestFreeSalesVisitView.addSubview(requestFreeSalesVisitImageView)
        setuprequestFreeSalesVisitImageViewConstraints()
  
        self.otherHomeOptionsContainerView.addSubview(visitShowRoomView)
        setupVisitShowRoomViewConstraints()
        
        self.visitShowRoomView.addSubview(visitShowRoomImageView)
        setupVisitShowRoomImageViewConstraints()
        
        self.visitShowRoomView.addSubview(visitShowroomLabel)
        setupVisitShowroomLabelConstraints()
        
        self.otherHomeOptionsContainerView.addSubview(aboutUsView)
        setupAboutUsViewConstraints()
        
        self.aboutUsView.addSubview(aboutUsImageView)
        setupAboutUsImageViewConstraints()
        
        self.aboutUsView.addSubview(aboutUsLabel)
        setupAboutUsLabelConstraints()
        
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

extension NSMutableAttributedString {
    @discardableResult func bold(_ text: String) -> NSMutableAttributedString {
        let attrs: [NSAttributedString.Key: Any] = [.font: UIFont(name: "AvenirNext-Bold", size: 25)!,.underlineStyle: NSUnderlineStyle.single.rawValue, .foregroundColor: UIColor.black]
        let boldString = NSMutableAttributedString(string:text, attributes: attrs)
        append(boldString)
        
        return self
    }
    
    @discardableResult func normal(_ text: String) -> NSMutableAttributedString {
        let attrs: [NSAttributedString.Key: Any] = [.font: UIFont(name: "Hiragino Maru Gothic ProN", size: 22)!, .foregroundColor: UIColor.black]
        
        let normal = NSAttributedString(string: text, attributes: attrs)  //NSAttributedString(string: text)
        append(normal)
        
        return self
    }
}

extension UILabel {
    // Name this function in a way that makes sense to you...
    // slideFromLeft, slideRight, slideLeftToRight, etc. are great alternative names
    func slideInFromLeft(duration: TimeInterval = 1.0, completionDelegate: AnyObject? = nil) {
        // Create a CATransition animation
        let slideInFromLeftTransition = CATransition()
        
        // Set its callback delegate to the completionDelegate that was provided (if any)
        if let delegate: AnyObject = completionDelegate {
            slideInFromLeftTransition.delegate = delegate as? CAAnimationDelegate
        }
        
        // Customize the animation's properties
        slideInFromLeftTransition.type = CATransitionType.push
        slideInFromLeftTransition.subtype = CATransitionSubtype.fromRight
        slideInFromLeftTransition.duration = duration
        slideInFromLeftTransition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.default)
        slideInFromLeftTransition.fillMode = CAMediaTimingFillMode.removed
        
        // Add the animation to the View's layer
        self.layer.add(slideInFromLeftTransition, forKey: "slideInFromLeftTransition")
    }
}


class PaddingLabel: UILabel {
    
    @IBInspectable var topInset: CGFloat = 0.0
    @IBInspectable var bottomInset: CGFloat = 0.0
    @IBInspectable var leftInset: CGFloat = 5.0
    @IBInspectable var rightInset: CGFloat = 5.0
    
    override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets.init(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
        super.drawText(in: rect.inset(by: insets))
    }
    
    override var intrinsicContentSize: CGSize {
        let size = super.intrinsicContentSize
        return CGSize(width: size.width + leftInset + rightInset,
                      height: size.height + topInset + bottomInset)
    }
}

class PaddingTextField: UITextField {
    
    let padding = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 5)
    
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
}


class VerticalLabel: UILabel  {
    override func draw(_ rect: CGRect) {
        guard let text = self.text else {
            return
        }
        
        // Drawing code
        if let context = UIGraphicsGetCurrentContext() {
            let transform = CGAffineTransform( rotationAngle: CGFloat(-Double.pi/2))
            context.concatenate(transform)
            context.translateBy(x: -rect.size.height, y: 0)
            var newRect = rect.applying(transform)
            newRect.origin = CGPoint.zero
            
            let textStyle = NSMutableParagraphStyle.default.mutableCopy() as! NSMutableParagraphStyle
            textStyle.lineBreakMode = self.lineBreakMode
            textStyle.alignment = self.textAlignment
            
            let attributeDict: [NSAttributedString.Key: AnyObject] = [NSAttributedString.Key.font: self.font, NSAttributedString.Key.foregroundColor: self.textColor, NSAttributedString.Key.paragraphStyle: textStyle]
            
            let nsStr = text as NSString
            nsStr.draw(in: newRect, withAttributes: attributeDict)
        }
    }
}
