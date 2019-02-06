//
//  ProductsView.swift
//  Magneta Sqquare
//
//  Created by Work on 1/26/19.
//  Copyright © 2019 TheMysteryPuzzles. All rights reserved.
//

import UIKit

class ProductView: UIView {
    
    var foldingDoors = ["Laminated Doors", "Shower Folding Doors"]
    var wirelessSecurity = ["Sensors", "Magnets", "Alarms"]
    
    
    lazy var windowCoveringsCollectionViewFlowLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        //layout.minimumLineSpacing = 4
        layout.minimumInteritemSpacing = 5
        layout.sectionInset = UIEdgeInsets(top: 2, left: 2, bottom: 0, right: 2)
        let width = (self.frame.width/3) - 5
        let height = (((self.frame.height * 0.4))-((self.frame.height * 0.4)*0.2))/2
        layout.itemSize = CGSize(width: width, height: height)
        return layout
    }()
    
    lazy var windowCoveringsCollectionView: UICollectionView = {
        let cView = UICollectionView(frame: .zero, collectionViewLayout: windowCoveringsCollectionViewFlowLayout)
        cView.translatesAutoresizingMaskIntoConstraints = false
        cView.backgroundColor = UIColor.clear
        cView.tag = 1
        cView.register(ProdcustNameCell.self, forCellWithReuseIdentifier: "ProductNameCell")
        return cView
    }()
    
    private func setupWindowCoveringsCollectionViewConstraints(){
        NSLayoutConstraint.activate([
            windowCoveringsCollectionView.topAnchor.constraint(equalTo: self.windowCoveringsLabelBaground.bottomAnchor),
            windowCoveringsCollectionView.leadingAnchor.constraint(equalTo: self.windowCoveringsContainerView.leadingAnchor),
            windowCoveringsCollectionView.trailingAnchor.constraint(equalTo: self.windowCoveringsContainerView.trailingAnchor),
            windowCoveringsCollectionView.bottomAnchor.constraint(equalTo: self.windowCoveringsContainerView.bottomAnchor, constant: -5)
            
            ])
    }
    
    lazy var windowCoveringsLabelBaground: UIView = {
        let view = UIView()
         view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private func setupWindowCoveringsLabelBagroundConstraints(){
        NSLayoutConstraint.activate([
            windowCoveringsLabelBaground.topAnchor.constraint(equalTo: self.windowCoveringsContainerView.topAnchor, constant: 5),
            windowCoveringsLabelBaground.leadingAnchor.constraint(equalTo: self.windowCoveringsContainerView.leadingAnchor, constant: 20),
            windowCoveringsLabelBaground.trailingAnchor.constraint(equalTo: self.windowCoveringsContainerView.trailingAnchor, constant: -20),
            windowCoveringsLabelBaground.heightAnchor.constraint(equalTo: self.windowCoveringsContainerView.heightAnchor, multiplier: 0.12)
            ])
    }
    
    lazy var windowCoveringsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = UIColor.clear
        label.text = "Hello"
        label.layer.masksToBounds = true
        label.textAlignment = .center
        label.textColor = UIColor.white
        label.font = UIFont(name: "Amaranth", size: 24)
        return label
    }()
    
    public func setupWindowCoveringsLabelConstraints(){
        NSLayoutConstraint.activate([
            windowCoveringsLabel.topAnchor.constraint(equalTo: self.windowCoveringsLabelBaground.topAnchor),
            windowCoveringsLabel.leadingAnchor.constraint(equalTo: self.windowCoveringsLabelBaground.leadingAnchor),
            windowCoveringsLabel.trailingAnchor.constraint(equalTo: self.windowCoveringsLabelBaground.trailingAnchor),
            windowCoveringsLabel.bottomAnchor.constraint(equalTo: self.windowCoveringsLabelBaground.bottomAnchor)
            ])
    }
    
    
    let statusBatHeight = UIApplication.shared.statusBarFrame.height
    
    lazy var windowCoveringsContainerView: UIView = {
       let view = UIView()
        view.backgroundColor = UIColor.clear
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
        layout.minimumInteritemSpacing = 3
        layout.minimumLineSpacing = 5
        layout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        layout.itemSize = CGSize(width: 180, height: 40)
        return layout
    }()
    
    lazy var foldingDoorsCollectionView: UICollectionView = {
        let cView = UICollectionView(frame: .zero, collectionViewLayout: foldingDoorsCollectionViewFlowLayout)
        cView.translatesAutoresizingMaskIntoConstraints = false
        cView.backgroundColor = UIColor.clear
        cView.tag = 2
        cView.delegate = self
        cView.register(ProdcustNameCell.self, forCellWithReuseIdentifier: "ProductNameCell")
        cView.dataSource = self
        return cView
    }()
    
    private func setupFoldingDoorsCollectionViewConstraints(){
        NSLayoutConstraint.activate([
            foldingDoorsCollectionView.topAnchor.constraint(equalTo: self.foldingDoorsLabelBagroundView.bottomAnchor),
            foldingDoorsCollectionView.leadingAnchor.constraint(equalTo: self.foldingDoorsContainerView.leadingAnchor),
            foldingDoorsCollectionView.trailingAnchor.constraint(equalTo: self.foldingDoorsContainerView.trailingAnchor),
            foldingDoorsCollectionView.bottomAnchor.constraint(equalTo: self.foldingDoorsContainerView.bottomAnchor)
            
            ])
    }
    
    lazy var foldingDoorsLabelBagroundView: UIView = {
        let view = UILabel()
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private func setupFoldingDoorsLabelBagroundViewConstraints(){
        NSLayoutConstraint.activate([
            foldingDoorsLabelBagroundView.topAnchor.constraint(equalTo: self.foldingDoorsContainerView.topAnchor),
            foldingDoorsLabelBagroundView.leadingAnchor.constraint(equalTo: self.foldingDoorsContainerView.leadingAnchor, constant: 25),
            foldingDoorsLabelBagroundView.trailingAnchor.constraint(equalTo: self.foldingDoorsContainerView.trailingAnchor, constant: -25),
            foldingDoorsLabelBagroundView.heightAnchor.constraint(equalTo: self.foldingDoorsContainerView.heightAnchor, multiplier: 0.15)
            ])
    }
    
    lazy var foldingDoorsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = UIColor.clear
        label.text = ""
        label.textAlignment = .center
        label.textColor = UIColor.white
        label.font = UIFont(name: "Amaranth", size: 24)
        return label
    }()
    
    private func setupFoldingDoorsLabelConstraints(){
        NSLayoutConstraint.activate([
            foldingDoorsLabel.topAnchor.constraint(equalTo: self.foldingDoorsLabelBagroundView.topAnchor),
            foldingDoorsLabel.leadingAnchor.constraint(equalTo: self.foldingDoorsLabelBagroundView.leadingAnchor),
            foldingDoorsLabel.trailingAnchor.constraint(equalTo: self.foldingDoorsLabelBagroundView.trailingAnchor),
            foldingDoorsLabel.heightAnchor.constraint(equalTo: self.foldingDoorsLabelBagroundView.heightAnchor)
            ])
    }
    
    
    
    lazy var foldingDoorsContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private func setupFoldingDoorsContainerViewConstraints(){
        NSLayoutConstraint.activate([
            foldingDoorsContainerView.topAnchor.constraint(equalTo: self.windowCoveringsContainerView.bottomAnchor),
            foldingDoorsContainerView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            foldingDoorsContainerView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            foldingDoorsContainerView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.25)
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
        cView.backgroundColor = UIColor.clear
        cView.tag = 3
        cView.delegate = self
        cView.register(ProdcustNameCell.self, forCellWithReuseIdentifier: "ProductNameCell")
        cView.dataSource = self
        return cView
    }()
    
    private func setupWirelessSecurityCollectionViewConstraints(){
        NSLayoutConstraint.activate([
            wirelessSecurityCollectionView.topAnchor.constraint(equalTo: self.wirelessSecurityLabelBagroundView.bottomAnchor),
            wirelessSecurityCollectionView.leadingAnchor.constraint(equalTo: self.wirelessSecurityContainerView.leadingAnchor),
            wirelessSecurityCollectionView.trailingAnchor.constraint(equalTo: self.wirelessSecurityContainerView.trailingAnchor),
            wirelessSecurityCollectionView.bottomAnchor.constraint(equalTo: self.wirelessSecurityContainerView.bottomAnchor)
            
            ])
    }
    
    lazy var wirelessSecurityLabelBagroundView: UIView = {
        let view = UILabel()
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private func setupWirelessSecurityLabelBagroundViewConstraints(){
        NSLayoutConstraint.activate([
            wirelessSecurityLabelBagroundView.topAnchor.constraint(equalTo: self.wirelessSecurityContainerView.topAnchor),
            wirelessSecurityLabelBagroundView.leadingAnchor.constraint(equalTo: self.wirelessSecurityContainerView.leadingAnchor, constant: 30),
            wirelessSecurityLabelBagroundView.trailingAnchor.constraint(equalTo: self.wirelessSecurityContainerView.trailingAnchor, constant: -30),
            wirelessSecurityLabelBagroundView.heightAnchor.constraint(equalTo: self.wirelessSecurityContainerView.heightAnchor, multiplier: 0.2)
            ])
    }
    
    
    lazy var wirelessSecurityLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = UIColor.clear
        label.textColor = UIColor.white
        label.text = ""
        label.textAlignment = .center
        label.font = UIFont(name: "Amaranth", size: 24)
        return label
    }()
    
    private func setupWirelessSecurityLabelConstraints(){
        NSLayoutConstraint.activate([
            wirelessSecurityLabel.topAnchor.constraint(equalTo: self.wirelessSecurityLabelBagroundView.topAnchor),
            wirelessSecurityLabel.leadingAnchor.constraint(equalTo: self.wirelessSecurityLabelBagroundView.leadingAnchor),
            wirelessSecurityLabel.trailingAnchor.constraint(equalTo: self.wirelessSecurityLabelBagroundView.trailingAnchor),
            wirelessSecurityLabel.heightAnchor.constraint(equalTo: self.wirelessSecurityLabelBagroundView.heightAnchor)
            ])
    }
    
    
    
    lazy var wirelessSecurityContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.clear
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
    
    
    public func setupProductView(){
        
        self.windowCoveringsLabelBaground.applyCategoryLabelsTheme()
        self.foldingDoorsLabelBagroundView.applyCategoryLabelsTheme()
        self.wirelessSecurityLabelBagroundView.applyCategoryLabelsTheme()
       
        self.windowCoveringsLabelBaground.addSubview(windowCoveringsLabel)
        setupWindowCoveringsLabelConstraints()
        
        self.foldingDoorsLabelBagroundView.addSubview(foldingDoorsLabel)
        setupFoldingDoorsLabelConstraints()
        
        self.wirelessSecurityLabelBagroundView.addSubview(wirelessSecurityLabel)
        setupWirelessSecurityLabelConstraints()
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(windowCoveringsContainerView)
        setupWindowCoveringsContainerViewConstraints()
        
        self.self.windowCoveringsContainerView.addSubview(windowCoveringsLabelBaground)
        setupWindowCoveringsLabelBagroundConstraints()
        
       
        
        self.windowCoveringsContainerView.addSubview(windowCoveringsCollectionView)
        setupWindowCoveringsCollectionViewConstraints()
        
        self.addSubview(foldingDoorsContainerView)
        setupFoldingDoorsContainerViewConstraints()
        
        self.foldingDoorsContainerView.addSubview(foldingDoorsLabelBagroundView)
        setupFoldingDoorsLabelBagroundViewConstraints()
        
        self.foldingDoorsContainerView.addSubview(foldingDoorsCollectionView)
        setupFoldingDoorsCollectionViewConstraints()
        
        self.addSubview(wirelessSecurityContainerView)
        setupWirelessSecurityContainerViewConstraints()
        
        self.wirelessSecurityContainerView.addSubview(wirelessSecurityLabelBagroundView)
        setupWirelessSecurityLabelBagroundViewConstraints()
        
        self.wirelessSecurityContainerView.addSubview(wirelessSecurityCollectionView)
        setupWirelessSecurityCollectionViewConstraints()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ProductView: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
  
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView.tag == 2{
            let width = (collectionView.frame.width / 2) - 10
            let height = (collectionView.frame.height) * 0.9
            return CGSize(width: width, height: height)
        }else{
            let width = (collectionView.frame.width / 2) - 10
            let height = (collectionView.frame.height) * 0.9
            return CGSize(width: width, height: height)
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView.tag == 2{
            return foldingDoors.count
        }else {
            return wirelessSecurity.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductNameCell", for: indexPath) as! ProdcustNameCell
      cell.backgroundColor = #colorLiteral(red: 0.1514958441, green: 0.726865232, blue: 0.9147748351, alpha: 1)
        if collectionView.tag == 2 {
             cell.nameLabel.text = foldingDoors[indexPath.item]
            if indexPath.item == 0 {
                cell.productImageView.image = UIImage(named: "ic_laminatedFoldingDoor")
            }else{
                 cell.productImageView.image = UIImage(named: "shower_FoldingDoor")
            }
        }else {
            cell.nameLabel.text = wirelessSecurity[indexPath.item]
            if indexPath.item == 0 {
                cell.productImageView.image = UIImage(named: "ic_sensors")
            }else if indexPath.item == 1{
                cell.productImageView.image = UIImage(named: "ic_magnets")
            }else{
                cell.productImageView.image = UIImage(named: "ic_alarms")
            }
        }
        return cell
    }
    
}

