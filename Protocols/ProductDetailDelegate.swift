//
//  ProductDetailDelegate.swift
//  MagentoAPI
//
//  Created by Work on 1/30/19.
//  Copyright © 2019 TheMysteryPuzzles. All rights reserved.
//

import UIKit

 protocol ProductDetailDelegate{
    
    func cancelButtonTapped()
    func addToCartButtonTapped(withAttributes attributes: CustomAttributesViewModel)
    func productDetailLabelTapped()
    func colorSelected(selectedColor color: UIColor)


}
