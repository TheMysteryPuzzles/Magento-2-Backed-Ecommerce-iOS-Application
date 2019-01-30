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
    
    let productDetailHeaderView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return view
    }()
    
    private func setupProductDetailHeaderViewConstraints(){
        if self.isSafeAnchorsAvailable {
            productDetailHeaderView.topAnchor.constraint(equalTo: self.safeTopAnchor, constant: -navBarHeight!).isActive = true
        }
        else{
            productDetailHeaderView.topAnchor.constraint(equalTo: self.topAnchor, constant: statusBarHeight).isActive = true
        }
        NSLayoutConstraint.activate([
        productDetailHeaderView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            productDetailHeaderView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            productDetailHeaderView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.2)
        ])
    }
    
    lazy var productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.black
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private func setupProductImageViewConstraints(){
        NSLayoutConstraint.activate([
            productImageView.topAnchor.constraint(equalTo: self.productDetailHeaderView.topAnchor, constant: 5),
            productImageView.leftAnchor.constraint(equalTo: self.productDetailHeaderView.leftAnchor, constant: 5),
            productImageView.widthAnchor.constraint(equalTo: self.productDetailHeaderView.widthAnchor, multiplier: 0.39),
            productImageView.bottomAnchor.constraint(equalTo: self.productDetailHeaderView.bottomAnchor, constant: -5)
            ])
    }
    
    lazy var productNameLabel: UILabel = {
        let imageView = UILabel()
        imageView.backgroundColor = UIColor.white
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private func setupProductNameLabelConstraints(){
        NSLayoutConstraint.activate([
            productNameLabel.topAnchor.constraint(equalTo: self.productDetailHeaderView.topAnchor, constant: 5),
            productNameLabel.leftAnchor.constraint(equalTo: self.productImageView.rightAnchor, constant: 5),
            productNameLabel.rightAnchor.constraint(equalTo: self.productDetailHeaderView.rightAnchor, constant: -5),
            productNameLabel.heightAnchor.constraint(equalTo: self.productDetailHeaderView.heightAnchor, multiplier: 0.25)
            ])
       }
    
    lazy var productDetailLabel: UILabel = {
        let imageView = UILabel()
        imageView.backgroundColor = UIColor.red
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private func setupProductDetailLabelConstraints(){
        NSLayoutConstraint.activate([
            productDetailLabel.topAnchor.constraint(equalTo: self.productNameLabel.bottomAnchor, constant: 2),
            productDetailLabel.leftAnchor.constraint(equalTo: self.productImageView.rightAnchor, constant: 5),
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
            selectColorView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.25)
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
    
    var selectColorLabel: UILabel = {
        let label = UILabel()
        label.text = "Select Color"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = true
        label.backgroundColor = UIColor.white
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
    
    var selectColorCollectionViewLayout: UICollectionViewFlowLayout = {
       let layout = UICollectionViewFlowLayout()
       layout.scrollDirection = .horizontal
        return layout
    }()
    
    
    lazy var selectColorCollectionView: UICollectionView = {
       let view = UICollectionView(frame: .zero, collectionViewLayout: selectColorCollectionViewLayout)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        view.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
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
    
    
    var selectColorDetailImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "question_Mark"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = UIColor.white
        return imageView
    }()
    
    private func setupSelectColorDetailImageViewConstraints(){
        NSLayoutConstraint.activate([
            selectColorDetailImageView.topAnchor.constraint(equalTo: self.selectColorHeaderView.topAnchor),
            selectColorDetailImageView.rightAnchor.constraint(equalTo: self.selectColorHeaderView.rightAnchor),
            selectColorDetailImageView.widthAnchor.constraint(equalTo: self.selectColorHeaderView.widthAnchor, multiplier: 0.2),
            selectColorDetailImageView.heightAnchor.constraint(equalTo: self.selectColorHeaderView.heightAnchor)
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
            selectMountDetailsView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.2)
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
            selectMountDetailsHeaderView.heightAnchor.constraint(equalTo: self.selectMountDetailsView.heightAnchor, multiplier: 0.15)
            ])
    }
    
    var selectMountDetailsLabel: UILabel = {
        let label = UILabel()
        label.text = "Select Mount Details"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = true
        label.backgroundColor = UIColor.white
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
    
    var selectMountDetailsDetailImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "question_Mark"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = UIColor.white
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
        button.circleColor = UIColor.white
        button.circleRadius = 10
        button.cornerRadius = 3
        button.strokeColor = UIColor.white
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 26)
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.backgroundColor = UIColor.clear
        button.titleLabel?.textColor = UIColor.black
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
        button.circleRadius = 10
        button.strokeColor = UIColor.white
        button.backgroundColor = UIColor.clear
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 26)
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.titleLabel?.textColor = UIColor.red
        button.circleColor = UIColor.white
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
        field.backgroundColor = UIColor.white
       field.placeholder = "Width(inches)"
       field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    private func setupWidthTextFieldConstraints(){
        NSLayoutConstraint.activate([
            widthTextField.topAnchor.constraint(equalTo: self.insideWindowRadioButton.bottomAnchor, constant: 5),
            widthTextField.leftAnchor.constraint(equalTo: self.selectMountDetailsView.leftAnchor, constant: 5),
            widthTextField.widthAnchor.constraint(equalTo: self.selectMountDetailsView.widthAnchor, multiplier: 0.4),
            widthTextField.heightAnchor.constraint(equalTo: self.selectMountDetailsView.heightAnchor, multiplier: 0.2)
            ])
    }
    
    lazy var heightTextField: UITextField = {
        let field = UITextField()
        field.textColor = UIColor.black
        field.backgroundColor = UIColor.white
        field.placeholder = "Height(inches)"
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    private func setupHeightTextFieldConstraints(){
        NSLayoutConstraint.activate([
            heightTextField.topAnchor.constraint(equalTo: self.widthTextField.bottomAnchor, constant: 5),
            heightTextField.leftAnchor.constraint(equalTo: self.selectMountDetailsView.leftAnchor, constant: 5),
            heightTextField.widthAnchor.constraint(equalTo: self.selectMountDetailsView.widthAnchor, multiplier: 0.4),
            heightTextField.heightAnchor.constraint(equalTo: self.selectMountDetailsView.heightAnchor, multiplier: 0.2)
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
            selectOperationsHeaderView.heightAnchor.constraint(equalTo: self.selectOperationsView.heightAnchor, multiplier: 0.15)
            ])
    }
    
    
    private func setupSelectOperationsViewConstraints(){
        NSLayoutConstraint.activate([
            selectOperationsView.topAnchor.constraint(equalTo: self.selectMountDetailsView.bottomAnchor, constant: 5),
            selectOperationsView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            selectOperationsView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            selectOperationsView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.18)
            ])
    }
    
    lazy var leftCordOperationRadioButton: SSRadioButton = {
        let button = SSRadioButton()
        button.isUserInteractionEnabled = true
        button.addTarget(self, action: #selector(toggleLeftCordOperationRadioButton), for: .touchUpInside)
        button.circleColor = UIColor.white
        button.circleRadius = 10
        button.cornerRadius = 3
        button.strokeColor = UIColor.white
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 26)
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.backgroundColor = UIColor.clear
        button.titleLabel?.textColor = UIColor.black
        button.setTitle("Left Side", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc private func toggleLeftCordOperationRadioButton(){
        self.selectedCordOperation = CordOperation.leftSide
        rightCordOperationRadioButton.isSelected = false
        leftCordOperationRadioButton.isSelected = true
        
    }
    
    @objc private func toggleRightCordOperationRadioButton(){
        self.selectedCordOperation = CordOperation.RightSide
        leftCordOperationRadioButton.isSelected = false
        rightCordOperationRadioButton.isSelected = true
    }
    
    private func setupLeftCordOperationRadioButtonConstraints(){
        NSLayoutConstraint.activate([
            leftCordOperationRadioButton.topAnchor.constraint(equalTo: self.selectOperationsHeaderView.bottomAnchor, constant: 5),
            leftCordOperationRadioButton.leftAnchor.constraint(equalTo: self.selectOperationsView.leftAnchor, constant: 5),
            leftCordOperationRadioButton.widthAnchor.constraint(equalTo: self.selectOperationsView.widthAnchor, multiplier: 0.45),
            leftCordOperationRadioButton.heightAnchor.constraint(equalToConstant: 30)
            ])
     }
    
     lazy var rightCordOperationRadioButton: SSRadioButton = {
        let button = SSRadioButton()
        button.isUserInteractionEnabled = true
        button.addTarget(self, action: #selector(toggleRightCordOperationRadioButton), for: .touchUpInside)
        button.circleRadius = 10
        button.strokeColor = UIColor.white
        button.backgroundColor = UIColor.clear
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 26)
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.titleLabel?.textColor = UIColor.red
        button.circleColor = UIColor.white
        button.setTitle("Right Side", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private func setupRightCordOperationRadioButtonConstraints(){
        NSLayoutConstraint.activate([
            rightCordOperationRadioButton.topAnchor.constraint(equalTo: self.selectOperationsHeaderView.bottomAnchor, constant: 5),
            rightCordOperationRadioButton.leftAnchor.constraint(equalTo: self.leftCordOperationRadioButton.rightAnchor, constant: 5),
            rightCordOperationRadioButton.widthAnchor.constraint(equalTo: selectOperationsView.widthAnchor, multiplier: 0.45),
            rightCordOperationRadioButton.heightAnchor.constraint(equalToConstant: 30)
            ])
    }
    
    var selectCordOperationLabel: UILabel = {
        let label = UILabel()
        label.text = "Select Cord Operation"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = true
        label.backgroundColor = UIColor.cyan
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
    
    var selectCordOperationDetailImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "question_Mark"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = UIColor.cyan
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
            selectControlOperationHeaderView.topAnchor.constraint(equalTo: self.leftCordOperationRadioButton.bottomAnchor),
            selectControlOperationHeaderView.leftAnchor.constraint(equalTo: self.selectOperationsView.leftAnchor),
            selectControlOperationHeaderView.rightAnchor.constraint(equalTo: self.selectOperationsView.rightAnchor),
            selectControlOperationHeaderView.heightAnchor.constraint(equalTo: self.selectOperationsView.heightAnchor, multiplier: 0.15)
            ])
      }
    
    var selectControlOperationLabel: UILabel = {
        let label = UILabel()
        label.text = "Choose Control Operation"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = true
        label.backgroundColor = UIColor.cyan
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
    
    var selectControlOperationsDetailImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "question_Mark"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = UIColor.cyan
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
        button.circleColor = UIColor.white
        button.circleRadius = 10
        button.cornerRadius = 3
        button.strokeColor = UIColor.white
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 26)
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.backgroundColor = UIColor.clear
        button.titleLabel?.textColor = UIColor.black
        button.setTitle("Manual", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
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
        button.circleRadius = 10
        button.strokeColor = UIColor.white
        button.backgroundColor = UIColor.clear
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 26)
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.titleLabel?.textColor = UIColor.red
        button.circleColor = UIColor.white
        button.setTitle("Automatic", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
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
       field.placeholder = "Room Name (eg: Living Room)"
       return field
    }()
    
    private func setupRoomNameTextFieldContriants(){
        NSLayoutConstraint.activate([
            roomNameTextField.topAnchor.constraint(equalTo: self.manualControlRadioButton.bottomAnchor, constant: 5),
            roomNameTextField.leftAnchor.constraint(equalTo: self.selectOperationsView.leftAnchor, constant: 5),
            roomNameTextField.widthAnchor.constraint(equalTo: self.selectOperationsView.widthAnchor, multiplier: 0.9),
            roomNameTextField.bottomAnchor.constraint(equalTo: self.selectOperationsView.bottomAnchor, constant: -1)
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
        self.addSubview(productDetailHeaderView)
        setupProductDetailHeaderViewConstraints()
        
        self.addSubview(selectColorView)
        setupSelectColorViewConstraints()
        
        self.addSubview(selectMountDetailsView)
        setupSelectMountDetailsViewConstraints()
        
        self.addSubview(selectOperationsView)
        setupSelectOperationsViewConstraints()
        
        self.addSubview(cancelButton)
        setupCancelButtonConstraints()
        
        self.addSubview(addToCartButton)
        setupAddToCartButtonConstraints()
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
    
    fileprivate func setupMountDetailsSubViews() {
        self.selectMountDetailsView.addSubview(selectMountDetailsHeaderView)
        setupSelectMountDetailsHeaderViewConstraints()
        
        self.selectMountDetailsHeaderView.addSubview(selectMountDetailsLabel)
        setupselectMountDetailsLabelConstraints()
        
        self.selectMountDetailsHeaderView.addSubview(selectMountDetailsDetailImageView)
        setupSelectMountDetailsDetailImageViewConstraints()
        
        self.selectMountDetailsView.addSubview(insideWindowRadioButton)
        setupInsideWindowRadioButtonConstraints()
        
        self.selectMountDetailsView.addSubview(outsideWindowRadioButton)
        setupOutsideWindowRadioButtonConstraints()
        
        self.selectMountDetailsView.addSubview(widthTextField)
        setupWidthTextFieldConstraints()
        
        self.selectMountDetailsView.addSubview(heightTextField)
        setupHeightTextFieldConstraints()
    }
    
    fileprivate func setupSelectCordOperationSubViews() {
        self.selectOperationsView.addSubview(selectOperationsHeaderView)
        setupSelectOperationsHeaderViewConstraints()
        
        self.selectOperationsHeaderView.addSubview(selectCordOperationLabel)
        setupSelectCordOperationLabelConstraints()
        
        self.selectOperationsHeaderView.addSubview(selectCordOperationDetailImageView)
        setupSelectCordOperationDetailImageViewConstraints()
        
        self.selectOperationsView.addSubview(leftCordOperationRadioButton)
        setupLeftCordOperationRadioButtonConstraints()
        
        self.selectOperationsView.addSubview(rightCordOperationRadioButton)
        setupRightCordOperationRadioButtonConstraints()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        
        setupContainerViews()
        setupProductDetailHeaderViewSubviews()
        setupSelectColorContainerViewSubView()
        setupMountDetailsSubViews()
        setupSelectCordOperationSubViews()
        
        self.selectOperationsView.addSubview(selectControlOperationHeaderView)
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
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
