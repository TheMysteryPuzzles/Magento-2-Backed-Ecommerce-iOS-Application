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
    var slogans = [String]()
    
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
    
    
    func handleContactUs(){
        self.navigationController?.pushViewController(ContactUsViewController(), animated: true)
    }
    func handleShopOnlineTab(){
        self.navigationController?.pushViewController(ShopOnlineViewController(), animated: true)
    }
    
    func handleWindowCoveringsSelected(){
        let vc = ShopOnlineViewController()
        vc.selectedCategory = .WindowCoverings
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func handleFoldingDoorsSelected(){
        let vc = ShopOnlineViewController()
        vc.selectedCategory = .FoldingDoors
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func handleWirelesSecuritySelected(){
        let vc = ShopOnlineViewController()
        vc.selectedCategory = .WirelessSecurity
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
    lazy var mainMenuView: MainMenuView = {
       let view = MainMenuView(frame: self.view.bounds)
       view.mainViewController = self
       return view
    }()
    
    override func viewDidAppear(_ animated: Bool) {
        
       super.viewDidAppear(animated)
      //  self.mainMenuView.shopOnlineView.applyCategoryLabelsTheme()
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        getAllMagentoStoreCategories()
       
    }
    
    
     func handleRequestSalesVisit(){
        let controller = RequestFreeVisitViewController()
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    func handleVisitShowRoomViewSelected(){
        let controller = VisitShowroomViewController()
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    
    @objc private func handleLoginRegister(){
        
    }

    override var prefersStatusBarHidden: Bool {
        return false
    }

}

extension MainMenuViewController {
    
    private func getSlogans(){
        var request = URLRequest(url: URL(string: "http://157.230.218.91/magenta/blindapi/slogans")!)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request, completionHandler: { data, response, error -> Void in
            do {
                let jsonDecoder = JSONDecoder()
                let responseModel = try jsonDecoder.decode(SloganJSONModel.self, from: data!)
                for slogans in responseModel.response!.data!.storelocations! {
                    self.slogans.append(slogans.slogan!)
                }
                self.mainMenuView.slogans = self.slogans
            } catch {
                print("JSON Serialization error")
            }
        }).resume()
    }
    
    
    
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
                print(responseModel.name)
                self.getSlogans()
                self.getAllCategories()
            } catch {
                print("JSON Serialization error")
            }
        }).resume()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        // self.mainMenuView.shopOnlineView.applyCategoryLabelsTheme()
    }
    
    private func getAllCategories(){
        print("Category Names :")
        for items in categoriesResponse!.childrenData{
            print(items.name)
            categories.append(items.name)
        }
        DispatchQueue.main.sync {
            let text = String(self.categories[2].dropLast(8))
            self.mainMenuView.windowCoveringsLabel.text = self.categories.first
            self.mainMenuView.foldingDoorsLabel.text = self.categories[1]
            self.mainMenuView.wirelessSecurityLabel.text = text
            
             self.mainMenuView.windowCoveringsView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
            self.view.addSubview(self.mainMenuView)
            self.performAnimations()
        }
        DispatchQueue.main.async {
            
        self.mainMenuView.otherHomeOptionsContainerView.Hide()
        self.mainMenuView.otherHomeOptionsContainerView.animShow()
        }
        
       
    }

}
