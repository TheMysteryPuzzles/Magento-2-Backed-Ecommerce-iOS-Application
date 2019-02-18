//
//  ProductDetailView.swift
//  Magenta Square Demo
//
//  Created by Work on 1/26/19.
//  Copyright © 2019 TheMysteryPuzzles. All rights reserved.
//

import UIKit

class ProductDetailView: UIView, SSRadioButtonControllerDelegate {
   
    var viewModel: CustomAttributesViewModel?
    var delegate: ProductDetailDelegate?
    var selectedMountDetails: MountDetails?
    var selectedCordOperation: CordOperation?
    var selectedControlOperation: ControlOperation?

    func didSelectButton(selectedButton: UIButton?) {
        print("Selected")
    }
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView(frame: self.bounds)
        print("\(self.frame.width)")
        scrollView.contentSize = CGSize(width: self.frame.width, height: self.frame.height)
        scrollView.backgroundColor = UIColor.green
        return scrollView
    }()
    
    
    func setupBlurView(){
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = customAttributeHelpViewBaground.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.customAttributeHelpViewBaground.addSubview(blurEffectView)
self.customAttributeHelpViewBaground.bringSubviewToFront(customAttributeHelpView)
    }
    
    lazy var customAttributeHelpViewBaground: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private func setupCustomAttributeHelpViewBagroundConstraints(){
    NSLayoutConstraint.activate([
        customAttributeHelpViewBaground.topAnchor.constraint(equalTo: scrollView.topAnchor),
        customAttributeHelpViewBaground.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
        customAttributeHelpViewBaground.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
        customAttributeHelpViewBaground.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
        ])
    }
    
    lazy var customAttributeHelpView: CustomAttributesDetailsHelpView = {
       let view = CustomAttributesDetailsHelpView()
       view.backgroundColor = UIColor.lightGray
       view.translatesAutoresizingMaskIntoConstraints = false
       return view
    }()
    
    private func setupCustomAttributeHelpViewConstraints(){
        NSLayoutConstraint.activate([
            customAttributeHelpView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            customAttributeHelpView.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor),
            customAttributeHelpView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.8),
            customAttributeHelpView.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.25)
        ])
    }
    
    let productDetailHeaderView: UIView = {
       let view = UIView()
        //view.scroll
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return view
    }()
    
    private func setupProductDetailHeaderViewConstraints(){
     /*   if self.isSafeAnchorsAvailable {
            productDetailHeaderView.topAnchor.constraint(equalTo: self.topAnchor, constant: -navBarHeight!).isActive = true
        }
        else{
            productDetailHeaderView.topAnchor.constraint(equalTo: self.topAnchor, constant: statusBarHeight).isActive = true
        }*/
        NSLayoutConstraint.activate([
             productDetailHeaderView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: statusBarHeight),
        productDetailHeaderView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            productDetailHeaderView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            productDetailHeaderView.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.2)
        ])
    }
    
    lazy var productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.lightGray
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private func setupProductImageViewConstraints(){
        NSLayoutConstraint.activate([
            productImageView.topAnchor.constraint(equalTo: productDetailHeaderView.topAnchor, constant: 5),
            productImageView.leftAnchor.constraint(equalTo: productDetailHeaderView.leftAnchor, constant: 5),
            productImageView.widthAnchor.constraint(equalTo: productDetailHeaderView.widthAnchor, multiplier: 0.39),
            productImageView.bottomAnchor.constraint(equalTo: productDetailHeaderView.bottomAnchor, constant: -5)
            ])
    }
    
    lazy var productNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 26)
        label.adjustsFontSizeToFitWidth = true
        label.backgroundColor = UIColor.white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private func setupProductNameLabelConstraints(){
        NSLayoutConstraint.activate([
            productNameLabel.topAnchor.constraint(equalTo: productDetailHeaderView.topAnchor, constant: 5),
            productNameLabel.leftAnchor.constraint(equalTo: productImageView.rightAnchor, constant: 5),
            productNameLabel.rightAnchor.constraint(equalTo: productDetailHeaderView.rightAnchor, constant: -5),
            productNameLabel.heightAnchor.constraint(equalTo: productDetailHeaderView.heightAnchor, multiplier: 0.25)
            ])
       }
    
    lazy var productDetailLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor.white
        label.numberOfLines = 0
        label.fitTextToBounds()
        label.text = "Custom window fashions are an expression of style and individuality. Express yours with our new, free flowing Designer Panel Track Collection I. Not your mother’s vertical blinds, these hip, contemporary-styled wider panels make a powerful design statement that transform sliding glass patio or French doors into stunning architectural features of their own."
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private func setupProductDetailLabelConstraints(){
        NSLayoutConstraint.activate([
            productDetailLabel.topAnchor.constraint(equalTo: productNameLabel.bottomAnchor, constant: 2),
            productDetailLabel.leftAnchor.constraint(equalTo: productImageView.rightAnchor, constant: 5),
            productDetailLabel.rightAnchor.constraint(equalTo: self.productDetailHeaderView.rightAnchor, constant: -5),
            productDetailLabel.bottomAnchor.constraint(equalTo: self.productDetailHeaderView.bottomAnchor, constant: -5)
            ])
    }
    
    let selectColorView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0.9998916984, green: 1, blue: 0.9998809695, alpha: 1)
        return view
    }()
    
    private func setupSelectColorViewConstraints(){
        NSLayoutConstraint.activate([
            selectColorView.topAnchor.constraint(equalTo: self.productDetailHeaderView.bottomAnchor, constant: 5),
            selectColorView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            selectColorView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            selectColorView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.3)
            ])
       }
    
    lazy var selectWidthHeightView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.gray
        view.translatesAutoresizingMaskIntoConstraints = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private func setupSelectWidthHeightViewConstraints(){
        NSLayoutConstraint.activate([
            selectWidthHeightView.topAnchor.constraint(equalTo: self.insideWindowLabel.bottomAnchor, constant: 5),
            selectWidthHeightView.leftAnchor.constraint(equalTo: self.selectMountDetailsView.leftAnchor),
            selectWidthHeightView.rightAnchor.constraint(equalTo: self.selectMountDetailsView.rightAnchor),
            selectWidthHeightView.heightAnchor.constraint(equalTo: self.selectMountDetailsView.heightAnchor, multiplier: 0.07)
            ])
    }
    
    lazy var selectWidthHeightLabel: UILabel = {
        let label = UILabel()
        label.text = " Step 3 - Choose Size"
        label.textAlignment = .left
        label.textColor = UIColor.white
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = true
        label.backgroundColor = UIColor.lightGray
        return label
    }()
    
    private func setupSelectWidthHeightLabelConstraints(){
        NSLayoutConstraint.activate([
            selectWidthHeightLabel.topAnchor.constraint(equalTo: self.selectWidthHeightView.topAnchor),
            selectWidthHeightLabel.leftAnchor.constraint(equalTo: self.selectWidthHeightView.leftAnchor),
            selectWidthHeightLabel.widthAnchor.constraint(equalTo: self.selectWidthHeightView.widthAnchor, multiplier: 0.8),
            selectWidthHeightLabel.heightAnchor.constraint(equalTo: self.selectWidthHeightView.heightAnchor)
            ])
    }
    
    lazy var selectColorHeaderView: UIView = {
       let view = UIView()
        view.backgroundColor = UIColor.gray
        view.translatesAutoresizingMaskIntoConstraints = false
       view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private func setupSelectColorHeaderViewConstraints(){
        NSLayoutConstraint.activate([
            selectColorHeaderView.topAnchor.constraint(equalTo: self.selectColorView.topAnchor),
            selectColorHeaderView.leftAnchor.constraint(equalTo: self.selectColorView.leftAnchor),
            selectColorHeaderView.rightAnchor.constraint(equalTo: self.selectColorView.rightAnchor),
            selectColorHeaderView.heightAnchor.constraint(equalTo: self.selectColorView.heightAnchor, multiplier: 0.15)
            ])
    }
    
    lazy var selectColorLabel: UILabel = {
        let label = UILabel()
        label.text = " Step 1 - Choose Color"
        label.textAlignment = .left
        label.textColor = UIColor.white
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = true
        label.backgroundColor = UIColor.lightGray
        return label
    }()
    
    private func setupSelectColorLabel(){
        NSLayoutConstraint.activate([
            selectColorLabel.topAnchor.constraint(equalTo: self.selectColorHeaderView.topAnchor),
            selectColorLabel.leftAnchor.constraint(equalTo: self.selectColorHeaderView.leftAnchor),
            selectColorLabel.widthAnchor.constraint(equalTo: self.selectColorHeaderView.widthAnchor, multiplier: 0.8),
            selectColorLabel.heightAnchor.constraint(equalTo: self.selectColorHeaderView.heightAnchor)
        ])
    }
    
    lazy var selectColorCollectionViewLayout: UICollectionViewFlowLayout = {
       let layout = UICollectionViewFlowLayout()
       layout.scrollDirection = .horizontal
       layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 5
        layout.sectionInset = UIEdgeInsets(top: 5, left: 8, bottom: 1, right: 5)
        return layout
    }()
    
    
    lazy var selectColorCollectionView: UICollectionView = {
       let view = UICollectionView(frame: .zero, collectionViewLayout: selectColorCollectionViewLayout)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        view.register(ColorCollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        return view
    }()
    
    private func setupSelectColorCollectionViewConstraints(){
        NSLayoutConstraint.activate([
            selectColorCollectionView.topAnchor.constraint(equalTo: self.selectColorHeaderView.bottomAnchor),
            selectColorCollectionView.leadingAnchor.constraint(equalTo: self.selectColorView.leadingAnchor),
            selectColorCollectionView.trailingAnchor.constraint(equalTo: self.selectColorView.trailingAnchor),
            selectColorCollectionView.bottomAnchor.constraint(equalTo: self.selectColorView.bottomAnchor)
            ])
    }
    
    
    lazy var selectColorDetailImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "question_Mark"))
        imageView.contentMode = .scaleAspectFit
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleselectColorDetailImageViewSelected)))
        imageView.backgroundColor = UIColor.lightGray
        imageView.isUserInteractionEnabled = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    lazy var selectSizeImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "question_Mark"))
        imageView.contentMode = .scaleAspectFit
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleselectColorDetailImageViewSelected)))
        imageView.backgroundColor = UIColor.lightGray
        imageView.isUserInteractionEnabled = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    @objc func handleselectColorDetailImageViewSelected(){
        self.setupBlurView()
        self.customAttributeHelpViewBaground.isHidden = false
    }
    
    @objc func dismissCustomAttributeHelpViewBaground(){
         self.customAttributeHelpViewBaground.isHidden = true
    }
    
    private func setupSelectColorDetailImageViewConstraints(){
        NSLayoutConstraint.activate([
            selectColorDetailImageView.topAnchor.constraint(equalTo: self.selectColorHeaderView.topAnchor),
            selectColorDetailImageView.rightAnchor.constraint(equalTo: self.selectColorHeaderView.rightAnchor),
            selectColorDetailImageView.widthAnchor.constraint(equalTo: self.selectColorHeaderView.widthAnchor, multiplier: 0.2),
            selectColorDetailImageView.heightAnchor.constraint(equalTo: self.selectColorHeaderView.heightAnchor)
            ])
    }
    private func setupSelectSizeViewConstraints(){
        NSLayoutConstraint.activate([
            selectSizeImageView.topAnchor.constraint(equalTo: self.selectWidthHeightView.topAnchor),
            selectSizeImageView.rightAnchor.constraint(equalTo: self.selectWidthHeightView.rightAnchor),
            selectSizeImageView.widthAnchor.constraint(equalTo: self.selectWidthHeightView.widthAnchor, multiplier: 0.2),
            selectSizeImageView.heightAnchor.constraint(equalTo: self.selectWidthHeightView.heightAnchor)
            ])
    }
    
    
    lazy var selectMountDetailsView: UIView = {
        let view = UIView()
        view.isUserInteractionEnabled = true
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0.9998916984, green: 1, blue: 0.9998809695, alpha: 1)
        return view
    }()
    
    private func setupSelectMountDetailsViewConstraints(){
        NSLayoutConstraint.activate([
            selectMountDetailsView.topAnchor.constraint(equalTo: self.selectColorView.bottomAnchor, constant: 5),
            selectMountDetailsView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            selectMountDetailsView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            selectMountDetailsView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.45)
            ])
      }
    
    lazy var selectMountDetailsHeaderView: UIView = {
        let view = UIView()
        view.isUserInteractionEnabled = true
        view.backgroundColor = UIColor.gray
        view.translatesAutoresizingMaskIntoConstraints = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private func setupSelectMountDetailsHeaderViewConstraints(){
        NSLayoutConstraint.activate([
            selectMountDetailsHeaderView.topAnchor.constraint(equalTo: self.selectMountDetailsView.topAnchor),
            selectMountDetailsHeaderView.leftAnchor.constraint(equalTo: self.selectMountDetailsView.leftAnchor),
            selectMountDetailsHeaderView.rightAnchor.constraint(equalTo: self.selectMountDetailsView.rightAnchor),
            selectMountDetailsHeaderView.heightAnchor.constraint(equalTo: self.selectMountDetailsView.heightAnchor, multiplier: 0.10)
            ])
    }
    
    var selectMountDetailsLabel: UILabel = {
        let label = UILabel()
        label.text = " Step 2 - Choose Mount Details"
        label.backgroundColor = UIColor.lightGray
        label.textColor = UIColor.white
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    private func setupselectMountDetailsLabelConstraints(){
        NSLayoutConstraint.activate([
            selectMountDetailsLabel.topAnchor.constraint(equalTo: self.selectMountDetailsHeaderView.topAnchor),
            selectMountDetailsLabel.leftAnchor.constraint(equalTo: self.selectMountDetailsHeaderView.leftAnchor),
            selectMountDetailsLabel.widthAnchor.constraint(equalTo: self.selectMountDetailsHeaderView.widthAnchor, multiplier: 0.8),
            selectMountDetailsLabel.heightAnchor.constraint(equalTo: self.selectMountDetailsHeaderView.heightAnchor)
            ])
    }
    
    lazy var selectMountDetailsDetailImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "question_Mark"))
        imageView.contentMode = .scaleAspectFit
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleselectColorDetailImageViewSelected)))
        imageView.backgroundColor = UIColor.lightGray
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private func setupSelectMountDetailsDetailImageViewConstraints(){
        NSLayoutConstraint.activate([
            selectMountDetailsDetailImageView.topAnchor.constraint(equalTo: self.selectMountDetailsHeaderView.topAnchor),
            selectMountDetailsDetailImageView.rightAnchor.constraint(equalTo: self.selectMountDetailsHeaderView.rightAnchor),
            selectMountDetailsDetailImageView.widthAnchor.constraint(equalTo: self.selectMountDetailsHeaderView.widthAnchor, multiplier: 0.2),
            selectMountDetailsDetailImageView.heightAnchor.constraint(equalTo: self.selectMountDetailsHeaderView.heightAnchor)
            ])
    }

     var insideWindowRadioButton: SSRadioButton = {
       let button = SSRadioButton()
        button.isUserInteractionEnabled = true
        button.addTarget(self, action: #selector(toggleInsideWindowRadioButton), for: .touchUpInside)
        button.circleColor = UIColor.black
        button.circleRadius = 8
        button.strokeColor = UIColor.black
        button.titleLabel?.font = UIFont(name: "Kefa", size: 18)
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.backgroundColor = UIColor.clear
        button.setTitleColor(UIColor.black, for: .normal)
       button.setTitle("Inside Window", for: .normal)
       button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc private func toggleInsideWindowRadioButton(){
        self.selectedMountDetails = MountDetails.insideWindow
        outsideWindowRadioButton.isSelected = false
        insideWindowRadioButton.isSelected = true
       
    }
    
    @objc private func toggleOutsideWindowRadioButton(){
        self.selectedMountDetails = MountDetails.outsideWindow
        insideWindowRadioButton.isSelected = false
        outsideWindowRadioButton.isSelected = true
      
    }
    
    private func setupInsideWindowRadioButtonConstraints(){
        NSLayoutConstraint.activate([
            insideWindowRadioButton.topAnchor.constraint(equalTo: self.selectMountDetailsHeaderView.bottomAnchor, constant: 5),
            insideWindowRadioButton.leftAnchor.constraint(equalTo: self.selectMountDetailsView.leftAnchor, constant: 5),
            insideWindowRadioButton.widthAnchor.constraint(equalTo: self.selectMountDetailsView.widthAnchor, multiplier: 0.45),
            insideWindowRadioButton.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    lazy var outsideWindowRadioButton: SSRadioButton = {
        let button = SSRadioButton()
        button.isUserInteractionEnabled = true
        button.addTarget(self, action: #selector(toggleOutsideWindowRadioButton), for: .touchUpInside)
        button.circleRadius = 8
        button.strokeColor = UIColor.black
        button.backgroundColor = UIColor.clear
        button.titleLabel?.font = UIFont(name: "Kefa", size: 18)
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.setTitleColor(UIColor.black, for: .normal)
        button.circleColor = UIColor.black
        button.setTitle("Outside Window", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private func setupOutsideWindowRadioButtonConstraints(){
        NSLayoutConstraint.activate([
            outsideWindowRadioButton.topAnchor.constraint(equalTo: self.selectMountDetailsHeaderView.bottomAnchor, constant: 5),
            outsideWindowRadioButton.leftAnchor.constraint(equalTo: self.insideWindowRadioButton.rightAnchor, constant: 5),
            outsideWindowRadioButton.widthAnchor.constraint(equalTo: selectMountDetailsView.widthAnchor, multiplier: 0.45),
            outsideWindowRadioButton.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    lazy var widthTextField: UITextField = {
       let field = UITextField()
       field.textColor = UIColor.black
        field.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        field.attributedPlaceholder = NSAttributedString(string: " Width (Inches)",
                                                               attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
       field.translatesAutoresizingMaskIntoConstraints = false
        field.backgroundColor = UIColor.lightGray.withAlphaComponent(0.3)
        field.layer.cornerRadius = 3
        field.delegate = self
         field.tag = 0
        return field
    }()
    
    private func setupWidthTextFieldConstraints(){
        NSLayoutConstraint.activate([
            widthTextField.topAnchor.constraint(equalTo: self.widthInches.bottomAnchor, constant: 5),
            widthTextField.leftAnchor.constraint(equalTo: self.selectWidthHeightView.leftAnchor),
            widthTextField.widthAnchor.constraint(equalTo: self.widthInches.widthAnchor, multiplier: 0.45),
            widthTextField.heightAnchor.constraint(equalToConstant: 30)
            ])
      }
    
    
    lazy var widthCmTextField: UITextField = {
        let field = UITextField()
        field.textColor = UIColor.black
        field.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        field.attributedPlaceholder = NSAttributedString(string: " Width (Inches)",
                                                         attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        field.translatesAutoresizingMaskIntoConstraints = false
        field.backgroundColor = UIColor.lightGray.withAlphaComponent(0.3)
        field.layer.cornerRadius = 3
        field.delegate = self
        field.tag = 0
        return field
    }()
    
    private func setupWidthCmTextFieldConstraints(){
        NSLayoutConstraint.activate([
            widthTextFieldCm.topAnchor.constraint(equalTo: self.widthCm.bottomAnchor, constant: 5),
            widthTextFieldCm.leftAnchor.constraint(equalTo: self.widthCm.leftAnchor),
            widthTextFieldCm.widthAnchor.constraint(equalTo: self.widthCm.widthAnchor, multiplier: 0.45),
            widthTextFieldCm.heightAnchor.constraint(equalToConstant: 30)
            ])
    }
    
    
    lazy var heightCmTextField: UITextField = {
        let field = UITextField()
        field.textColor = UIColor.black
        field.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        field.attributedPlaceholder = NSAttributedString(string: " Height(Cm)",
                                                         attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        field.translatesAutoresizingMaskIntoConstraints = false
        field.backgroundColor = UIColor.lightGray.withAlphaComponent(0.3)
        field.layer.cornerRadius = 3
        field.delegate = self
        field.tag = 0
        return field
    }()
    
    private func setupHeightCmTextFieldConstraints(){
        NSLayoutConstraint.activate([
            heightTextFieldCm.topAnchor.constraint(equalTo: self.heightCm.bottomAnchor, constant: 5),
            heightTextFieldCm.leftAnchor.constraint(equalTo: self.heightCm.leftAnchor),
            heightTextFieldCm.widthAnchor.constraint(equalTo: self.heightCm.widthAnchor, multiplier: 0.45),
            heightTextFieldCm.heightAnchor.constraint(equalToConstant: 30)
            ])
    }
    
    lazy var widthTextFieldDecimal: UITextField = {
        let field = UITextField()
        field.textColor = UIColor.black
        field.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        field.attributedPlaceholder = NSAttributedString(string: " Width (Inches)",
                                                         attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        field.translatesAutoresizingMaskIntoConstraints = false
        field.backgroundColor = UIColor.lightGray.withAlphaComponent(0.3)
        field.layer.cornerRadius = 3
        field.delegate = self
        field.tag = 0
        return field
    }()
    
    private func setupWidthTextDecimalFieldConstraints(){
        NSLayoutConstraint.activate([
            widthTextFieldDecimal.topAnchor.constraint(equalTo: self.widthInches.bottomAnchor, constant: 5),
            widthTextFieldDecimal.leftAnchor.constraint(equalTo: self.widthTextField.rightAnchor, constant: 5),
            widthTextFieldDecimal.widthAnchor.constraint(equalTo: self.widthInches.widthAnchor, multiplier: 0.45),
            widthTextFieldDecimal.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    
    lazy var widthTextFieldCmDecimal: UITextField = {
        let field = UITextField()
        field.textColor = UIColor.black
        field.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        field.attributedPlaceholder = NSAttributedString(string: " Width (Inches)",
                                                         attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        field.translatesAutoresizingMaskIntoConstraints = false
        field.backgroundColor = UIColor.lightGray.withAlphaComponent(0.3)
        field.layer.cornerRadius = 3
        field.delegate = self
        field.tag = 0
        return field
    }()
    
    private func setupWidthTextFieldCmDecimalConstraints(){
        NSLayoutConstraint.activate([
            widthTextFieldCmDecimal.topAnchor.constraint(equalTo: self.widthTextFieldCm.topAnchor),
            widthTextFieldCmDecimal.leftAnchor.constraint(equalTo: self.widthTextFieldCm.rightAnchor, constant: 5),
            widthTextFieldCmDecimal.widthAnchor.constraint(equalTo: self.widthCm.widthAnchor, multiplier: 0.45),
            widthTextFieldCmDecimal.heightAnchor.constraint(equalToConstant: 30)
            ])
    }
    
    lazy var heightTextFieldCmDecimal: UITextField = {
        let field = UITextField()
        field.textColor = UIColor.black
        field.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        field.attributedPlaceholder = NSAttributedString(string: " Width (Inches)",
                                                         attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        field.translatesAutoresizingMaskIntoConstraints = false
        field.backgroundColor = UIColor.lightGray.withAlphaComponent(0.3)
        field.layer.cornerRadius = 3
        field.delegate = self
        field.tag = 0
        return field
    }()
    
    private func setupHeightTextFieldCmDecimalConstraints(){
        NSLayoutConstraint.activate([
            heightTextFieldCmDecimal.topAnchor.constraint(equalTo: self.heightTextFieldCm.topAnchor),
            heightTextFieldCmDecimal.leftAnchor.constraint(equalTo: self.heightTextFieldCm.rightAnchor, constant: 5),
            heightTextFieldCmDecimal.widthAnchor.constraint(equalTo: self.heightCm.widthAnchor, multiplier: 0.45),
            heightTextFieldCmDecimal.heightAnchor.constraint(equalToConstant: 30)
            ])
    }
    
    
    
    
    lazy var widthTextFieldCm: UITextField = {
        let field = UITextField()
        field.textColor = UIColor.black
        field.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        field.attributedPlaceholder = NSAttributedString(string: " Width (Cm)",
                                                         attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        field.translatesAutoresizingMaskIntoConstraints = false
        field.backgroundColor = UIColor.lightGray.withAlphaComponent(0.3)
        field.layer.cornerRadius = 3
        field.delegate = self
         field.tag = 2
        return field
    }()
    
    private func setupWidthTextFieldCmConstraints(){
        NSLayoutConstraint.activate([
            widthTextFieldCm.topAnchor.constraint(equalTo: self.selectWidthHeightView.bottomAnchor, constant: 5),
            widthTextFieldCm.leftAnchor.constraint(equalTo: self.selectWidthHeightView.leftAnchor),
            widthTextFieldCm.widthAnchor.constraint(equalTo: self.selectWidthHeightView.widthAnchor),
            widthTextFieldCm.heightAnchor.constraint(equalTo: self.selectMountDetailsView.heightAnchor, multiplier: 0.14)
            ])
    }
    
    
    lazy var heightTextField: UITextField = {
        let field = UITextField()
        field.backgroundColor = UIColor.white
        field.attributedPlaceholder = NSAttributedString(string: " Height (Inches)",
                                                         attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        field.translatesAutoresizingMaskIntoConstraints = false
        field.backgroundColor = UIColor.lightGray.withAlphaComponent(0.3)
        field.layer.cornerRadius = 3
         field.tag = 1
        
        return field
    }()
    
    private func setupHeightTextFieldConstraints(){
        NSLayoutConstraint.activate([
            heightTextField.topAnchor.constraint(equalTo: self.heightInches.bottomAnchor, constant: 5),
            heightTextField.leftAnchor.constraint(equalTo: self.heightInches.leftAnchor),
            heightTextField.widthAnchor.constraint(equalTo: self.heightInches.widthAnchor, multiplier: 0.45),
            heightTextField.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    lazy var heightTextFieldDecimal: UITextField = {
        let field = UITextField()
        field.backgroundColor = UIColor.white
        field.attributedPlaceholder = NSAttributedString(string: " Height (Inches)",
                                                         attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        field.translatesAutoresizingMaskIntoConstraints = false
        field.backgroundColor = UIColor.lightGray.withAlphaComponent(0.3)
        field.layer.cornerRadius = 3
        field.tag = 1
        
        return field
    }()
    
    private func setupHeightTextFieldDecimalConstraints(){
        NSLayoutConstraint.activate([
            heightTextFieldDecimal.topAnchor.constraint(equalTo: self.heightInches.bottomAnchor, constant: 5),
            heightTextFieldDecimal.leftAnchor.constraint(equalTo: self.heightTextField.rightAnchor, constant: 5),
            heightTextFieldDecimal.widthAnchor.constraint(equalTo: self.heightInches.widthAnchor, multiplier: 0.45),
            heightTextFieldDecimal.heightAnchor.constraint(equalToConstant: 30)
            ])
    }
    
    
    lazy var heightTextFieldCm: UITextField = {
        let field = UITextField()
        field.backgroundColor = UIColor.white
        field.attributedPlaceholder = NSAttributedString(string: " Height (Cm)",
                                                         attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        field.translatesAutoresizingMaskIntoConstraints = false
        field.backgroundColor = UIColor.lightGray.withAlphaComponent(0.3)
        field.layer.cornerRadius = 3
        field.tag = 3
        return field
    }()
    
    private func setupHeightTextFieldCmConstraints(){
        NSLayoutConstraint.activate([
            heightTextFieldCm.topAnchor.constraint(equalTo: self.widthTextFieldCm.bottomAnchor, constant: 5),
            heightTextFieldCm.leftAnchor.constraint(equalTo: self.widthTextFieldCm.leftAnchor),
            heightTextFieldCm.widthAnchor.constraint(equalTo: self.widthTextFieldCm.widthAnchor),
            heightTextFieldCm.heightAnchor.constraint(equalTo: self.widthTextFieldCm.heightAnchor)
            ])
    }
    
    lazy var widthImageView: UIImageView = {
       let imageView = UIImageView(image: UIImage(named: "ic_insideWidth"))
        imageView.backgroundColor = UIColor.clear
        imageView.contentMode = .scaleAspectFit
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private func setupWidthImageViewConstraints(){
        NSLayoutConstraint.activate([
            widthImageView.topAnchor.constraint(equalTo: self.selectMountDetailsHeaderView.bottomAnchor, constant: 5),
            widthImageView.leftAnchor.constraint(equalTo: self.selectMountDetailsView.leftAnchor, constant: 10),
            widthImageView.widthAnchor.constraint(equalTo: self.selectMountDetailsView.widthAnchor, multiplier: 0.45),
            widthImageView.heightAnchor.constraint(equalTo: self.selectMountDetailsView.heightAnchor, multiplier: 0.3)
        ])
    }
    
    lazy var heightImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "ic_insideHeight"))
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = UIColor.clear
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private func setupHeightImageViewConstraints(){
        NSLayoutConstraint.activate([
            heightImageView.topAnchor.constraint(equalTo: self.selectMountDetailsHeaderView.bottomAnchor, constant: 5),
            heightImageView.rightAnchor.constraint(equalTo: self.selectMountDetailsView.rightAnchor, constant: -10),
            heightImageView.widthAnchor.constraint(equalTo: self.selectMountDetailsView.widthAnchor, multiplier: 0.45),
            heightImageView.heightAnchor.constraint(equalTo: self.selectMountDetailsView.heightAnchor, multiplier: 0.3)
            ])
    }
    
    let selectOperationsView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0.9998916984, green: 1, blue: 0.9998809695, alpha: 1)
        return view
    }()
    
    lazy var selectOperationsHeaderView: UIView = {
        let view = UIView()
        view.isUserInteractionEnabled = true
        view.backgroundColor = UIColor.gray
        view.translatesAutoresizingMaskIntoConstraints = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private func setupSelectOperationsHeaderViewConstraints(){
        NSLayoutConstraint.activate([
            selectOperationsHeaderView.topAnchor.constraint(equalTo: self.selectOperationsView.topAnchor),
            selectOperationsHeaderView.leftAnchor.constraint(equalTo: self.selectOperationsView.leftAnchor),
            selectOperationsHeaderView.rightAnchor.constraint(equalTo: self.selectOperationsView.rightAnchor),
            selectOperationsHeaderView.heightAnchor.constraint(equalTo: self.selectOperationsView.heightAnchor, multiplier: 0.05)
            ])
    }
    
    
    private func setupSelectOperationsViewConstraints(){
        NSLayoutConstraint.activate([
            selectOperationsView.topAnchor.constraint(equalTo: self.selectMountDetailsView.bottomAnchor, constant: 5),
            selectOperationsView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            selectOperationsView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            selectOperationsView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.5)
            ])
    }
    
    lazy var ManualCordOperationRadioButton: SSRadioButton = {
        let button = SSRadioButton()
        button.isUserInteractionEnabled = true
        button.addTarget(self, action: #selector(toggleLeftCordOperationRadioButton), for: .touchUpInside)
        button.circleColor = UIColor.black
        button.circleRadius = 8
        button.strokeColor = UIColor.black
        button.titleLabel?.font = UIFont(name: "Kefa", size: 18)
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.backgroundColor = UIColor.clear
        button.setTitleColor(UIColor.black, for: .normal)
        button.setTitle(" Manual", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
         button.contentHorizontalAlignment = .left
        return button
    }()
    
    @objc private func toggleLeftCordOperationRadioButton(){
        self.selectedCordOperation = CordOperation.leftSide
        motorizedCordOperationRadioButton.isSelected = false
        ManualCordOperationRadioButton.isSelected = true
        
        
    }
    
    @objc private func toggleRightCordOperationRadioButton(){
        self.selectedCordOperation = CordOperation.RightSide
        ManualCordOperationRadioButton.isSelected = false
        motorizedCordOperationRadioButton.isSelected = true
    }
    
    private func setupLeftCordOperationRadioButtonConstraints(){
        NSLayoutConstraint.activate([
            ManualCordOperationRadioButton.topAnchor.constraint(equalTo: self.selectOperationsHeaderView.bottomAnchor, constant: 5),
            ManualCordOperationRadioButton.leftAnchor.constraint(equalTo: self.selectOperationsView.leftAnchor, constant: 5),
            ManualCordOperationRadioButton.widthAnchor.constraint(equalTo: self.selectOperationsView.widthAnchor, multiplier: 0.45),
            ManualCordOperationRadioButton.heightAnchor.constraint(equalToConstant: 30)
            ])
     }
    
     lazy var motorizedCordOperationRadioButton: SSRadioButton = {
        let button = SSRadioButton()
        button.isUserInteractionEnabled = true
        button.addTarget(self, action: #selector(toggleRightCordOperationRadioButton), for: .touchUpInside)
        button.circleRadius = 8
        button.strokeColor = UIColor.black
        button.backgroundColor = UIColor.clear
        button.titleLabel?.font = UIFont(name: "Kefa", size: 18)
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.setTitleColor(UIColor.black, for: .normal)
        button.circleColor = UIColor.black
        button.setTitle(" Motorized", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
         button.contentHorizontalAlignment = .left
        return button
    }()
    
    private func setupRightCordOperationRadioButtonConstraints(){
        NSLayoutConstraint.activate([
            motorizedCordOperationRadioButton.topAnchor.constraint(equalTo: self.selectOperationsHeaderView.bottomAnchor, constant: 5),
            motorizedCordOperationRadioButton.leftAnchor.constraint(equalTo: self.ManualCordOperationRadioButton.rightAnchor, constant: 5),
            motorizedCordOperationRadioButton.widthAnchor.constraint(equalTo: selectOperationsView.widthAnchor, multiplier: 0.45),
            motorizedCordOperationRadioButton.heightAnchor.constraint(equalToConstant: 30)
            ])
    }
    
    var selectCordOperationLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor.lightGray
        label.textColor = UIColor.white
        label.text = "Step 3 - Select Cord Operation"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    private func setupSelectCordOperationLabelConstraints(){
        NSLayoutConstraint.activate([
            selectCordOperationLabel.topAnchor.constraint(equalTo: self.selectOperationsHeaderView.topAnchor),
            selectCordOperationLabel.leftAnchor.constraint(equalTo: self.selectOperationsHeaderView.leftAnchor),
            selectCordOperationLabel.widthAnchor.constraint(equalTo: self.selectOperationsHeaderView.widthAnchor, multiplier: 0.8),
            selectCordOperationLabel.heightAnchor.constraint(equalTo: self.selectOperationsHeaderView.heightAnchor)
            ])
    }
    
   lazy var selectCordOperationDetailImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "question_Mark"))
        imageView.contentMode = .scaleAspectFit
          imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleselectColorDetailImageViewSelected)))
        imageView.backgroundColor = UIColor.lightGray
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private func setupSelectCordOperationDetailImageViewConstraints(){
        NSLayoutConstraint.activate([
            selectCordOperationDetailImageView.topAnchor.constraint(equalTo: self.selectOperationsHeaderView.topAnchor),
            selectCordOperationDetailImageView.rightAnchor.constraint(equalTo: self.selectOperationsHeaderView.rightAnchor),
            selectCordOperationDetailImageView.widthAnchor.constraint(equalTo: self.selectOperationsHeaderView.widthAnchor, multiplier: 0.2),
            selectCordOperationDetailImageView.heightAnchor.constraint(equalTo: self.selectOperationsHeaderView.heightAnchor)
            ])
    }
    
    
    lazy var selectControlOperationHeaderView: UIView = {
        let view = UIView()
        view.isUserInteractionEnabled = true
        view.backgroundColor = UIColor.gray
        view.translatesAutoresizingMaskIntoConstraints = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private func setupSelectControlOperationHeaderViewConstraints(){
        NSLayoutConstraint.activate([
            selectControlOperationHeaderView.topAnchor.constraint(equalTo: self.ManualCordOperationRadioButton.bottomAnchor),
            selectControlOperationHeaderView.leftAnchor.constraint(equalTo: self.selectOperationsView.leftAnchor),
            selectControlOperationHeaderView.rightAnchor.constraint(equalTo: self.selectOperationsView.rightAnchor),
            selectControlOperationHeaderView.heightAnchor.constraint(equalTo: self.selectOperationsView.heightAnchor, multiplier: 0.15)
            ])
      }
    
    var selectControlOperationLabel: UILabel = {
        let label = UILabel()
        label.text = "Step 4 - Choose Control Operation"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = true
        label.backgroundColor = UIColor.lightGray
        label.textColor = UIColor.white
        return label
    }()
    
    private func setupSelectControlOperationLabelConstraints(){
        NSLayoutConstraint.activate([
            selectControlOperationLabel.topAnchor.constraint(equalTo: self.selectControlOperationHeaderView.topAnchor),
            selectControlOperationLabel.leftAnchor.constraint(equalTo: self.selectControlOperationHeaderView.leftAnchor),
            selectControlOperationLabel.widthAnchor.constraint(equalTo: self.selectControlOperationHeaderView.widthAnchor, multiplier: 0.8),
            selectControlOperationLabel.heightAnchor.constraint(equalTo: self.selectControlOperationHeaderView.heightAnchor)
            ])
    }
    
    lazy var selectControlOperationsDetailImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "question_Mark"))
        imageView.contentMode = .scaleAspectFit
        
          imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleselectColorDetailImageViewSelected)))
        imageView.backgroundColor = UIColor.lightGray
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private func setupSelectControlOperationsDetailImageViewConstraints(){
        NSLayoutConstraint.activate([
            selectControlOperationsDetailImageView.topAnchor.constraint(equalTo: self.selectControlOperationHeaderView.topAnchor),
            selectControlOperationsDetailImageView.rightAnchor.constraint(equalTo: self.selectControlOperationHeaderView.rightAnchor),
            selectControlOperationsDetailImageView.widthAnchor.constraint(equalTo: self.selectControlOperationHeaderView.widthAnchor, multiplier: 0.2),
            selectControlOperationsDetailImageView.heightAnchor.constraint(equalTo: self.selectControlOperationHeaderView.heightAnchor)
            ])
    }
    
    
    var manualControlRadioButton: SSRadioButton = {
        let button = SSRadioButton()
        button.isUserInteractionEnabled = true
     
     
        button.addTarget(self, action: #selector(toggleManualControlRadioButton), for: .touchUpInside)
        button.circleColor = UIColor.black
        button.circleRadius = 8
        button.strokeColor = UIColor.black
        button.titleLabel?.font = UIFont(name: "Kefa", size: 18)
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.backgroundColor = UIColor.clear
        button.setTitleColor(UIColor.black, for: .normal)
        button.setTitle(" Manual", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.contentHorizontalAlignment = .left
        return button
    }()
    
    @objc private func toggleManualControlRadioButton(){
        self.selectedControlOperation = ControlOperation.manual
        automaticControlRadioButton.isSelected = false
        manualControlRadioButton.isSelected = true
        
    }
    
    @objc private func toggleAutomaticControlRadioButton(){
        self.selectedControlOperation = ControlOperation.automatic
        manualControlRadioButton.isSelected = false
        automaticControlRadioButton.isSelected = true
        
    }
    
    private func setupManualControlRadioButtonConstraints(){
        NSLayoutConstraint.activate([
            manualControlRadioButton.topAnchor.constraint(equalTo: self.selectControlOperationHeaderView.bottomAnchor, constant: 5),
            manualControlRadioButton.leftAnchor.constraint(equalTo: self.selectOperationsView.leftAnchor, constant: 5),
            manualControlRadioButton.widthAnchor.constraint(equalTo: self.selectOperationsView.widthAnchor, multiplier: 0.45),
            manualControlRadioButton.heightAnchor.constraint(equalToConstant: 30)
            ])
      }
    
    lazy var automaticControlRadioButton: SSRadioButton = {
        let button = SSRadioButton()
        button.isUserInteractionEnabled = true
        button.addTarget(self, action: #selector(toggleAutomaticControlRadioButton), for: .touchUpInside)
        button.circleRadius = 8
        button.strokeColor = UIColor.black
        button.backgroundColor = UIColor.clear
        button.titleLabel?.font = UIFont(name: "Kefa", size: 18)
        button.titleLabel?.adjustsFontSizeToFitWidth = true
       button.setTitleColor(UIColor.black, for: .normal)
        button.circleColor = UIColor.black
        button.setTitle(" Automatic", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
         button.contentHorizontalAlignment = .left
        return button
    }()
    
    private func setupAutomaticControlRadioButtonConstraints(){
        NSLayoutConstraint.activate([
            automaticControlRadioButton.topAnchor.constraint(equalTo: self.selectControlOperationHeaderView.bottomAnchor, constant: 5),
            automaticControlRadioButton.leftAnchor.constraint(equalTo: self.manualControlRadioButton.rightAnchor, constant: 5),
            automaticControlRadioButton.widthAnchor.constraint(equalTo: selectOperationsView.widthAnchor, multiplier: 0.45),
            automaticControlRadioButton.heightAnchor.constraint(equalToConstant: 30)
            ])
    }
    
    lazy var roomNameTextField: UITextField = {
       let field = UITextField()
       field.translatesAutoresizingMaskIntoConstraints = false
       field.backgroundColor = #colorLiteral(red: 0.9998916984, green: 1, blue: 0.9998809695, alpha: 1)

        field.backgroundColor = UIColor.lightGray
        field.attributedPlaceholder = NSAttributedString(string: " Room Name (eg: Living Room)",
                                                         attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
      
        field.layer.cornerRadius = 3
        field.layer.masksToBounds = true
        return field
    }()
    
    private func setupRoomNameTextFieldContriants(){
        NSLayoutConstraint.activate([
            roomNameTextField.topAnchor.constraint(equalTo: self.manualControlRadioButton.bottomAnchor, constant: 5),
            roomNameTextField.leftAnchor.constraint(equalTo: self.selectOperationsView.leftAnchor, constant: 5),
            roomNameTextField.widthAnchor.constraint(equalTo: self.selectOperationsView.widthAnchor, multiplier: 0.98),
            roomNameTextField.heightAnchor.constraint(equalTo: self.selectOperationsView.heightAnchor, multiplier: 0.13)
            ])
    }
    
    
    
    let addToCartButton: UIButton = {
        let button = UIButton()
        button.setTitle("Add To Cart", for: .normal)
        button.addTarget(self, action: #selector(addToCartButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
        return button
    }()
    
    private func setupAddToCartButtonConstraints(){
        NSLayoutConstraint.activate([
            addToCartButton.topAnchor.constraint(equalTo: self.selectOperationsView.bottomAnchor, constant: 5),
            addToCartButton.leftAnchor.constraint(equalTo: self.cancelButton.rightAnchor, constant: 5),
            addToCartButton.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.48),
            addToCartButton.bottomAnchor.constraint(equalTo: self.safeBottomAnchor, constant: -5)
            ])
    }
    
    
    let cancelButton: UIButton = {
        let button = UIButton()
        button.setTitle("Cancel", for: .normal)
        button.addTarget(self, action: #selector(cancelButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
        return button
    }()
    
    private func setupCancelButtonConstraints(){
        NSLayoutConstraint.activate([
            cancelButton.topAnchor.constraint(equalTo: self.selectOperationsView.bottomAnchor, constant: 5),
            cancelButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 5),
            cancelButton.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.48),
            cancelButton.bottomAnchor.constraint(equalTo: self.safeBottomAnchor, constant: -5)
            ])
       }
    
    
    
    fileprivate func setupContainerViews() {
        self.scrollView.addSubview(productDetailHeaderView)
        setupProductDetailHeaderViewConstraints()
        
       self.scrollView.addSubview(selectColorView)
        setupSelectColorViewConstraints()
       
        self.scrollView.addSubview(selectMountDetailsView)
        setupSelectMountDetailsViewConstraints()
       
        self.scrollView.addSubview(selectOperationsView)
        setupSelectOperationsViewConstraints()
          /*
       self.scrollView.addSubview(cancelButton)
        setupCancelButtonConstraints()
        
        self.scrollView.addSubview(addToCartButton)
        setupAddToCartButtonConstraints()*/
    }
    
    fileprivate func setupProductDetailHeaderViewSubviews() {
        self.productDetailHeaderView.addSubview(productImageView)
        setupProductImageViewConstraints()
        
        self.productDetailHeaderView.addSubview(productNameLabel)
        setupProductNameLabelConstraints()
        
        self.productDetailHeaderView.addSubview(productDetailLabel)
        setupProductDetailLabelConstraints()
    }
    
    fileprivate func setupSelectColorContainerViewSubView() {
        self.selectColorView.addSubview(selectColorHeaderView)
        setupSelectColorHeaderViewConstraints()
        
        self.selectColorHeaderView.addSubview(selectColorLabel)
        setupSelectColorLabel()
        
        self.selectColorHeaderView.addSubview(selectColorDetailImageView)
        setupSelectColorDetailImageViewConstraints()
        
        self.selectColorView.addSubview(selectColorCollectionView)
        setupSelectColorCollectionViewConstraints()
    }
    
    lazy var insideWindowLabel: UILabel = {
       let label = UILabel()
       label.text = "Inside Window"
        label.textAlignment = .center
          label.backgroundColor = UIColor.gray
       label.translatesAutoresizingMaskIntoConstraints = false
       return label
    }()
    private func setupInsideWindowLabelConstraints(){
        NSLayoutConstraint.activate([
            insideWindowLabel.topAnchor.constraint(equalTo: self.widthImageView.bottomAnchor),
            insideWindowLabel.leadingAnchor.constraint(equalTo: self.widthImageView.leadingAnchor),
            insideWindowLabel.trailingAnchor.constraint(equalTo: self.widthImageView.trailingAnchor),
            insideWindowLabel.heightAnchor.constraint(equalTo: self.widthImageView.heightAnchor, multiplier: 0.3)
            ])
    }
    
    lazy var outsideWindowLabel: UILabel = {
        let label = UILabel()
        label.text = "Inside Window"
            label.textAlignment = .center
        label.backgroundColor = UIColor.gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private func setupOutsideWindowLabelConstraints(){
        NSLayoutConstraint.activate([
            outsideWindowLabel.topAnchor.constraint(equalTo: self.heightImageView.bottomAnchor),
            outsideWindowLabel.leadingAnchor.constraint(equalTo: self.heightImageView.leadingAnchor),
            outsideWindowLabel.trailingAnchor.constraint(equalTo: self.heightImageView.trailingAnchor),
            outsideWindowLabel.heightAnchor.constraint(equalTo: self.heightImageView.heightAnchor, multiplier: 0.3)
            ])
    }
    
    lazy var widthInches: UILabel = {
       let label = UILabel()
       label.text = "Width(Inches)"
         label.textAlignment = .center
       label.translatesAutoresizingMaskIntoConstraints = false
       return label
    }()
    
    private func setupwidthInchesConstraints(){
     NSLayoutConstraint.activate([
        widthInches.leadingAnchor.constraint(equalTo: self.selectMountDetailsView.leadingAnchor, constant: 5),
         widthInches.widthAnchor.constraint(equalTo: self.selectMountDetailsView.widthAnchor, multiplier: 0.45),
         widthInches.topAnchor.constraint(equalTo: self.selectWidthHeightView.bottomAnchor),
         widthInches.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    
    lazy var widthCm: UILabel = {
        let label = UILabel()
        label.text = "Width(Cm)"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private func setupWidthCmConstraints(){
        NSLayoutConstraint.activate([
            widthCm.leadingAnchor.constraint(equalTo: self.selectMountDetailsView.leadingAnchor, constant: 5),
            widthCm.widthAnchor.constraint(equalTo: self.selectMountDetailsView.widthAnchor, multiplier: 0.45),
            widthCm.topAnchor.constraint(equalTo: self.widthTextField.bottomAnchor, constant: 5),
            widthCm.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
 
    lazy var heightInches: UILabel = {
        let label = UILabel()
        label.text = "Height(Inches)"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private func setupHeightInchesConstraints(){
        NSLayoutConstraint.activate([
            heightInches.trailingAnchor.constraint(equalTo: self.selectMountDetailsView.trailingAnchor, constant: -5),
            heightInches.widthAnchor.constraint(equalTo: self.selectMountDetailsView.widthAnchor, multiplier: 0.45),
            heightInches.topAnchor.constraint(equalTo: self.selectWidthHeightView.bottomAnchor),
            heightInches.heightAnchor.constraint(equalToConstant: 30)
            ])
    }
    
    lazy var heightCm: UILabel = {
        let label = UILabel()
        label.text = "Height(Cm)"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private func setupHeightCmConstraints(){
        NSLayoutConstraint.activate([
            heightCm.trailingAnchor.constraint(equalTo: self.selectMountDetailsView.trailingAnchor, constant: -5),
            heightCm.widthAnchor.constraint(equalTo: self.selectMountDetailsView.widthAnchor, multiplier: 0.45),
            heightCm.topAnchor.constraint(equalTo: self.heightTextField.bottomAnchor, constant: 5),
            heightCm.heightAnchor.constraint(equalToConstant: 30)
            ])
    }
    
    lazy var manualControlOperationsView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.green
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private func setupManualControlOperationsViewConstraints(){
        NSLayoutConstraint.activate([
            manualControlOperationsView.topAnchor.constraint(equalTo: self.manualControlRadioButton.bottomAnchor, constant: 5),
            manualControlOperationsView.leadingAnchor.constraint(equalTo: self.selectOperationsView.leadingAnchor, constant: 5),
            manualControlOperationsView.trailingAnchor.constraint(equalTo: self.selectOperationsView.trailingAnchor, constant: -5),
            manualControlOperationsView.heightAnchor.constraint(equalTo: self.selectOperationsView.heightAnchor, multiplier: 0.3)
        ])
    }
    
    
    lazy var automaticControlOperationsView: UIView  = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    
    fileprivate func setupMountDetailsSubViews() {
        self.selectMountDetailsView.addSubview(selectMountDetailsHeaderView)
        setupSelectMountDetailsHeaderViewConstraints()
        
        self.selectMountDetailsHeaderView.addSubview(selectMountDetailsLabel)
        setupselectMountDetailsLabelConstraints()
        
      self.selectMountDetailsHeaderView.addSubview(selectMountDetailsDetailImageView)
        setupSelectMountDetailsDetailImageViewConstraints()
        
        self.selectMountDetailsView.addSubview(widthImageView)
        setupWidthImageViewConstraints()
        
        self.selectMountDetailsView.addSubview(heightImageView)
        setupHeightImageViewConstraints()
        
        self.selectMountDetailsView.addSubview(insideWindowLabel)
        setupInsideWindowLabelConstraints()
        
        self.selectMountDetailsView.addSubview(outsideWindowLabel)
        setupOutsideWindowLabelConstraints()
        
        self.selectMountDetailsView.addSubview(selectWidthHeightView)
        setupSelectWidthHeightViewConstraints()
        
        self.selectWidthHeightView.addSubview(selectWidthHeightLabel)
        setupSelectWidthHeightLabelConstraints()
        
        self.selectWidthHeightView.addSubview(selectSizeImageView)
        setupSelectSizeViewConstraints()
        
        self.selectMountDetailsView.addSubview(widthInches)
        setupwidthInchesConstraints()
        
        self.selectMountDetailsView.addSubview(heightInches)
        setupHeightInchesConstraints()
    
       self.selectMountDetailsView.addSubview(widthTextField)
       setupWidthTextFieldConstraints()
        
        self.selectMountDetailsView.addSubview(heightTextField)
        setupHeightTextFieldConstraints()
        
       self.selectMountDetailsView.addSubview(widthCm)
        setupWidthCmConstraints()
        
        self.selectMountDetailsView.addSubview(heightCm)
        setupHeightCmConstraints()
        
        self.selectMountDetailsView.addSubview(widthTextFieldDecimal)
        setupWidthTextDecimalFieldConstraints()
        
        
        self.selectMountDetailsView.addSubview(heightTextFieldDecimal)
        setupHeightTextFieldDecimalConstraints()
        
       self.selectMountDetailsView.addSubview(widthTextFieldCm)
        setupWidthCmTextFieldConstraints()
        
        self.selectMountDetailsView.addSubview(heightTextFieldCm)
        setupHeightCmTextFieldConstraints()
        
        self.selectMountDetailsView.addSubview(widthTextFieldCmDecimal)
       setupWidthTextFieldCmDecimalConstraints()
        
        self.selectMountDetailsView.addSubview(heightTextFieldCmDecimal)
        setupHeightTextFieldCmDecimalConstraints()
    }
    
    fileprivate func setupSelectCordOperationSubViews() {
        
        self.selectOperationsView.addSubview(selectOperationsHeaderView)
        setupSelectOperationsHeaderViewConstraints()
        
        self.selectOperationsHeaderView.addSubview(selectCordOperationLabel)
        setupSelectCordOperationLabelConstraints()
        
        self.selectOperationsHeaderView.addSubview(selectCordOperationDetailImageView)
        setupSelectCordOperationDetailImageViewConstraints()
        
        self.selectOperationsView.addSubview(ManualCordOperationRadioButton)
        setupLeftCordOperationRadioButtonConstraints()
        
        self.selectOperationsView.addSubview(motorizedCordOperationRadioButton)
        setupRightCordOperationRadioButtonConstraints()
        
        self.selectOperationsView.addSubview(manualControlOperationsView)
        setupManualControlOperationsViewConstraints()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        
        self.addSubview(scrollView)
        setupContainerViews()
        setupProductDetailHeaderViewSubviews()
        
        setupSelectColorContainerViewSubView()
        setupMountDetailsSubViews()
        setupSelectCordOperationSubViews()
    
    /*  self.selectOperationsView.addSubview(selectControlOperationHeaderView)
        setupSelectControlOperationHeaderViewConstraints()
        
        self.selectControlOperationHeaderView.addSubview(selectControlOperationLabel)
        setupSelectControlOperationLabelConstraints()
        
         self.selectControlOperationHeaderView.addSubview(selectControlOperationsDetailImageView)
        setupSelectControlOperationsDetailImageViewConstraints()
        
        self.selectOperationsView.addSubview(manualControlRadioButton)
        setupManualControlRadioButtonConstraints()
        
        self.selectOperationsView.addSubview(automaticControlRadioButton)
        setupAutomaticControlRadioButtonConstraints()
        
        self.selectOperationsView.addSubview(roomNameTextField)
        setupRoomNameTextFieldContriants()
        
        
        self.addSubview(customAttributeHelpViewBaground)
        setupCustomAttributeHelpViewBagroundConstraints()
        
        self.customAttributeHelpViewBaground.addSubview(customAttributeHelpView)
        setupCustomAttributeHelpViewConstraints()
        
        self.customAttributeHelpViewBaground.isHidden = true
        
        self.customAttributeHelpView.doneButton.addTarget(self, action: #selector(dismissCustomAttributeHelpViewBaground), for: .touchUpInside)
 */
 
 }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ProductDetailView: UITextFieldDelegate{
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.tag == 0 {
            
        }else if textField.tag == 1{
            
        }else if textField.tag == 2{
            
        }
        else if textField.tag == 3{
            
        }
    }
}
