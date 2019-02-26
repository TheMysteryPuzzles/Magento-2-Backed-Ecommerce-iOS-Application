//
//  ContactUsViewController.swift
//  MagentoAPI
//
//  Created by Work on 2/15/19.
//  Copyright © 2019 TheMysteryPuzzles. All rights reserved.
//

import UIKit
/*  http://157.230.218.91/magenta/blindapi/contacts/post?name=Adeel&email=a@a.com&phone=123456&comment=Hello How are you*/
class ContactUsViewController: UIViewController {

    lazy var contactUsView: ContactUsView = {
        let view = ContactUsView(frame: self.view.bounds)
        view.vc = self
        return view
    }()
    
    func handleContactUsSend(){
        let name = contactUsView.fullNameTextfeild.text
        let email = contactUsView.emailTextfeild.text
        let phone = contactUsView.phoneTextfeild.text
        let msg = contactUsView.msgTextfeild.text
        
        let params = ["name": name!, "email":email!, "phone": phone!, "msg": msg!] as Dictionary<String, String>
        
        let string =  "http://157.230.218.91/magenta/blindapi/contacts/post?name="+"\(name!)"+"&email="+"\(email!)"+"&phone="+"\(phone!)"+"&comment="+"\(msg!)"
        
        print(string)
        
        var request = URLRequest(url: URL(string: string)!)
            
        request.httpMethod = "POST"
        request.httpBody = try? JSONSerialization.data(withJSONObject: params, options: [])
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let session = URLSession.shared
        DispatchQueue.global(qos: .background).async {
            let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
                 print(response!)
                do {
                    let json = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! [String:Any]
                   print("\(json)")
                    DispatchQueue.main.async {
                        let alertController = UIAlertController(title: "Successfuly Delivered", message: "Thanks for contacting us with your comments and questions. We'll respond to you very soon", preferredStyle: .alert)
                        
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(contactUsView)

    }
    
}
