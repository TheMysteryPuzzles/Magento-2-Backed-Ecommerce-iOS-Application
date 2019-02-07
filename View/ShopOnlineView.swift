//
//  ProductsView.swift
//  Magneta Sqquare
//
//  Created by Work on 1/15/19.
//  Copyright © 2019 TheMysteryPuzzles. All rights reserved.
//
import UIKit

class ShopOnlineView: UIView {
    
    lazy var emptyProductsView: UIView = {
       let view = UIView()
       view.translatesAutoresizingMaskIntoConstraints = false
       view.backgroundColor = UIColor.lightGray
       return view
    }()
    
    private func setupEmptyProductsViewConstraints(){
        NSLayoutConstraint.activate([
            emptyProductsView.topAnchor.constraint(equalTo: self.productsCategoryView.bottomAnchor),
            emptyProductsView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            emptyProductsView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            emptyProductsView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
            ])
    }
    
    lazy var emptyProductsLabel: UILabel = {
       let label = UILabel()
       label.text = "There are currently no products in this category."
       label.translatesAutoresizingMaskIntoConstraints = false
       label.textAlignment = .center
       label.numberOfLines = 0
       label.font = UIFont.boldSystemFont(ofSize: 22)
       label.textColor = UIColor.white
       return label
    }()
    
    private func setupEmptyProductsLabelConstraints(){
        NSLayoutConstraint.activate([
            emptyProductsLabel.centerXAnchor.constraint(equalTo: self.emptyProductsView.centerXAnchor),
            emptyProductsLabel.centerYAnchor.constraint(equalTo: self.emptyProductsView.centerYAnchor),
            emptyProductsLabel.heightAnchor.constraint(equalTo: self.emptyProductsView.heightAnchor, multiplier: 0.3),
             emptyProductsLabel.widthAnchor.constraint(equalTo: self.emptyProductsView.widthAnchor, multiplier: 0.9)
        ])
    }
    
    
    var shopOnlineVc: ShopOnlineViewController?{
        didSet{
            self.productsCategoryView.shopOnlineVc = self.shopOnlineVc
        }
    }
    
    func setupCategoryLabelFonts(){
        productsCategoryView.setupCategoryLabelsFonts()
    }
    
    
    lazy var productsTopBarView: ShopOnlineTopBarView = {
        let topBar = ShopOnlineTopBarView()
        topBar.translatesAutoresizingMaskIntoConstraints = false
        return topBar
    }()
    
    
    lazy var productsCategoryView: ShopOnlineProductCategoriesHeaderView = {
        let view = ShopOnlineProductCategoriesHeaderView()
        view.backgroundColor = UIColor.clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private func setupProductsCategoryViewConstraints(){
        NSLayoutConstraint.activate([
            productsCategoryView.topAnchor.constraint(equalTo: self.safeTopAnchor),
            productsCategoryView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            productsCategoryView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.8),
            productsCategoryView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.1)
            ])
        
    }
    
    
    private func setupProductsTopBarConstraints(){
        
        NSLayoutConstraint.activate([
            productsTopBarView.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            productsTopBarView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            productsTopBarView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            productsTopBarView.heightAnchor.constraint(equalToConstant: 50)
            ])
    }
    
    lazy var productsList: D3List = {
        let view = D3List(frame: .zero)
        view.register(ProductDisplayCell.self, forCellWithReuseIdentifier: "ExampleCell")
        
        view.translatesAutoresizingMaskIntoConstraints = false
        //view.dataSource = self
        // view.delegate = self
        return view
    }()
    
    
    private func setupProductsListConstraints(){
        NSLayoutConstraint.activate([
            productsList.topAnchor.constraint(equalTo: self.productsCategoryView.bottomAnchor),
            productsList.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            productsList.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            productsList.bottomAnchor.constraint(equalTo: self.bottomAnchor)
            ])
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //addSubview(productsTopBarView)
        // setupProductsTopBarConstraints()
        addSubview(productsCategoryView)
        setupProductsCategoryViewConstraints()
        addSubview(productsList)
        setupProductsListConstraints()
        
        addSubview(emptyProductsView)
        setupEmptyProductsViewConstraints()
        
        self.emptyProductsView.addSubview(emptyProductsLabel)
        setupEmptyProductsLabelConstraints()
        
        self.emptyProductsView.isHidden = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
