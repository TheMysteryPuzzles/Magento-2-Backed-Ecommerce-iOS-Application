//
//  SelectedProductCustomAttributesModel.swift
//  MagentoAPI
//
//  Created by Work on 1/30/19.
//  Copyright © 2019 TheMysteryPuzzles. All rights reserved.
//

import UIKit

enum CordOperation {
    case leftSide
    case RightSide
}

enum MountDetails {
    case insideWindow
    case outsideWindow
}

enum ControlOperation {
    case manual
    case automatic
}

struct  CustomAttributesViewModel {
    var width: Double
    var height: Double
    var cordOperation:CordOperation
    var controlOperation: ControlOperation
    var mountDetails: MountDetails
    var selectedColor: UIColor
}
