//
//  ProductCardCell.swift
//  Magneta Sqquare
//
//  Created by Work on 1/15/19.
//  Copyright © 2019 TheMysteryPuzzles. All rights reserved.
//

import UIKit

class ProductGalleryCell: UICollectionViewCell {
    
    var vc: ShopOnlineViewController!
    
    lazy var productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
     
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private func setupProductImageViewConstraints(){
        
        NSLayoutConstraint.activate([
            productImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            productImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            productImageView.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -20),
            productImageView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.8)
            ])
    }

    
    @objc private func handleAddToCart(){
      //  self.vc.addToCart()
    }
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(productImageView)
        setupProductImageViewConstraints()
    
        
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
