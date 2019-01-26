//
//  ProductsView.swift
//  Magneta Sqquare
//
//  Created by Work on 1/26/19.
//  Copyright © 2019 TheMysteryPuzzles. All rights reserved.
//

import UIKit

class ProductView: UIView {
    
    var windowCoverings =  [ "Aluminium 1'",
                             "Aluminium 2'",
                             "Dark Roller",
                             "Exterior Rollerup",
                             "Fabric",
                             "Honeycomb",
                             "Insect Screen",
                             "Motorization",
                             "Motorized Curtains",
                             "Panel Blinds",
                             "Pleated Blinds",
                             "Printed Roller",
                             "Roman Blinds",
                             "Screen Roller",
                             "Shangrilla Blinds",
                             "Silhoutte Blinds",
                             "Specialized Blinds",
                             "Textured Roller ",
                             "Wood Vertical",
                             "Wood Horizontal",
                             "Zebra Blinds"]
    

    var foldingDoors = ["Laminated Doors", "Shower Folding Doors"]
    var wirelessSecurity = ["Sensors", "Magnets", "Alarms"]
    
    
    lazy var windowCoveringsCollectionViewFlowLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 5, left: 2, bottom: 5, right: 2)
        layout.itemSize = CGSize(width: 120, height: 20)
        return layout
    }()
    
    lazy var windowCoveringsCollectionView: UICollectionView = {
        let cView = UICollectionView(frame: .zero, collectionViewLayout: windowCoveringsCollectionViewFlowLayout)
        cView.translatesAutoresizingMaskIntoConstraints = false
        cView.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        cView.tag = 1
        cView.register(ProdcustNameCell.self, forCellWithReuseIdentifier: "ProductNameCell")
        cView.dataSource = self
        return cView
    }()
    
    private func setupWindowCoveringsCollectionViewConstraints(){
        NSLayoutConstraint.activate([
            windowCoveringsCollectionView.topAnchor.constraint(equalTo: self.windowCoveringsLabel.bottomAnchor),
            windowCoveringsCollectionView.leadingAnchor.constraint(equalTo: self.windowCoveringsContainerView.leadingAnchor),
            windowCoveringsCollectionView.trailingAnchor.constraint(equalTo: self.windowCoveringsContainerView.trailingAnchor),
            windowCoveringsCollectionView.bottomAnchor.constraint(equalTo: self.windowCoveringsContainerView.bottomAnchor)
            
            ])
    }
    
    
    lazy var windowCoveringsLabel: UILabel = {
       let label = UILabel()
       label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = UIColor.white
        label.text = "Window Coverings"
        label.textAlignment = .center
        label.backgroundColor = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)
        label.textColor = UIColor.white
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    private func setupWindowCoveringsLabelConstraints(){
        NSLayoutConstraint.activate([
            windowCoveringsLabel.topAnchor.constraint(equalTo: self.windowCoveringsContainerView.topAnchor),
            windowCoveringsLabel.leadingAnchor.constraint(equalTo: self.windowCoveringsContainerView.leadingAnchor),
            windowCoveringsLabel.trailingAnchor.constraint(equalTo: self.windowCoveringsContainerView.trailingAnchor),
            windowCoveringsLabel.heightAnchor.constraint(equalTo: self.windowCoveringsContainerView.heightAnchor, multiplier: 0.2)
            ])
    }
    
    
    let statusBatHeight = UIApplication.shared.statusBarFrame.height
    
    lazy var windowCoveringsContainerView: UIView = {
       let view = UIView()
        view.backgroundColor = UIColor.green
        view.translatesAutoresizingMaskIntoConstraints = false
       return view
    }()
    
    private func setupWindowCoveringsContainerViewConstraints(){
        
    
        NSLayoutConstraint.activate([
            
            windowCoveringsContainerView.topAnchor.constraint(equalTo: self.safeTopAnchor),
            windowCoveringsContainerView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            windowCoveringsContainerView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            windowCoveringsContainerView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.4)
            ])
    }
    
    lazy var foldingDoorsCollectionViewFlowLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 5, left: 2, bottom: 5, right: 2)
        layout.itemSize = CGSize(width: 180, height: 40)
        return layout
    }()
    
    lazy var foldingDoorsCollectionView: UICollectionView = {
        let cView = UICollectionView(frame: .zero, collectionViewLayout: foldingDoorsCollectionViewFlowLayout)
        cView.translatesAutoresizingMaskIntoConstraints = false
        cView.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        cView.tag = 2
        cView.register(ProdcustNameCell.self, forCellWithReuseIdentifier: "ProductNameCell")
        cView.dataSource = self
        return cView
    }()
    
    private func setupFoldingDoorsCollectionViewConstraints(){
        NSLayoutConstraint.activate([
            foldingDoorsCollectionView.topAnchor.constraint(equalTo: self.foldingDoorsLabel.bottomAnchor),
            foldingDoorsCollectionView.leadingAnchor.constraint(equalTo: self.foldingDoorsContainerView.leadingAnchor),
            foldingDoorsCollectionView.trailingAnchor.constraint(equalTo: self.foldingDoorsContainerView.trailingAnchor),
            foldingDoorsCollectionView.bottomAnchor.constraint(equalTo: self.foldingDoorsContainerView.bottomAnchor)
            
            ])
    }
    
    lazy var foldingDoorsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = UIColor.white
        label.text = "Folding Doors"
        label.textAlignment = .center
        label.textColor = UIColor.white
        label.backgroundColor = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    private func setupFoldingDoorsLabelConstraints(){
        NSLayoutConstraint.activate([
            foldingDoorsLabel.topAnchor.constraint(equalTo: self.foldingDoorsContainerView.topAnchor),
            foldingDoorsLabel.leadingAnchor.constraint(equalTo: self.foldingDoorsContainerView.leadingAnchor),
            foldingDoorsLabel.trailingAnchor.constraint(equalTo: self.foldingDoorsContainerView.trailingAnchor),
            foldingDoorsLabel.heightAnchor.constraint(equalTo: self.foldingDoorsContainerView.heightAnchor, multiplier: 0.2)
            ])
    }
    
    
    
    lazy var foldingDoorsContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.red
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private func setupFoldingDoorsContainerViewConstraints(){
        NSLayoutConstraint.activate([
            foldingDoorsContainerView.topAnchor.constraint(equalTo: self.windowCoveringsContainerView.bottomAnchor),
            foldingDoorsContainerView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            foldingDoorsContainerView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            foldingDoorsContainerView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.15)
            ])
    }

    
    lazy var wirelessSecurityCollectionViewFlowLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 5, left: 2, bottom: 5, right: 2)
        layout.itemSize = CGSize(width: 180, height: 20)
        return layout
    }()
    
    lazy var wirelessSecurityCollectionView: UICollectionView = {
        let cView = UICollectionView(frame: .zero, collectionViewLayout: wirelessSecurityCollectionViewFlowLayout)
        cView.translatesAutoresizingMaskIntoConstraints = false
        cView.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        cView.tag = 3
        cView.register(ProdcustNameCell.self, forCellWithReuseIdentifier: "ProductNameCell")
        cView.dataSource = self
        return cView
    }()
    
    private func setupWirelessSecurityCollectionViewConstraints(){
        NSLayoutConstraint.activate([
            wirelessSecurityCollectionView.topAnchor.constraint(equalTo: self.wirelessSecurityLabel.bottomAnchor),
            wirelessSecurityCollectionView.leadingAnchor.constraint(equalTo: self.wirelessSecurityContainerView.leadingAnchor),
            wirelessSecurityCollectionView.trailingAnchor.constraint(equalTo: self.wirelessSecurityContainerView.trailingAnchor),
            wirelessSecurityCollectionView.bottomAnchor.constraint(equalTo: self.wirelessSecurityContainerView.bottomAnchor)
            
            ])
    }
    
    
    
    
    lazy var wirelessSecurityLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = UIColor.white
        label.textColor = UIColor.white
        label.text = "Wireless Security"
        label.textAlignment = .center
        label.backgroundColor = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    private func setupWirelessSecurityLabelConstraints(){
        NSLayoutConstraint.activate([
            wirelessSecurityLabel.topAnchor.constraint(equalTo: self.wirelessSecurityContainerView.topAnchor),
            wirelessSecurityLabel.leadingAnchor.constraint(equalTo: self.wirelessSecurityContainerView.leadingAnchor),
            wirelessSecurityLabel.trailingAnchor.constraint(equalTo: self.wirelessSecurityContainerView.trailingAnchor),
            wirelessSecurityLabel.heightAnchor.constraint(equalTo: self.wirelessSecurityContainerView.heightAnchor, multiplier: 0.2)
            ])
    }
    
    
    
    lazy var wirelessSecurityContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.purple
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    
    private func setupWirelessSecurityContainerViewConstraints(){
        NSLayoutConstraint.activate([
            wirelessSecurityContainerView.topAnchor.constraint(equalTo: self.foldingDoorsContainerView.bottomAnchor),
            wirelessSecurityContainerView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            wirelessSecurityContainerView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            wirelessSecurityContainerView.bottomAnchor.constraint(equalTo: self.safeBottomAnchor)
            ])
    }
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(windowCoveringsContainerView)
        setupWindowCoveringsContainerViewConstraints()
        
        self.windowCoveringsContainerView.addSubview(windowCoveringsLabel)
        setupWindowCoveringsLabelConstraints()
        
        self.windowCoveringsContainerView.addSubview(windowCoveringsCollectionView)
        setupWindowCoveringsCollectionViewConstraints()
        
        self.addSubview(foldingDoorsContainerView)
        setupFoldingDoorsContainerViewConstraints()
        
        self.foldingDoorsContainerView.addSubview(foldingDoorsLabel)
        setupFoldingDoorsLabelConstraints()
        
        self.foldingDoorsContainerView.addSubview(foldingDoorsCollectionView)
        setupFoldingDoorsCollectionViewConstraints()
        
        self.addSubview(wirelessSecurityContainerView)
        setupWirelessSecurityContainerViewConstraints()
        
        self.wirelessSecurityContainerView.addSubview(wirelessSecurityLabel)
        setupWirelessSecurityLabelConstraints()
        
        self.wirelessSecurityContainerView.addSubview(wirelessSecurityCollectionView)
        setupWirelessSecurityCollectionViewConstraints()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ProductView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.tag == 1{
            return windowCoverings.count
        }
        else if collectionView.tag == 2{
            return foldingDoors.count
        }else {
            return wirelessSecurity.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductNameCell", for: indexPath) as! ProdcustNameCell
        cell.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        if collectionView.tag == 1{
            cell.nameLabel.text = windowCoverings[indexPath.item]
        }
        else if collectionView.tag == 2{
             cell.nameLabel.text = foldingDoors[indexPath.item]
        }else {
            cell.nameLabel.text = wirelessSecurity[indexPath.item]
        }
        return cell
    }
    
    
}


class ProdcustNameCell : UICollectionViewCell {
    
    lazy var nameLabel: UILabel = {
       let label = UILabel(frame: self.bounds)
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.backgroundColor = #colorLiteral(red: 0.9998916984, green: 1, blue: 0.9998809695, alpha: 1)
       return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(nameLabel)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
