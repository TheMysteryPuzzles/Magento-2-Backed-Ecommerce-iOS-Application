//
//  Helpers.swift
//  Magneta Sqquare
//
//  Created by Work on 1/1/19.
//  Copyright © 2019 TheMysteryPuzzles. All rights reserved.
//

import UIKit


let statusBarHeight = UIApplication.shared.statusBarFrame.height

extension UIView {
    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    func applyMainAppTheme(){
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [hexStringToCGColor(hex: "#C33764"),hexStringToCGColor(hex: "#1D2671")]
        gradientLayer.frame = self.bounds
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    func applyCategoryLabelsTheme(){
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [hexStringToCGColor(hex: "#12c2e9"),hexStringToCGColor(hex: "#c471ed"),hexStringToCGColor(hex: "#f64f59")]
        gradientLayer.frame = self.bounds
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        self.layer.insertSublayer(gradientLayer, at: 1)
    }
    
    func applyHomeOptionsTheme(){
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [hexStringToCGColor(hex: "#B066FE"),hexStringToCGColor(hex: "#63E2FF")]
        gradientLayer.frame = self.bounds
       // gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
      //  gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        self.layer.insertSublayer(gradientLayer, at: 1)
    }
    
    func applyTextHeadingsTheme(){
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [hexStringToCGColor(hex: "#B066FE"),hexStringToCGColor(hex: "#63E2FF")]
        gradientLayer.frame = self.bounds
         gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
          gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        self.layer.insertSublayer(gradientLayer, at: 1)
    }
    
    
    func applyBottomBarAppTheme(){
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [hexStringToCGColor(hex: "#ef32d9"),hexStringToCGColor(hex: "#89fffd")]
        gradientLayer.frame = self.bounds
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    func applyBackgroundTheme(){
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [hexStringToCGColor(hex: "#0f0c29"),hexStringToCGColor(hex: "#302b63"),hexStringToCGColor(hex: "#24243e")]
        gradientLayer.frame = self.bounds
        self.layer.insertSublayer(gradientLayer, at: 0)
        
    }
    
    private  func hexStringToCGColor (hex:String) -> CGColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return UIColor.gray.cgColor
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
            ).cgColor
    }
    
    
    func addMask(_ bezierPath: UIBezierPath, frame: CGRect) {
        let pathMask = CAShapeLayer()
        pathMask.frame = frame
        pathMask.path = bezierPath.cgPath
        
        layer.mask = pathMask
        
    }
}
