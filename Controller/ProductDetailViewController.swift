//
//  ProductDetailViewController.swift
//  Magenta Square Demo
//
//  Created by Work on 1/26/19.
//  Copyright © 2019 TheMysteryPuzzles. All rights reserved.
//

import UIKit

class ProductDetailViewController: UIViewController, UICollectionViewDataSource {
    
  
    var selectedItem: Item?
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        cell.backgroundColor = colors[indexPath.item]
        return cell
    }
    
    var colors = [UIColor.green, UIColor.red, UIColor.purple, UIColor.magenta, UIColor.white, #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1), #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1),#colorLiteral(red: 0.1294117719, green: 0.2156862766, blue: 0.06666667014, alpha: 1),#colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1),#colorLiteral(red: 0.4392156899, green: 0.01176470611, blue: 0.1921568662, alpha: 1),#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1),#colorLiteral(red: 0.4931462239, green: 0.2917593901, blue: 1, alpha: 1),#colorLiteral(red: 0, green: 0.7074409196, blue: 1, alpha: 1),#colorLiteral(red: 0.5727052387, green: 0.5456879376, blue: 0.4082240183, alpha: 1),#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1),#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1),#colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1),#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1),#colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1),#colorLiteral(red: 0.1921568662, green: 0.007843137719, blue: 0.09019608051, alpha: 1)]
    
    
  
    
    @IBOutlet weak var productNameLabel: UILabel!
    
    @IBOutlet weak var productColorCollectionView: UICollectionView!
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        productColorCollectionView.dataSource = self
        if selectedItem != nil{
              productNameLabel.text = selectedItem!.name
        }
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 10.0
        layout.itemSize = CGSize(width: 60, height: 60)
        layout.sectionInset = UIEdgeInsets(top: 10, left: 5, bottom: 10, right: 5)
       productColorCollectionView.collectionViewLayout = layout
        productColorCollectionView.backgroundColor = #colorLiteral(red: 0.7088989146, green: 0.9746136509, blue: 0.9764705896, alpha: 1)
    }
    

   
}


