//
//  ProductDetailViewController.swift
//  Magenta Square Demo
//
//  Created by Work on 1/26/19.
//  Copyright © 2019 TheMysteryPuzzles. All rights reserved.
//

import UIKit

class ProductDetailViewController: UIViewController {

    var selectedItem: Item?
    var model: ProductDetailModel?
 
    var colors = [UIColor.green, UIColor.red, UIColor.purple, UIColor.magenta, #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1), #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1), #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1),#colorLiteral(red: 0.1294117719, green: 0.2156862766, blue: 0.06666667014, alpha: 1),#colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1),#colorLiteral(red: 0.4392156899, green: 0.01176470611, blue: 0.1921568662, alpha: 1),#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1),#colorLiteral(red: 0.4931462239, green: 0.2917593901, blue: 1, alpha: 1),#colorLiteral(red: 0, green: 0.7074409196, blue: 1, alpha: 1),#colorLiteral(red: 0.5727052387, green: 0.5456879376, blue: 0.4082240183, alpha: 1),#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1),#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1),#colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1),#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1),#colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1),#colorLiteral(red: 0.1921568662, green: 0.007843137719, blue: 0.09019608051, alpha: 1)]
    
  
    lazy var productDetailView: ProductDetailView = {
       let view = ProductDetailView(frame: self.view.bounds)
        view.delegate = self
        view.selectColorCollectionView.dataSource = self
         view.selectColorCollectionView.delegate = self
       return view
    }()

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
  
    override func viewWillDisappear(_ animated: Bool) {
         self.navigationController?.navigationBar.isHidden = false
    }
 
    override func viewDidAppear(_ animated: Bool) {
        self.productDetailView.scrollView.contentSize.height = self.productDetailView.selectOperationsView.frame.maxY //self.productDetailView.roomNameTextField.frame.maxY
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.productDetailView.productNameLabel.text = self.selectedItem?.name!
        
        for attr in selectedItem!.customAttributes!{
            if attr.attributeCode == "thumbnail" {
                
                var thumbNailUrl = "\(attr.value.unsafelyUnwrapped)"
                thumbNailUrl = String(thumbNailUrl.dropFirst(8))
                thumbNailUrl = String(thumbNailUrl.dropLast(2))
            if let url = URL(string: webServerDocumentRootUrl + thumbNailUrl){
                self.productDetailView.productImageView.downloadAndSetImage(from: url, contentMode: .scaleAspectFill)
            }
        }
            
            if attr.attributeCode == "description" {
                var text = "\(attr.value.unsafelyUnwrapped)"
                text = String(text.dropFirst(8))
                text = String(text.dropLast(2))
              self.productDetailView.productDetailLabel.text = text
        }
        self.view.addSubview(productDetailView)
    }
    
}
}


extension ProductDetailViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = collectionView.frame.height * 0.45
        let width  = collectionView.frame.width * 0.3
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return colors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! ColorCollectionViewCell
        cell.colorView.backgroundColor = colors[indexPath.item]
        cell.colorNameLabel.text = "Color Name"
        return cell
    }
}


class ColorCollectionViewCell: UICollectionViewCell {
    
    lazy var colorView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private func setupcolorViewConstraints(){
        NSLayoutConstraint.activate([
            colorView.topAnchor.constraint(equalTo: self.topAnchor),
            colorView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            colorView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            colorView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.75)
            ])
    }
    
    lazy var colorNameLabel: UILabel = {
       let label = UILabel()
       label.backgroundColor = UIColor.lightGray
       label.translatesAutoresizingMaskIntoConstraints = false
       return label
    }()
    
    private func setupColorNameLabelConstraints(){
        NSLayoutConstraint.activate([
            colorNameLabel.topAnchor.constraint(equalTo: self.colorView.bottomAnchor),
            colorNameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            colorNameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            colorNameLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor)
            
            ])
      }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(colorView)
        setupcolorViewConstraints()
        
        self.addSubview(colorNameLabel)
        setupColorNameLabelConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
