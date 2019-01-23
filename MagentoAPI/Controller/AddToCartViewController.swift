//
//  AddToCartViewController.swift
//  MagentoAPI
//
//  Created by Work on 1/22/17.
//  Copyright © 2017 TheMysteryPuzzles. All rights reserved.
//

import UIKit

class AddToCartViewController: UIViewController {

    var selectedItem: Item?
    var cartId: Int?
    var quantity = 3
    
    private func createACartForLoggedInCustomer(){
        var request = URLRequest(url: URL(string: hostName+"/rest/default/V1/carts/mine")!)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("Bearer "+customerToken!, forHTTPHeaderField: "Authorization")
        
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            // print(response!)
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! Int
                print("New Cart Created")
                print("Cart ID: \(json)")
                self.cartId = json
                self.addItemToTheCart()
            } catch {
                print("\(error)")
            }
        })
        
        task.resume()
    }
    
    
    private func addItemToTheCart(){
        let params = ["cartItem": ["sku": selectedItem!.sku!,"qty": quantity,"quote_id": cartId!]]
        
        var request = URLRequest(url: URL(string: hostName+"/rest/default/V1/carts/mine/items")!)
        request.httpMethod = "POST"
        request.httpBody = try? JSONSerialization.data(withJSONObject: params, options: [])
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
         request.addValue("Bearer "+customerToken!, forHTTPHeaderField: "Authorization")
        
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            // print(response!)
            do {
                
                let jsonDecoder = JSONDecoder()
                let responseModel = try jsonDecoder.decode(AddItemToCartModel.self, from: data!)
               print("Details Of Products Added To Cart")
                print(responseModel.productType!)
                print(responseModel.name!)
            } catch {
                print("\(error)")
            }
        })
        task.resume()
    }
  
    /*private func getShipingMethods(){
        let params = ["cartId": cartId!]
        var request = URLRequest(url: URL(string: hostName+"/rest/V1/carts/mine/shipping-methods")!)
        request.httpMethod = "GET"
         request.httpBody = try? JSONSerialization.data(withJSONObject: params, options: [])
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("Bearer "+customerToken!, forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request, completionHandler: { data, response, error -> Void in
            print(response!)
            do {
                
                let jsonDecoder = JSONDecoder()
                let responseModel = try jsonDecoder.decode(ShipingMethodsModel.self, from: data!)
                for response in responseModel {
                   print(response.carrierCode)
                }
             
            } catch {
                print("JSON Serialization error")
            }
        }).resume()
    }
    */
    /*
    private func estimateShippingCost(){
        let params = [  "address": [
            "region": "New York",
            "region_id": 43,
            "region_code": "NY",
            "country_id": "US",
            "street": [
            "123 Oak Ave"
            ],
            "postcode": "10577",
            "city": "Purchase",
            "firstname": "Jane",
            "lastname": "Doe",
            "customer_id": 4,
            "email": "jdoe@example.com",
            "telephone": "(512) 555-1111",
            "same_as_billing": false
            ]
        ]
  
        var request = URLRequest(url: URL(string: hostName+"/rest/default/V1/carts/mine/estimate-shipping-methods")!)
        request.httpMethod = "POST"
        request.httpBody = try? JSONSerialization.data(withJSONObject: params, options: [])
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("Bearer "+customerToken!, forHTTPHeaderField: "Authorization")
        
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            // print(response!)
            do {
                
                let jsonDecoder = JSONDecoder()
                let responseModel = try jsonDecoder.decode(AddItemToCartModel.self, from: data!)
                print(responseModel.productType!)
                print(responseModel.name!)
                
                
            } catch {
                print("\(error)")
            }
        })
        task.resume()
    }*/

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        createACartForLoggedInCustomer()
        //estimateShippingCost()
    }

}
