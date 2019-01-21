//
//  ViewController.swift
//  MagentoAPI
//
//  Created by Work on 1/2/19.
//  Copyright © 2019 TheMysteryPuzzles. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var firstName: String?
    var lastName: String?
    var email: String?
    var password: String?
    
    func registerNewCustomer(){
        GetAccessTokenAndCreateCustomer()
    }
   
    lazy var createAccountView: CreateAccountView = {
        let view = CreateAccountView(frame: self.view.bounds)
      view.createAccVc = self
      return view
    }()
    
    var token: String?
    fileprivate func GetAccessTokenAndCreateCustomer() {
        
        let params = ["username":"WebApi", "password":"pB6Ym9xW1p"] as Dictionary<String, String>
        
        var request = URLRequest(url: URL(string: "http://co2.techrecto.com/rest/all/V1/integration/admin/token")!)
        request.httpMethod = "POST"
        request.httpBody = try? JSONSerialization.data(withJSONObject: params, options: [])
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            // print(response!)
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! String
                print(json)
                self.token = json
                
              //self.createCustomer(accessToken: json)
            } catch {
                print("\(error)")
            }
        })
        
        task.resume()
    }
    
    func present(accesToken: String){
        let vc = ProdcutsViewController()
        vc.customerToke = accesToken
       present(vc, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(createAccountView)
       // GetAccessTokenAndCreateCustomer()
      loginCustomer()
       
      //  GetAccessTokenAndCreateCustomer()
    }
    
    
    private func getCustomerDetails(token: String){
        var request = URLRequest(url: URL(string: "http://co2.techrecto.com/index.php/rest/V1/customers/me")!)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("Bearer "+token, forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request, completionHandler: { data, response, error -> Void in
            do {
                
                let jsonDecoder = JSONDecoder()
                let responseModel = try jsonDecoder.decode(CustomerDetails.self, from: data!)
                print("\(responseModel)")
            } catch {
                print("JSON Serialization error")
            }
        }).resume()
    }
    
    private func createCustomer(accessToken: String){
        
        
        let params = ["customer":["email":self.email!, "firstname":self.firstName!, "lastname":self.lastName!],"password": "Abc123456"] as [String : Any]
        
        var request = URLRequest(url: URL(string: "http://co2.techrecto.com/rest/all/V1/customers")!)
        request.httpMethod = "POST"
        request.httpBody = try! JSONSerialization.data(withJSONObject: params, options: [])
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("Bearer"+accessToken, forHTTPHeaderField: "Authorization")
        
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
             print(response!)
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! Dictionary<String, AnyObject>
                print(json)
                
            } catch {
                print("\(error)")
            }
        })
        
        task.resume()
    }




private func loginCustomer(){
    let params = ["username":"Dfbdfnks@gmail.com", "password":"Abc123456"] as Dictionary<String, String>
    
    var request = URLRequest(url: URL(string: "http://co2.techrecto.com/index.php/rest/V1/integration/customer/token")!)
    request.httpMethod = "POST"
    request.httpBody = try? JSONSerialization.data(withJSONObject: params, options: [])
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    
    let session = URLSession.shared
    let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
        // print(response!)
        do {
            let json = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! String
            print(json)
            self.present(accesToken: json)

             // self.getCustomerDetails(token: json)
    
        } catch {
            print("\(error)")
        }
    })
    
    task.resume()
}


}
