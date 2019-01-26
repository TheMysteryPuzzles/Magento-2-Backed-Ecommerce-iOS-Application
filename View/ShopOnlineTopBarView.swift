//
//  ProductsTopBarView.swift
//  Magneta Sqquare
//
//  Created by Work on 1/15/19.
//  Copyright © 2019 TheMysteryPuzzles. All rights reserved.
//

import UIKit

class ShopOnlineTopBarView: UIView {
    
    var topLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textColor = UIColor.white
        label.text = "Products"
        return label
    }()
    
    lazy var headerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.clear
       view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private func setupHeaderViewConstraints(){
        NSLayoutConstraint.activate([
            headerView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            headerView.topAnchor.constraint(equalTo: self.topAnchor),
            headerView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            headerView.heightAnchor.constraint(equalTo: self.heightAnchor)
        ])
    }
    
    
    let leftHeaderViewButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.clear
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "ic_menu"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        return button
    }()
    
    
    let rightHeaderViewButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.clear
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    private func setupLeftHeaderButtonConstraints(){
        NSLayoutConstraint.activate([
            leftHeaderViewButton.leftAnchor.constraint(equalTo: headerView.leftAnchor),
            leftHeaderViewButton.topAnchor.constraint(equalTo: headerView.topAnchor),
            leftHeaderViewButton.widthAnchor.constraint(equalToConstant: 75),
            leftHeaderViewButton.heightAnchor.constraint(equalToConstant: 50)
            ])
    }
    
    private func setupRightHeaderButtonConstraints(){
        NSLayoutConstraint.activate([
            rightHeaderViewButton.rightAnchor.constraint(equalTo: headerView.rightAnchor),
            rightHeaderViewButton.topAnchor.constraint(equalTo: headerView.topAnchor),
            rightHeaderViewButton.widthAnchor.constraint(equalToConstant: 75),
            rightHeaderViewButton.heightAnchor.constraint(equalToConstant: 50)
            ])
    }
    
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        headerView.applyMainAppTheme()
        
    }
    
    fileprivate func setupTopLabelConstraints() {
        NSLayoutConstraint.activate([
            topLabel.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
            topLabel.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            topLabel.widthAnchor.constraint(equalToConstant: 100),
            topLabel.heightAnchor.constraint(equalToConstant: 40)
            ])
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(headerView)
        self.backgroundColor = UIColor.purple
        //headerView.applyMainAppTheme()
        setupHeaderViewConstraints()
        addSubview(leftHeaderViewButton)
        setupLeftHeaderButtonConstraints()
        addSubview(rightHeaderViewButton)
        setupRightHeaderButtonConstraints()
        headerView.addSubview(topLabel)
        setupTopLabelConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
