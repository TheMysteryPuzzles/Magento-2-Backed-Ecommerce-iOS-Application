//
//  ProductsView.swift
//  Magneta Sqquare
//
//  Created by Work on 1/15/19.
//  Copyright © 2019 TheMysteryPuzzles. All rights reserved.
//

import UIKit

class ShopOnlineView: UIView {
   
    var shopOnlineVc: ShopOnlineViewController?
    
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
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
