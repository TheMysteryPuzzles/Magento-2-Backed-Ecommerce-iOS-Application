//
//  AddToCartView.swift
//  Magneta Sqquare
//
//  Created by Work on 1/2/19.
//  Copyright © 2019 TheMysteryPuzzles. All rights reserved.
//

import UIKit

class AddToCartView: UIView {
    
    lazy var addToCartView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "add_img")
        view.alpha = 0.8
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(dismissAddToCart)))
        return view
    }()
    
    @objc private func dismissAddToCart(){
        self.addToCartView.isHidden = true
    }
    
    private func setupAddToCartViewConstraints(){
        NSLayoutConstraint.activate([
            addToCartView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            addToCartView.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 30),
            addToCartView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.5),
            addToCartView.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -30)
            ])
    }
    
    
    
    func addToCart(){
        self.addToCartView.isHidden = false
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(addToCartView)
        setupAddToCartViewConstraints()
        addToCartView.isHidden = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
