//
//  Ext_ProductDetailView.swift
//  MagentoAPI
//
//  Created by Work on 1/30/19.
//  Copyright © 2019 TheMysteryPuzzles. All rights reserved.
//

import UIKit

extension ProductDetailView {
    
    @objc func cancelButtonTapped(){
        self.delegate?.cancelButtonTapped()
    }
    
    @objc func addToCartButtonTapped(){
        let width = Double(self.widthTextField.text!)
        let height = Double(self.heightTextField.text!)
        self.viewModel = CustomAttributesViewModel(width: width!, height: height!, cordOperation: self.selectedCordOperation!, controlOperation: self.selectedControlOperation!, mountDetails: self.selectedMountDetails!, selectedColor: UIColor.green)
        self.delegate?.addToCartButtonTapped(withAttributes: self.viewModel!)
    }
    
    @objc func productDetailLabelTapped(){
        self.delegate?.productDetailLabelTapped()
    }
    
    @objc func colorSelected(selectedColor color: UIColor){
        self.delegate?.colorSelected(selectedColor: color)
    }


}
