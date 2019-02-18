//
//  ProdutsViewController.swift
//  Magneta Sqquare
//
//  Created by Work on 1/26/19.
//  Copyright © 2019 TheMysteryPuzzles. All rights reserved.
//

import UIKit

class ProductsViewController: UIViewController {

    var categoriesResponse: Categories?
    var allCategories = [String]()
    var completeCatalog = [Int:ProductDetailsJSONModel]()
    var windowCoveringsItems =  [Item]()
    var windowCoverings = [String]()
    
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
            allCategories.append(items.name)
            getAllProdcutsUnderCategory(withProductId: items.id, position: items.position)
        }
        DispatchQueue.main.async {
            self.productsView.windowCoveringsLabel.text = self.allCategories.first!
            self.productsView.foldingDoorsLabel.text = self.allCategories[1]
            self.productsView.wirelessSecurityLabel.text = self.allCategories.last
        }
    }
    
    private func getAllProdcutsUnderCategory(withProductId id: Int, position: Int){
        var request = URLRequest(url: URL(string: hostName+"/rest/V1/products/?searchCriteria[filter_groups][0][filters][0][field]=category_id&searchCriteria[filter_groups][0][filters][0][value]="+"\(id)"+"&searchCriteria[filter_groups][0][filters][0][condition_type]=eq")!)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("Bearer "+adminToken!, forHTTPHeaderField:
            "Authorization")
        
        URLSession.shared.dataTask(with: request, completionHandler: { data, response, error -> Void in
            do {
                
                let jsonDecoder = JSONDecoder()
                let responseModel = try jsonDecoder.decode(ProductDetailsJSONModel.self, from: data!)
                print("Category ID: \(id)")
                
                self.completeCatalog[id] = responseModel
                
                self.getAllProductsUnder(thisCategory: id)
                
               if position == 1 {
                    self.windowCoveringsItems = responseModel.items!
               }else if position == 2 {
                  //self.foldi
               }else if position == 3 {
                
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
                self.productsView.windowCoveringsCollectionView.reloadData()
            }
        }
    }

    lazy var productsView: ProductView = {
    let view = ProductView(frame: self.view.bounds)
    view.windowCoveringsCollectionView.dataSource = self
    view.windowCoveringsCollectionView.delegate = self
    return view
    }()
  
    private func applyAttributedTitle(){
        let navLabel = UILabel()
        let navTitle = NSMutableAttributedString(string: "Products", attributes:[ NSAttributedString.Key.font: UIFont(name: "Billabong", size: 28.0)! ])
        
        navLabel.attributedText = navTitle
        self.navigationItem.titleView = navLabel
    }
    override func viewDidAppear(_ animated: Bool) {
       
       self.navigationController?.navigationBar.isHidden = false
       productsView.setupProductView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       applyAttributedTitle()
       self.view.backgroundColor = UIColor.white
        self.view.addSubview(productsView)
        getAllMagentoStoreCategories()
        
    }
}

extension ProductsViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView.tag == 1{
            print("Item:\(windowCoveringsItems.count)")
            return windowCoveringsItems.count
        }else if collectionView.tag == 2{
            return 2
        }else{
            return 3
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductNameCell", for: indexPath) as! ProdcustNameCell
         cell.backgroundColor = #colorLiteral(red: 0.1514958441, green: 0.726865232, blue: 0.9147748351, alpha: 1)
        
        cell.nameLabel.text = windowCoveringsItems[indexPath.item].name
        
        for attr in windowCoveringsItems[indexPath.item].customAttributes!{
            if attr.attributeCode == "thumbnail" {
                
                var thumbNailUrl = "\(attr.value.unsafelyUnwrapped)"
                thumbNailUrl = String(thumbNailUrl.dropFirst(8))
                thumbNailUrl = String(thumbNailUrl.dropLast(2))
                
                print("\(thumbNailUrl)")
                    if let url = URL(string: webServerDocumentRootUrl + thumbNailUrl){
                        
                        cell.productImageView.downloadAndSetImage(from: url, contentMode: .scaleAspectFill)
                    }
                }
            }
        return cell
}
}

extension ProductsViewController: UICollectionViewDelegate{
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let viewController = ProductDetailViewController()
        print("Item: \(indexPath.item)")
        viewController.selectedItem = self.windowCoveringsItems[indexPath.item]
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}


class ProdcustNameCell : UICollectionViewCell {
    
    
    lazy var productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.masksToBounds = true
        imageView.backgroundColor = UIColor.lightGray
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private func setupProductImageConstraints(){
        NSLayoutConstraint.activate([
            productImageView.topAnchor.constraint(equalTo: self.topAnchor),
            productImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            productImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            productImageView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.8)
            
            ])
    }
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .center
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        label.font = UIFont(name: "Kefa", size: 15)
        label.backgroundColor = UIColor.clear
        return label
    }()
    
    private func setupNameLabelConstraints(){
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: self.productImageView.bottomAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            nameLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(productImageView)
        setupProductImageConstraints()
        self.addSubview(nameLabel)
        setupNameLabelConstraints()
        
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


