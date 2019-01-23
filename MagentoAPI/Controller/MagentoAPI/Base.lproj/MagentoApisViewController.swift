//
//  ViewController.swift
//  MagentoAPI
//
//  Created by Work on 1/2/19.
//  Copyright © 2019 TheMysteryPuzzles. All rights reserved.
//

import UIKit

var admintoken: String?
var customerToken: String?
var customerId: Int?

class MagentoApisViewController: UIViewController {

    var currencyInformation: CurrencyInformationModel?
    var countryInformation: CountryInformationModel?
    
    var firstName: String?
    var lastName: String?
    var email: String?
    var password: String?
    
    func registerNewCustomer(){
         self.createANewCustomerOnMagentoStore()
    }
   
    lazy var createAccountView: CreateAccountView = {
        let view = CreateAccountView(frame: self.view.bounds)
      view.createAccVc = self
      return view
    }()

    
    func present(){
        let vc = ProdcutsViewController()
       present(vc, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(createAccountView)
       // getCustomerAccessToken()
       getCurrencyInformation()
      getCountryInformation()
    }

    private func getCustomerDetails(){
        var request = URLRequest(url: URL(string: hostName+"/index.php/rest/V1/customers/me")!)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("Bearer "+customerToken!, forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request, completionHandler: { data, response, error -> Void in
            do {
                
                let jsonDecoder = JSONDecoder()
                let responseModel = try jsonDecoder.decode(CustomerDetails.self, from: data!)
               // print("\(responseModel.id)")
                print("CustomerID :"+"\(responseModel.id)")
                customerId = responseModel.id
            } catch {
                print("JSON Serialization error")
            }
        }).resume()
    }
    
    private func createANewCustomerOnMagentoStore(){
        
        let params = [
            "customer":[
                "email":email!,
                "firstname":firstName!,
                "lastname":lastName!
            ],
            "password": "Abc123456"
            ] as [String : Any]
        
        var request = URLRequest(url: URL(string: hostName+"/rest/all/V1/customers")!)
        request.httpMethod = "POST"
        request.httpBody = try! JSONSerialization.data(withJSONObject: params, options: [])
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("Bearer"+admintoken!, forHTTPHeaderField: "Authorization")
        
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
             print(response!)
            do {
                _ = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! Dictionary<String, AnyObject>
                self.getCustomerAccessToken()
            } catch {
                print("\(error)")
            }
        })
        
        task.resume()
    }


private func getCustomerAccessToken(){
    let params = ["username":email!, "password":"Abc123456"] as Dictionary<String, String>
    
    var request = URLRequest(url: URL(string: hostName+"/index.php/rest/V1/integration/customer/token")!)
    request.httpMethod = "POST"
    request.httpBody = try? JSONSerialization.data(withJSONObject: params, options: [])
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    
    let session = URLSession.shared
    let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
        do {
            let json = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! String
            print("CustomerToken: "+json)
            customerToken = json
            self.getCustomerDetails()
        } catch {
            print("\(error)")
        }
    })
    
    task.resume()
}
    
    private func getCurrencyInformation(){
        var request = URLRequest(url: URL(string: hostName+"/rest/all/V1/directory/currency")!)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    
        URLSession.shared.dataTask(with: request, completionHandler: { data, response, error -> Void in
            do {
                
                let jsonDecoder = JSONDecoder()
                let responseModel = try jsonDecoder.decode(CurrencyInformationModel.self, from: data!)
               self.currencyInformation = responseModel
                print("Currency Code: "+responseModel.baseCurrencyCode!)
            } catch {
                print("JSON Serialization error")
            }
        }).resume()
        
    }
    
    private func getCountryInformation(){
        var request = URLRequest(url: URL(string: hostName+"/rest/all/V1/directory/countries")!)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request, completionHandler: { data, response, error -> Void in
            do {
                let jsonDecoder = JSONDecoder()
                let responseModel = try jsonDecoder.decode(CountryInformationModel.self, from: data!)
                self.countryInformation = responseModel
                print("AVAILABLE COUNTRIES: ")
                for item in responseModel {
                    print(item.fullNameEnglish!)
                }
            } catch {
                print("JSON Serialization error")
            }
        }).resume()
        
    }


}
