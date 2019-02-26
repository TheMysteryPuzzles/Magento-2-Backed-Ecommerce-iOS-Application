//
//  RequestFreeVisitViewController.swift
//  MagentoAPI
//
//  Created by Work on 2/10/19.
//  Copyright © 2019 TheMysteryPuzzles. All rights reserved.
//

import UIKit

class RequestFreeVisitViewController: UIViewController {

    
    lazy var requestFreeSalesVisitView: RequestFreeSalesVisitView = {
        let view = RequestFreeSalesVisitView(frame: self.view.bounds)
        view.vc = self
        return view
    }()
    
    func handleScheduleButtonTapped(){
        
        let productIntrested = requestFreeSalesVisitView.chooseProductIntrestedIn.titleLabel?.text
        let name = requestFreeSalesVisitView.fullNameTextField.text
        let street = requestFreeSalesVisitView.streetTextField.text! + requestFreeSalesVisitView.street2TextField.text!
        let city = requestFreeSalesVisitView.cityTextField.text!
        let phone = requestFreeSalesVisitView.phoneTextField.text!
        let email = requestFreeSalesVisitView.emailTextField.text!
        let timing = requestFreeSalesVisitView.timingLabel.text
        
        let params = ["product" : productIntrested!,
            "name" : name!,
            "city" : city,
            "state" : "State",
            "street": street,
            "telephone": phone,
            "mobile": phone,
            "email" : email,
            "timing": timing!
            ] as Dictionary<String, Any>
        
        var request = URLRequest(url: URL(string: "http://157.230.218.91/magenta/blindapi/enquiry/post")!)
        
        request.httpMethod = "POST"
        
        request.httpBody = try? JSONSerialization.data(withJSONObject: params, options: [])
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let session = URLSession.shared
        DispatchQueue.global(qos: .background).async {
            let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
                // print(response!)
                do {
                    let _ = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! [String: Any]
                    DispatchQueue.main.async {
                        let alertController = UIAlertController(title: "Successfuly Delivered", message: "Your free visit request has been received . You will receive confirmation shortly", preferredStyle: .alert)
                        
                        let OKAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction!) in
                            
                            self.navigationController?.popViewController(animated: true)
                        }
                        alertController.addAction(OKAction)
                        self.present(alertController, animated: true, completion: nil)
                    }
                } catch {
                    print("\(error)")
                }
            })
            task.resume()
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
           requestFreeSalesVisitView.chooseProductIntrestedInDropDown.bottomOffset = CGPoint(x: 0, y: requestFreeSalesVisitView.chooseProductIntrestedIn.bounds.height)
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        self.view.addSubview(requestFreeSalesVisitView)
    }
    

 
}
