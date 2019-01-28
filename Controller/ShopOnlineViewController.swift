//
//  ViewController.swift
//  Magneta Sqquare
//
//  Created by Work on 1/1/19.
//  Copyright © 2019 TheMysteryPuzzles. All rights reserved.
//

import UIKit

class ShopOnlineViewController: UIViewController {
    
    var flag = false
    var items = [String: [Product]]()
    var categories = ["Window Coverings", "Folding Doors", "Wireless Security Systems"]
    var windowCoverings = [String]()
  
    var images = [UIImage(named: "P1"),UIImage(named: "P2"),UIImage(named: "P3"),UIImage(named: "P4"),UIImage(named: "P5"),UIImage(named: "P6"),UIImage(named: "P7")]
    
    var images1 = [UIImage(named: "P13"),UIImage(named: "P6"),UIImage(named: "P8"),UIImage(named: "P8"),UIImage(named: "P5"),UIImage(named: "P5"),UIImage(named: "P16")]
    
    var images2 = [UIImage(named: "P15"),UIImage(named: "P14"),UIImage(named: "P13"),UIImage(named: "P14"),UIImage(named: "P15"),UIImage(named: "P16"),UIImage(named: "P17")]
    
    var images3 = [UIImage(named: "P20"),UIImage(named: "P12"),UIImage(named: "P13"),UIImage(named: "P14"),UIImage(named: "P15"),UIImage(named: "P16"),UIImage(named: "P17")]
    
    var subCategories = [String:[String]]()

    override func viewDidAppear(_ animated: Bool) {
       super.viewDidAppear(animated)
       productsView.setupCategoryLabelFonts()
    }

    lazy var productsView: ShopOnlineView = {
        let productsView = ShopOnlineView(frame: self.view.bounds)
        productsView.productsList.delegate = self
        productsView.productsList.dataSource = self
        return productsView
    }()
    
    var categoriesResponse: Categories?
    var completeCatalog = [Int:ProductDetailsModel]()
    var windowCoveringsItems =  [Item]()
    
    private func getAllMagentoStoreCategories(){
        var request = URLRequest(url: URL(string: hostName+"/rest/V1/categories")!)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("Bearer "+adminToken!, forHTTPHeaderField:
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
        var request = URLRequest(url: URL(string: hostName+"//rest/V1/products/?searchCriteria[filter_groups][0][filters][0][field]=type_id&searchCriteria[filter_groups][0][filters][0][value]=configurable+&searchCriteria[filter_groups][0][filters][0][condition_type]=eq")!)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("Bearer "+adminToken!, forHTTPHeaderField:
            "Authorization")
        
        URLSession.shared.dataTask(with: request, completionHandler: { data, response, error -> Void in
            do {
                
                let jsonDecoder = JSONDecoder()
                let responseModel = try jsonDecoder.decode(ProductDetailsModel.self, from: data!)
                print("Category ID: \(id)")
                
                self.completeCatalog[id] = responseModel
               
                self.getAllProductsUnder(thisCategory: id)
                
                if id == 3 {
                    self.windowCoveringsItems = responseModel.items!
                  /*  if customerToken != nil {
                        //self.addToCart()
                    }*/
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
            windowCoverings.append(item.name!)
          print(item.name!)
        }
        if categoryId == 3{
        DispatchQueue.main.async {
            self.productsView.productsList.reloadData()
        }
    }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.leftBarButtonItem = nil
        let button = UIButton(type: .custom)
        button.setTitle("SignUp|Login", for: .normal)
        button.addTarget(self, action: #selector(handleLoginRegister), for: .touchUpInside)
        button.frame = CGRect(x: 0.0, y: 0.0, width: 35.0, height: 35.0)
        
        let item1 = UIBarButtonItem(customView: button)
        
        let button2 = UIButton(type: .custom)
        button2.setImage(UIImage (named: "ic_cart"), for: .normal)
        button2.imageView?.contentMode = .scaleAspectFit
        button2.addTarget(self, action: #selector(handleCartButton), for: .touchUpInside)
        button2.frame = CGRect(x: 0.0, y: 0.0, width: 35.0, height: 35.0)

        let item2 = UIBarButtonItem(customView: button2)
      
        self.navigationItem.setRightBarButtonItems([item2,item1], animated: true)
        self.view.addSubview(productsView)
        self.view.backgroundColor = UIColor.black
        getAllMagentoStoreCategories()
    }
    
    
    @objc private func handleCartButton(){
       
        DispatchQueue.main.async {
     self.navigationController?.pushViewController(AddToCartViewController(), animated: true)
        }
    }
    
    @objc private func handleLoginRegister(){
        DispatchQueue.main.async {
            self.navigationController?.pushViewController(LoginViewController(), animated: true)
        }
    }
    
    @objc func addToCart(){
        let vc = AddToCartViewController()
      //  let items = completeCatalog[3]!.items
       // vc.selectedItem = items!.first!
        present(vc, animated: true, completion: nil)
        //  print("Adding To Cart")
    }

    
    
}




