//
//  ExtensionProductViewController.swift
//  Magneta Sqquare
//
//  Created by Work on 1/15/19.
//  Copyright © 2019 TheMysteryPuzzles. All rights reserved.
//

import UIKit

extension ShopOnlineViewController: SubCollectionViewDataSource, SubCollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
       
        let viewController = ProductDetailViewController()
        print("Item: \(indexPath.item)")
        viewController.selectedItem = self.windowCoveringsItems[indexPath.item]
        self.navigationController?.pushViewController(viewController, animated: true)
       
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseSubCollectionViewIdentifier, for: indexPath) as! ProductGalleryCell
        cell.vc = self
        cell.layer.cornerRadius = 6
        cell.backgroundColor = UIColor.white
        cell.layer.masksToBounds = false
        
        if collectionView.tag == 0 {
            cell.productImageView.image = images[indexPath.item] }
        else if collectionView.tag == 1 {
            cell.productImageView.image = images1[indexPath.item] }
        else if collectionView.tag == 2 {
            cell.productImageView.image = images2[indexPath.item] }
        else if collectionView.tag == 3 {
            cell.productImageView.image = images2[indexPath.item] }
        else{
            cell.productImageView.image = images[indexPath.item]
        }
        return cell
    }
}


extension ShopOnlineViewController: D3ListDelegate, D3ListDatasource {
    
    func d3ListView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let viewController = ProductDetailViewController()
        print("Item: \(indexPath.item)")
        viewController.selectedItem = self.currentSelectedCategoryItems[indexPath.item]
        
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    
  
    
    func sizeForItem(d3CollectionView: D3ListView, index: Int) -> CGSize {
        return CGSize(width: self.view.frame.width, height: self.view.frame.height * 0.85)
    }
    
    func d3ListView(_ d3CollectionView: UICollectionView, willDisplay cell: D3ListViewCell, forItemAt indexPath: IndexPath) {
        cell.registerSubCollectionView(ProductGalleryCell.self, forCellWithReuseIdentifier: reuseSubCollectionViewIdentifier)
        cell.subCollectionViewdataSource = self
        cell.subCollectionViewDelegate = self
        cell.addSubCollectionView(index: indexPath.row)
    }
    
    func numberOfItems(inD3List d3List: D3ListView) -> Int {
        print("Count: \(self.windowCoverings.count)")
        return self.currentSelectedCategoryItems.count
    }
    
    func d3ListView(_ d3CollectionView: D3ListView, cellForItemAt indexPath: IndexPath) -> D3ListViewCell {
        
        let cardCell = d3CollectionView.dequeueReusableCell(withReuseIdentifier: "ExampleCell", for: indexPath) as! ProductDisplayCell
        cardCell.applyBottomBarAppTheme()
        cardCell.categoryNameLabel.text = self.currentSelectedCategoryItems[indexPath.item].name
        cardCell.layer.cornerRadius = 6
        cardCell.layer.masksToBounds = true
        let subFrame = CGRect(x: 0, y: 60, width: cardCell.frame.width, height: cardCell.frame.height - 60)
        cardCell.subCollectionViewFrame = subFrame
        cardCell.subCollectionViewItemSize = CGSize(width: cardCell.frame.width - 50, height: cardCell.frame.height - 100)
        return cardCell
    }
}
