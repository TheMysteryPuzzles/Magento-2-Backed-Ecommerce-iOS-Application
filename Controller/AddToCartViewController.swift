//
//  AddToCartViewController.swift
//  Magneta Sqquare
//
//  Created by Work on 1/26/19.
//  Copyright © 2019 TheMysteryPuzzles. All rights reserved.
//


// Remove product label
//dynamic categories
// catalog
//


import UIKit

class AddToCartViewController: UIViewController {

    var selectedItem: Item?
    var selectedAttributes: CustomAttributes!
    
    var cartId: Int?{
        didSet{
            let defaults = UserDefaults.standard
            defaults.set("\(cartId!)", forKey: "cartId")
        }
    }
    var quantity = 3
    var cartInformation: CartInformationJSONModel?
    
    private func createACartForLoggedInCustomer(){
        var request = URLRequest(url: URL(string: hostName+"/rest/default/V1/carts/mine")!)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("Bearer "+customerToken, forHTTPHeaderField: "Authorization")
        
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            // print(response!)
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! Int
                print("New Cart Created")
                print("Cart ID: \(json)")
                self.cartId = json
               // self.addItemToTheCart()
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
        request.addValue("Bearer "+customerToken, forHTTPHeaderField: "Authorization")
        
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            // print(response!)
            do {
                
                let jsonDecoder = JSONDecoder()
                let responseModel = try jsonDecoder.decode(AddItemToCartJSONModel.self, from: data!)
                print("Details Of Products Added To Cart")
                print(responseModel.productType!)
                print(responseModel.name!)
                //self.getCartTotalCost()
                self.setShippingInformation()
                
            } catch {
                print("\(error)")
            }
        })
        task.resume()
    }

    
    private func getSelectedItemInformation(){
        var request = URLRequest(url: URL(string: hostName+"/rest/V1/carts/mine/")!)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("Bearer "+customerToken, forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request, completionHandler: { data, response, error -> Void in
            print(response!)
            do {
                let jsonDecoder = JSONDecoder()
                let responseModel = try jsonDecoder.decode(CartInformationJSONModel.self, from: data!)
                self.cartInformation = responseModel
                
                if self.cartInformation?.itemsCount != nil{
                    self.addToCartView.emptyCartLabel.isHidden = true
                }
                self.addItemToTheCart()
                
                //   self.setShippingInformation()
                
            } catch {
                print("JSON Serialization error")
            }
        }).resume()
    }
    
    private func getLoggedInCustomerCartInformation(){
        var request = URLRequest(url: URL(string: hostName+"/rest/V1/carts/mine/")!)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("Bearer "+customerToken, forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request, completionHandler: { data, response, error -> Void in
            print(response!)
            do {
                let jsonDecoder = JSONDecoder()
                let responseModel = try jsonDecoder.decode(CartInformationJSONModel.self, from: data!)
                self.cartInformation = responseModel
             
                if self.cartInformation?.itemsCount != nil{
                  self.addToCartView.emptyCartLabel.isHidden = true
                }
                self.addItemToTheCart()
                
             //   self.setShippingInformation()
                
            } catch {
                print("JSON Serialization error")
            }
        }).resume()
    }

    
    private func getCartTotalCost(){
        var request = URLRequest(url: URL(string: hostName+"/rest/V1/carts/mine/totals")!)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("Bearer "+customerToken, forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request, completionHandler: { data, response, error -> Void in
            do {
                let jsonDecoder = JSONDecoder()
                let responseModel = try jsonDecoder.decode(CartGrandTotalJSONModel.self, from: data!)
                
                print("GrandTotal :"+"\(responseModel.grandTotal)")
                self.setShippingInformation()
                
            } catch {
                print("JSON Serialization error")
            }
        }).resume()
    }
    
    private func setShippingInformation(){
        let params = [
            "cartId": cartId!,
            "address": [
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
                "customer_id": customerId!,
                "email": "jdoe@example.com",
                "telephone": "(512) 555-1111",
                "same_as_billing": 0
            ],
            "useForShipping": true
            ] as [String : Any]
        
        var request = URLRequest(url: URL(string: hostName+"/rest/V1/carts/mine/billing-address")!)
        request.httpMethod = "POST"
        request.httpBody = try? JSONSerialization.data(withJSONObject: params, options: [])
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("Bearer "+customerToken, forHTTPHeaderField: "Authorization")
        
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            // print(response!)
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! String
                print("Shipping Adress ID: "+json)
                
              //  self.setPaymentInformationAndPlaceNewOrder()
            } catch {
                print("\(error)")
            }
        })
        task.resume()
    }
    
    private func setPaymentInformationAndPlaceNewOrder(){
        let params =  [
            "paymentMethod": [
                "poNumber": "1",
                "method": "cashondelivery"
            ],
            "billingAddress": [
                "id": 60,
                "region": "Arkansas",
                "regionId": 5,
                "regionCode": "AR",
                "countryId": "US",
                "street": [
                    "Whitefield,New York"
                ],
                "company": "IBM",
                "telephone": "94354545",
                "postcode": "234533",
                "city": "New York",
                "firstname": "Hello",
                "lastname": "Again",
                "prefix": "address_",
                "customerId": customerId!,
                "email": "junaidiqbalturk@gmail.com",
                "sameAsBilling": 0,
                "customerAddressId": 0,
                "saveInAddressBook": 1
            ]
            ] as [String : Any]
        
        var request = URLRequest(url: URL(string: hostName+"/rest/V1/carts/mine/payment-information")!)
        request.httpMethod = "POST"
        request.httpBody = try? JSONSerialization.data(withJSONObject: params, options: [])
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("Bearer "+customerToken, forHTTPHeaderField: "Authorization")
        
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            // print(response!)
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! String
                print("Order ID: "+json)
            } catch {
                print("\(error)")
            }
        })
        task.resume()
    }

   lazy var addToCartView: AddToCartView = {
       let view = AddToCartView(frame: self.view.bounds)
       view.addToCartViewController = self
       return view
    }()
    

    override func viewDidLoad() {
      super.viewDidLoad()

     /* self.view.addSubview(addToCartView)
         self.addToCartView.emptyCartLabel.isHidden = true
      let cartId = defaults.string(forKey: "cartId")
      if cartId == nil{
         self.addToCartView.emptyCartLabel.isHidden = false
         createACartForLoggedInCustomer()
      }else{
         getLoggedInCustomerCartInformation()
       }*/
    }
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
