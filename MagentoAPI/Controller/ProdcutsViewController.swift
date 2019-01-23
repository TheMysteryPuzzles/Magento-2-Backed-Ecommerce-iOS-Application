//
//  ProdcutsViewController.swift
//  MagentoAPI
//
//  Created by Work on 1/19/19.
//  Copyright © 2019 TheMysteryPuzzles. All rights reserved.
//

import UIKit

class ProdcutsViewController: UIViewController {
    
    var categoriesResponse: Categories?
    var completeCatalog = [Int:ProductDetailsModel]()
    
    
    
    private func getAllMagentoStoreCategories(){
        var request = URLRequest(url: URL(string: hostName+"/rest/V1/categories")!)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("Bearer "+admintoken!, forHTTPHeaderField:
            "Authorization")
        
        URLSession.shared.dataTask(with: request, completionHandler: { data, response, error -> Void in
            do {
                let jsonDecoder = JSONDecoder()
                let responseModel = try jsonDecoder.decode(Categories.self, from: data!)
                self.categoriesResponse = responseModel
                self.getAllCategories()
            } catch {
                print("JSON Serialization error")
            }
        }).resume()
    }
    
    
    private func getAllCategories(){
        print("Category Names :")
        for items in categoriesResponse!.childrenData{
            print(items.name)
            getAllProdcutsUnderCategory(withProductId: items.id)
        }
    }
    
    
    private func getAllProdcutsUnderCategory(withProductId id: Int){
        var request = URLRequest(url: URL(string: hostName+"/rest/V1/products/?searchCriteria[filter_groups][0][filters][0][field]=category_id&searchCriteria[filter_groups][0][filters][0][value]="+"\(id)"+"&searchCriteria[filter_groups][0][filters][0][condition_type]=eq")!)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("Bearer "+admintoken!, forHTTPHeaderField:
            "Authorization")
        
        URLSession.shared.dataTask(with: request, completionHandler: { data, response, error -> Void in
            do {
                
                let jsonDecoder = JSONDecoder()
                let responseModel = try jsonDecoder.decode(ProductDetailsModel.self, from: data!)
                print("Category ID: \(id)")
                
                self.completeCatalog[id] = responseModel
                self.getAllProductsUnder(thisCategory: id)
                
                if id == 3 {
                    if customerToken != nil {
                        self.addToCart()
                    }
                }
            } catch {
                print("JSON Serialization error")
            }
        }).resume()
        
        
    }
    
    private func getAllProductsUnder(thisCategory categoryId: Int){
        let productsDetails = self.completeCatalog[categoryId]
        let items = productsDetails?.items
        print("Products")
        for item in items! {
            print(item.name!)
        }
        
    }
    
    lazy var addToCartButton: UIButton = {
        let button = UIButton(frame: CGRect(x: self.view.frame.midX, y: self.view.frame.midY, width: 100, height: 50))
        button.addTarget(self, action: #selector(addToCart), for: .touchUpInside)
        button.setTitle("AddToCart", for: .normal)
        button.backgroundColor = UIColor.green
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.view.addSubview(addToCartButton)
        getAllMagentoStoreCategories()
    }
    
    @objc func addToCart(){
      let vc = AddToCartViewController()
      let items = completeCatalog[3]!.items 
      vc.selectedItem = items!.first!
      present(vc, animated: true, completion: nil)
      //  print("Adding To Cart")
    }

}
