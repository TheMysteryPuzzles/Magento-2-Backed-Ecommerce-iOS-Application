//
//  LaunchScreenViewController.swift
//  MagentoAPI
//
//  Created by Work on 1/31/19.
//  Copyright © 2019 TheMysteryPuzzles. All rights reserved.
//

import UIKit

class LaunchScreenViewController: UIViewController {

    lazy var logoImageView: UIImageView = {
       let imageView = UIImageView(image: UIImage(named: "ic_logo"))
       imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private func setupLogoImageViewConstraints(){
        NSLayoutConstraint.activate([
            logoImageView.centerXAnchor.constraint(equalTo: self.view.safeCenterXAnchor),
            logoImageView.centerYAnchor.constraint(equalTo: self.view.safeCenterYAnchor),
            logoImageView.widthAnchor.constraint(equalToConstant: 178.0),
            logoImageView.heightAnchor.constraint(equalToConstant: 151.0)
            ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        DispatchQueue.main.async {
            self.view.addSubview(self.logoImageView)
            self.setupLogoImageViewConstraints()
        }
        
        GetAdminAccessToken(completionHandler: { [unowned self] in
            DispatchQueue.main.async(execute: {
                let rootVc = UINavigationController(rootViewController: MainMenuViewController())
                navBarHeight = rootVc.navigationBar.frame.height
                self.present(rootVc, animated: true, completion: nil)
            })
        })
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    fileprivate func GetAdminAccessToken(completionHandler: @escaping ()->()) {
        
        let params = ["username":"WebApi", "password":"pB6Ym9xW1p"] as Dictionary<String, String>
        
        var request = URLRequest(url: URL(string: hostName+"/rest/all/V1/integration/admin/token")!)
        request.httpMethod = "POST"
        request.httpBody = try? JSONSerialization.data(withJSONObject: params, options: [])
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let session = URLSession.shared
       DispatchQueue.global(qos: .background).async {
        let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            // print(response!)
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! String
                print("ADMIN TOKEN: "+json)
                adminToken = json
                completionHandler()
            } catch {
                print("\(error)")
            }
        })
        task.resume()
    }
    }
    
}
