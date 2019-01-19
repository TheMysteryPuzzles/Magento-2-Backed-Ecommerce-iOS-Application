//
//  ProductCardCell.swift
//  Magneta Sqquare
//
//  Created by Work on 1/15/19.
//  Copyright © 2019 TheMysteryPuzzles. All rights reserved.
//

import UIKit

class ProductGalleryCell: UICollectionViewCell {
    
    var vc: ProductsViewController!
    
    lazy var productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
     
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private func setupProductImageViewConstraints(){
        
        NSLayoutConstraint.activate([
            productImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            productImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            productImageView.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -20),
            productImageView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.8)
            ])
    }
    
    
    lazy var productCategoryLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor.clear
        label.text = "Product Name"
        label.textAlignment = .center
        label.textColor = UIColor.gray
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private func setupProductCategoryLabel(){
        NSLayoutConstraint.activate([
            productCategoryLabel.topAnchor.constraint(equalTo: self.productImageView.bottomAnchor, constant: 5),
            productCategoryLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            productCategoryLabel.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -20),
            productCategoryLabel.heightAnchor.constraint(equalToConstant: 20)
            ])
    }
    
    lazy var productNameLabel: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "add_cart"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleAddToCart), for: .touchUpInside)
        button.isUserInteractionEnabled = true
        return button
    }()
    
    @objc private func handleAddToCart(){
      //  self.vc.addToCart()
    }
    
    private func setupProductNameLabel(){
        NSLayoutConstraint.activate([
            productNameLabel.topAnchor.constraint(equalTo: self.productCategoryLabel.bottomAnchor, constant: 5),
            productNameLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            productNameLabel.widthAnchor.constraint(equalToConstant: 30),
            productNameLabel.heightAnchor.constraint(equalToConstant: 25)
            ])
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(productImageView)
        setupProductImageViewConstraints()
        addSubview(productCategoryLabel)
        setupProductCategoryLabel()
        addSubview(productNameLabel)
        setupProductNameLabel()
        
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    override func layoutSubviews() {
        
        self.layer.cornerRadius = 12
        super.layoutSubviews()
    }
}
