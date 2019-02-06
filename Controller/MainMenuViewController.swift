//
//  GetStartedViewController.swift
//  Magneta Sqquare
//
//  Created by Work on 1/2/19.
//  Copyright © 2019 TheMysteryPuzzles. All rights reserved.
//

import UIKit

class MainMenuViewController: UIViewController {
  
   var categoriesResponse: Categories?
    var categories = [String]()
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    private func performAnimations(){
        
            UIView.animate(withDuration: 2.0, animations: {() -> Void in
                self.mainMenuView.windowCoveringsView.transform = CGAffineTransform(scaleX: 1, y: 1)
            })
    }
    
    
    override open var shouldAutorotate: Bool {
        return false
    }
    
    func handleProductsTab(){
      self.navigationController?.pushViewController(ProductsViewController(), animated: true)
    }
    
    func handleShopOnlineTab(){
        self.navigationController?.pushViewController(ShopOnlineViewController(), animated: true)
    }
    
    
    
    lazy var mainMenuView: MainMenuView = {
       let view = MainMenuView(frame: self.view.bounds)
       view.mainViewController = self
       return view
    }()
    
   
    
    override func viewDidAppear(_ animated: Bool) {
        
       super.viewDidAppear(animated)
        self.mainMenuView.shopOnlineView.applyCategoryLabelsTheme()
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        getAllMagentoStoreCategories()
        
    }
    
    
    @objc private func handleLoginRegister(){
        
    }

    override var prefersStatusBarHidden: Bool {
        return false
    }

}

extension MainMenuViewController {
    
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
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
         self.mainMenuView.shopOnlineView.applyCategoryLabelsTheme()
    }
    
    private func getAllCategories(){
        print("Category Names :")
        for items in categoriesResponse!.childrenData{
            categories.append(items.name)
        }
        DispatchQueue.main.sync {
            let text = String(self.categories[1].dropLast(7))
            self.mainMenuView.windowCoveringsLabel.text = self.categories.last
            self.mainMenuView.foldingDoorsLabel.text = self.categories.first
            self.mainMenuView.wirelessSecurityLabel.text = text//self.categories[1]
             self.mainMenuView.windowCoveringsView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
            self.view.addSubview(self.mainMenuView)
            self.performAnimations()

        }
        DispatchQueue.main.async {
            
        self.mainMenuView.otherHomeOptionsContainerView.Hide()
            
            self.mainMenuView.shopOnlineView.applyHomeOptionsTheme()
             self.mainMenuView.requestFreeSalesVisitView.applyHomeOptionsTheme()
             self.mainMenuView.aboutUsView.applyHomeOptionsTheme()
             self.mainMenuView.visitShowRoomView.applyHomeOptionsTheme()

            
        self.mainMenuView.requestFreeSalesVisitView.insertSubview(self.mainMenuView.requestFreeSalesVisitImageView, at: 1)
            self.mainMenuView.setuprequestFreeSalesVisitImageViewConstraints()
            
            
            self.mainMenuView.visitShowRoomView.insertSubview(self.mainMenuView.visitShowRoomImageView, at: 1)
            self.mainMenuView.setupVisitShowRoomImageViewConstraints()
            
            self.mainMenuView.shopOnlineView.insertSubview(self.mainMenuView.shopOnlineImageView, at: 2)
            self.mainMenuView.setupShopOnlineImageViewConstraints()
            
            
            self.mainMenuView.aboutUsView.addSubview(self.mainMenuView.aboutUsImageView)
           self.mainMenuView.setupAboutUsImageViewConstraints()
            
            self.mainMenuView.requestFreeSalesVisitView.addSubview(self.mainMenuView.requestFreeSalesVisitLabel)
            self.mainMenuView.setupRequestFreeSalesVisitLabelConstraints()
            
             self.mainMenuView.shopOnlineView.insertSubview(self.mainMenuView.shopOnlineLabel, at: 1)
            self.mainMenuView.setupShopOnlineLabelConstraints()
            self.mainMenuView.shopOnlineView.bringSubviewToFront(self.mainMenuView.shopOnlineLabel)
            
            self.mainMenuView.aboutUsView.addSubview(self.mainMenuView.aboutUsLabel)
           self.mainMenuView.setupAboutUsLabelConstraints()
            self.mainMenuView.aboutUsView.bringSubviewToFront(self.mainMenuView.aboutUsLabel)
            
            self.mainMenuView.visitShowRoomView.addSubview(self.mainMenuView.visitShowroomLabel)
            self.mainMenuView.setupVisitShowroomLabelConstraints()
            self.mainMenuView.visitShowRoomView.bringSubviewToFront(self.mainMenuView.visitShowroomLabel)
            
          self.mainMenuView.otherHomeOptionsContainerView.animShow()
        }
        
       
    }

}
