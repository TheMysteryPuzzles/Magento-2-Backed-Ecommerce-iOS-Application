//
//  Ext_ProductDetailVc.swift
//  MagentoAPI
//
//  Created by Work on 1/30/19.
//  Copyright © 2019 TheMysteryPuzzles. All rights reserved.
//

import UIKit

extension ProductDetailViewController: ProductDetailDelegate {

    func addToCartButtonTapped(withAttributes attributes: CustomAttributesViewModel) {
        
        self.model = ProductDetailModel(width: attributes.width, height: attributes.height, cordOperation: attributes.cordOperation, controlOperation: attributes.controlOperation, mountDetails: attributes.mountDetails, selectedColor: attributes.selectedColor)
        
        let controller = AddToCartViewController()
        controller.selectedItem = self.selectedItem!
        controller.selectedAttributes = CustomAttributes(width: model!.height, height: model!.width, cordOperation: model!.cordOperation, controlOperation: model!.controlOperation, mountDetails: model!.mountDetails, selectedColor: model!.selectedColor)
       
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    
    
    func cancelButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }

    
    func productDetailLabelTapped() {
        
    }
    
    func colorSelected(selectedColor color: UIColor) {
        
    }
    
}


