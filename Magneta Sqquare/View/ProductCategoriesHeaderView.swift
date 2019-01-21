//
//  ProductCategoriesHeaderView.swift
//  Magneta Sqquare
//
//  Created by Work on 1/15/19.
//  Copyright © 2019 TheMysteryPuzzles. All rights reserved.
//

import UIKit

class ProductCategoriesHeaderView: UIView {
    
    var windowCoveringsCategory: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "windowCategory")
        return view
    }()
    
    lazy var windowCoveringCategoryLabel: VerticalAlignLabel = {
        let label = VerticalAlignLabel()
        label.text = "Window Coverings"
        label.numberOfLines = 0
        label.textColor = UIColor.darkGray
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.fitTextToBounds()
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = UIColor.clear
        return label
    }()
    
    private func setupWindowCoveringsCategoryConstraints(){
        NSLayoutConstraint.activate([
            windowCoveringsCategory.leftAnchor.constraint(equalTo: self.topView.leftAnchor),
            windowCoveringsCategory.topAnchor.constraint(equalTo: self.topView.topAnchor, constant: 4),
            windowCoveringsCategory.widthAnchor.constraint(equalTo: self.topView.widthAnchor, multiplier: 0.20),
            windowCoveringsCategory.heightAnchor.constraint(equalTo: self.topView.heightAnchor, multiplier: 0.64)
            ])
    }
    
    private func setupWindowCoveringCategoryLabelConstraints(){
        NSLayoutConstraint.activate([
            windowCoveringCategoryLabel.leadingAnchor.constraint(equalTo: self.windowCoveringsCategory.leadingAnchor, constant: -25),
            windowCoveringCategoryLabel.topAnchor.constraint(equalTo: self.windowCoveringsCategory.bottomAnchor),
            windowCoveringCategoryLabel.trailingAnchor.constraint(equalTo: self.windowCoveringsCategory.trailingAnchor, constant: 25),
            windowCoveringCategoryLabel.heightAnchor.constraint(equalTo: self.topView.heightAnchor, multiplier: 0.36)
            ])
    }
    
    var foldingDoorsCategory: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "folding_doors")
        return view
    }()
    
    var foldingDoorsCategoryLabel: VerticalAlignLabel = {
        let label = VerticalAlignLabel()
        label.text = "Folding Doors"
        label.numberOfLines = 0
        label.textColor = UIColor.darkGray
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = UIColor.clear
        return label
    }()
    
    private func setupFoldingDoorsCategoryLabelConstraints(){
        NSLayoutConstraint.activate([
            foldingDoorsCategoryLabel.leadingAnchor.constraint(equalTo: self.foldingDoorsCategory.leadingAnchor, constant: -13),
            foldingDoorsCategoryLabel.topAnchor.constraint(equalTo: self.foldingDoorsCategory.bottomAnchor),
            foldingDoorsCategoryLabel.trailingAnchor.constraint(equalTo: self.foldingDoorsCategory.trailingAnchor, constant: 13),
            foldingDoorsCategoryLabel.heightAnchor.constraint(equalTo: self.topView.heightAnchor, multiplier: 0.36)
            ])
       }
    
    
    private func setupFoldingDoorsCategoryConstraints(){
        NSLayoutConstraint.activate([
            foldingDoorsCategory.centerXAnchor.constraint(equalTo: self.topView.centerXAnchor),
            foldingDoorsCategory.topAnchor.constraint(equalTo: self.topView.topAnchor, constant: 4),
            foldingDoorsCategory.widthAnchor.constraint(equalTo: self.topView.widthAnchor, multiplier: 0.20),
            foldingDoorsCategory.heightAnchor.constraint(equalTo: self.topView.heightAnchor, multiplier: 0.64)
            ])
    }
    
    var WirelessSecuritySystemCategory: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "wireless")
        return view
    }()
    
    
    func setupCategoryLabelsFonts(){
        self.windowCoveringCategoryLabel.fitTextToBounds()
        self.foldingDoorsCategoryLabel.fitTextToBounds()
        self.wirelessSecuritySystemCategoryLabel.fitTextToBounds()
    }
    
    
    var wirelessSecuritySystemCategoryLabel: VerticalAlignLabel = {
        let label = VerticalAlignLabel()
        label.text = "Wireless Security"
        label.numberOfLines = 0
        label.textColor = UIColor.darkGray
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private func
        setupWirelessSecuritySystemCategoryLabelConstraints(){
        NSLayoutConstraint.activate([
            wirelessSecuritySystemCategoryLabel.leadingAnchor.constraint(equalTo: self.WirelessSecuritySystemCategory.leadingAnchor, constant: -25),
            wirelessSecuritySystemCategoryLabel.topAnchor.constraint(equalTo: self.foldingDoorsCategory.bottomAnchor),
            wirelessSecuritySystemCategoryLabel.trailingAnchor.constraint(equalTo: self.WirelessSecuritySystemCategory.trailingAnchor, constant: 25),
            wirelessSecuritySystemCategoryLabel.heightAnchor.constraint(equalTo: self.topView.heightAnchor, multiplier: 0.36)
            ])
    }
    
    
    private func setupWirelessSecuritySystemCategoryConstraints(){
        NSLayoutConstraint.activate([
            WirelessSecuritySystemCategory.rightAnchor.constraint(equalTo: self.topView.rightAnchor),
            WirelessSecuritySystemCategory.topAnchor.constraint(equalTo: self.topView.topAnchor, constant: 4),
            WirelessSecuritySystemCategory.widthAnchor.constraint(equalTo: self.topView.widthAnchor, multiplier: 0.20),
            WirelessSecuritySystemCategory.heightAnchor.constraint(equalTo: self.topView.heightAnchor, multiplier: 0.64)
            ])
    }
    
    
    lazy var topView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    fileprivate func setupWindowsCoveringsCategory() {
        topView.addSubview(windowCoveringsCategory)
        setupWindowCoveringsCategoryConstraints()
        topView.addSubview(windowCoveringCategoryLabel)
        setupWindowCoveringCategoryLabelConstraints()
    }
    
    fileprivate func setupFoldingDoorsCategory() {
        topView.addSubview(foldingDoorsCategory)
        setupFoldingDoorsCategoryConstraints()
        topView.addSubview(foldingDoorsCategoryLabel)
        setupFoldingDoorsCategoryLabelConstraints()
    }
    
    fileprivate func setupWirelessSecurityCategory() {
        topView.addSubview(WirelessSecuritySystemCategory)
        setupWirelessSecuritySystemCategoryConstraints()
        topView.addSubview(wirelessSecuritySystemCategoryLabel)
        setupWirelessSecuritySystemCategoryLabelConstraints()
    }
    
    private func setupTopViewConstraints(){
        
        NSLayoutConstraint.activate([
            topView.topAnchor.constraint(equalTo: self.topAnchor),
            topView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            topView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            topView.heightAnchor.constraint(equalTo: self.heightAnchor)
            ])
        
        setupWindowsCoveringsCategory()
        setupFoldingDoorsCategory()
        setupWirelessSecurityCategory()
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(topView)
        setupTopViewConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
