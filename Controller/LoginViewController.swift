//
//  LoginViewController.swift
//  Storify
//
//  Created by Work on 2/12/18.
//  Copyright © 2018 Next Level. All rights reserved.
//

import UIKit
var customerToken = ""
var customerId: Int?

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    var userName: String?
    var password: String?
    
    var activityIndicator: UIActivityIndicatorView!
    
    lazy var loginConatinerView: UIView = {
        let cView = UIView()
        cView.backgroundColor = UIColor.clear
        cView.layer.cornerRadius = 5
        cView.layer.masksToBounds = true
        cView.translatesAutoresizingMaskIntoConstraints = false
        return cView
    }()
    
    lazy var loginRegisterButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Register", for: .normal)
        button.setTitleColor(#colorLiteral(red: 1, green: 0.9824436415, blue: 0.9833538921, alpha: 1), for: .normal)
        button.backgroundColor = hexStringToUIColor(hex: "#667eea")
        button.layer.cornerRadius = 20
        button.backgroundColor?.withAlphaComponent(0.7)
        button.layer.masksToBounds = true
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        button.addTarget(self, action: #selector(handleUserLoginRegister), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    @objc func handleUserLoginRegister(){
        setupActivityIndicator()
        self.view.addSubview(activityIndicator)
        self.loginRegisterButton.isEnabled = false
        self.loginConatinerView.isOpaque = false
        self.loginConatinerView.alpha = 0.1
       // self.activityIndicator.startAnimating()
        
        if(loginResgisterSegmentedControl.selectedSegmentIndex == 0){
            loginUser()
        }else{
            registerUser()
        }
    }
    
    
    private func loginUser(){
        getCustomerAccessToken()
    }
    
    
    private func registerUser(){
        self.userName = emailTextField.text!
        self.password = passwordTextField.text!
        let fullName = self.fullName.text!
        var components = fullName.components(separatedBy: " ")
        var firstName: String?
        var lastName : String?
        if(components.count > 0)
        {
            firstName = components.removeFirst()
            lastName = components.joined(separator: " ")
        }
            let params = [
                "customer":[
                    "email":emailTextField.text!,
                    "firstname":firstName!,
                    "lastname":lastName!
                ],
                "password": passwordTextField.text!
                ] as [String : Any]
            
            var request = URLRequest(url: URL(string: hostName+"/rest/all/V1/customers")!)
            request.httpMethod = "POST"
            request.httpBody = try! JSONSerialization.data(withJSONObject: params, options: [])
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            // request.addValue("Bearer"+admintoken!, forHTTPHeaderField: "Authorization")
            
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
       self.userName = self.emailTextField.text!
       self.password = self.passwordTextField.text!
       let params = ["username":userName!, "password":password!] as Dictionary<String, String>
        
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
 
    private func getCustomerDetails(){
        var request = URLRequest(url: URL(string: hostName+"/index.php/rest/V1/customers/me")!)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("Bearer "+customerToken, forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request, completionHandler: { data, response, error -> Void in
            do {
                
                let jsonDecoder = JSONDecoder()
                let responseModel = try jsonDecoder.decode(CustomerDetails.self, from: data!)
                print("CustomerID :"+"\(responseModel.id)")
                customerId = responseModel.id
                DispatchQueue.main.async {
                    self.navigationController?.popViewController(animated: true)
                }
            } catch {
                print("JSON Serialization error")
            }
        }).resume()
    }
    
    @objc func enumerateLoginRegitersSegmentedViews(){
       let title = self.loginResgisterSegmentedControl.titleForSegment(at: self.loginResgisterSegmentedControl.selectedSegmentIndex)
        UIView.transition(with: loginRegisterButton.titleLabel!, duration: 0.5, options: .transitionFlipFromBottom, animations: {
            self.loginRegisterButton.setTitle(title, for: .normal)
        }, completion: nil)
        
        // Mark -> changing height for input container according to segmented control
        inputContainerViewHeightAnchorConstraint?.constant = loginResgisterSegmentedControl.selectedSegmentIndex == 0 ? 110 : 160
        
        // Mark -> changing height for Name TextField according to segmented control
        nameTextFieldHeightAnchorConstraint?.isActive = false
        nameTextFieldHeightAnchorConstraint = fullName.heightAnchor.constraint(equalToConstant: loginResgisterSegmentedControl.selectedSegmentIndex == 0 ? 0 : 50)
       
        nameTextFieldHeightAnchorConstraint?.isActive = true
        
        // Mark -> changing height for Email TextField according to segmented control
        emailTextFieldHeightAnchorConstraint?.isActive = false
        emailTextFieldHeightAnchorConstraint = emailTextField.heightAnchor.constraint(equalToConstant: loginResgisterSegmentedControl.selectedSegmentIndex == 0 ? 50 : 50)
        emailTextFieldHeightAnchorConstraint?.isActive = true
        
        // Mark -> changing height for Password TextField according to segmented control
        passwordTextFieldHeightAnchorConstraint?.isActive = false
        passwordTextFieldHeightAnchorConstraint = passwordTextField.heightAnchor.constraint(equalToConstant: loginResgisterSegmentedControl.selectedSegmentIndex == 0 ? 50 : 50)
        passwordTextFieldHeightAnchorConstraint?.isActive = true
        
    }
    
    
    
    let fullName: UITextField = {
        let textField = TextField()
        textField.backgroundColor = UIColor.clear
         textField.textColor = UIColor.white
        textField.attributedPlaceholder = NSAttributedString(string: "Fullname", attributes: [
            .foregroundColor: UIColor.white,
            .font: UIFont.boldSystemFont(ofSize: 20.0)
            ])
      //  textField.typingAttributes =
        textField.font = .boldSystemFont(ofSize: 20.0)
        textField.layer.borderWidth = 2.0
        textField.layer.cornerRadius = 25.0
        
        textField.layer.borderColor = UIColor.white.cgColor
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
   
    let emailTextField: UITextField = {
        let textField = TextField()
         textField.font = .boldSystemFont(ofSize: 20.0)
        textField.textColor = UIColor.white
        textField.backgroundColor = UIColor.clear
         textField.layer.cornerRadius = 25.0
        textField.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [
            .foregroundColor: UIColor.white,
            .font: UIFont.boldSystemFont(ofSize: 20.0)
            ])
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.borderWidth = 2.0
        textField.layer.borderColor = UIColor.white.cgColor
        return textField
    }()
    let passwordTextField: UITextField = {
        let textField = TextField()
         textField.font = .boldSystemFont(ofSize: 20.0)
         textField.textColor = UIColor.white
        textField.backgroundColor = UIColor.clear
         textField.layer.cornerRadius = 25.0
        textField.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [
            .foregroundColor: UIColor.white,
            .font: UIFont.boldSystemFont(ofSize: 20.0)
            ])
        textField.isSecureTextEntry = true
        textField.layer.borderWidth = 2.0
        textField.layer.borderColor = UIColor.white.cgColor
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let nameSeperatorLine: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let emailSeperator: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var logo: UIImageView = {
        let imageVIew = UIImageView()
        imageVIew.image = UIImage(named: "ic_logo")
        //imageVIew.backgroundColor = UIColor.black
        imageVIew.translatesAutoresizingMaskIntoConstraints = false
        //imageVIew.layer.cornerRadius = 70
        imageVIew.layer.masksToBounds = true
        imageVIew.contentMode = .scaleAspectFit
        return imageVIew
    }()
    
    lazy var loginResgisterSegmentedControl: UISegmentedControl = {
        let font = UIFont.boldSystemFont(ofSize: 16)
        let sc = UISegmentedControl(items: ["Login","Register"])
        sc.setTitleTextAttributes([NSAttributedString.Key.font: font],
                                                for: .normal)
        sc.selectedSegmentIndex = 1
        sc.tintColor = UIColor.white
        sc.translatesAutoresizingMaskIntoConstraints = false
        sc.addTarget(self, action: #selector(enumerateLoginRegitersSegmentedViews), for: .valueChanged)
        return sc
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupLoginView()
        self.fullName.delegate = self
        self.passwordTextField.delegate = self
        self.emailTextField.delegate = self
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
    var inputContainerViewHeightAnchorConstraint : NSLayoutConstraint?
    var nameTextFieldHeightAnchorConstraint : NSLayoutConstraint?
    var emailTextFieldHeightAnchorConstraint : NSLayoutConstraint?
    var passwordTextFieldHeightAnchorConstraint : NSLayoutConstraint?
    
    
    fileprivate func setupConstraintsOfInputContainer() {
        
        //MARK-> INPUTS CONTAINER
        //  Define x,y,width,height for input container
        loginConatinerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginConatinerView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        loginConatinerView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -25).isActive = true
        inputContainerViewHeightAnchorConstraint = loginConatinerView.heightAnchor.constraint(equalToConstant: 160)
        inputContainerViewHeightAnchorConstraint?.isActive = true
        
        //MARK-> NAME TEXTFIELD
        // Define x,y,width,height for Name textfield
        loginConatinerView.addSubview(fullName)
        fullName.leftAnchor.constraint(equalTo: loginConatinerView.leftAnchor).isActive = true
        fullName.topAnchor.constraint(equalTo: loginConatinerView.topAnchor).isActive = true
        fullName.widthAnchor.constraint(equalTo: loginConatinerView.widthAnchor).isActive = true
        nameTextFieldHeightAnchorConstraint = fullName.heightAnchor.constraint(equalToConstant: 50)
        nameTextFieldHeightAnchorConstraint?.isActive = true
        
        
        //MARK-> NAME TEXTFIELD SEPERATOR LINE
        // Define x,y,width,height for name Seperator line
       /* loginConatinerView.addSubview(nameSeperatorLine)
        nameSeperatorLine.widthAnchor.constraint(equalTo: loginConatinerView.widthAnchor).isActive = true
        nameSeperatorLine.heightAnchor.constraint(equalToConstant: 2).isActive = true
        nameSeperatorLine.topAnchor.constraint(equalTo: nameTextField.bottomAnchor).isActive = true
        nameSeperatorLine.leftAnchor.constraint(equalTo: loginConatinerView.leftAnchor).isActive = true*/
        
        //MARK-> EMAIL TEXTFIELD
        // Define x,y,width,height for EMAIL Textfield
        
        loginConatinerView.addSubview(emailTextField)
        emailTextField.topAnchor.constraint(equalTo: fullName.bottomAnchor, constant: 5).isActive = true
        emailTextField.leftAnchor.constraint(equalTo: loginConatinerView.leftAnchor).isActive = true
        emailTextField.widthAnchor.constraint(equalTo: loginConatinerView.widthAnchor).isActive = true
        emailTextFieldHeightAnchorConstraint = emailTextField.heightAnchor.constraint(equalToConstant: 50)
        emailTextFieldHeightAnchorConstraint?.isActive = true
        
        // MARK-> EMAIL TEXTFIELD SEPERATOR LINE
        
      /*  loginConatinerView.addSubview(emailSeperator)
        emailSeperator.widthAnchor.constraint(equalTo: loginConatinerView.widthAnchor).isActive = true
        emailSeperator.heightAnchor.constraint(equalToConstant: 2).isActive = true
        emailSeperator.topAnchor.constraint(equalTo: emailTextField.bottomAnchor).isActive = true
        emailSeperator.leftAnchor.constraint(equalTo: loginConatinerView.leftAnchor).isActive = true*/
        
        //MARK-> Password TEXTFIELD
        // Define x,y,width,height for EMAIL Textfield
        loginConatinerView.addSubview(passwordTextField)
        passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 5).isActive = true
        passwordTextField.leftAnchor.constraint(equalTo: loginConatinerView.leftAnchor).isActive = true
        passwordTextField.widthAnchor.constraint(equalTo: loginConatinerView.widthAnchor).isActive = true
        passwordTextFieldHeightAnchorConstraint = passwordTextField.heightAnchor.constraint(equalToConstant: 50)
        passwordTextFieldHeightAnchorConstraint?.isActive = true
        
        
    }
    
    fileprivate func setupConstraintsOfRegitserButton() {
        // define x,y,width,height
        
        loginRegisterButton.widthAnchor.constraint(equalTo: loginConatinerView.widthAnchor, constant: -100).isActive = true
        loginRegisterButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        loginRegisterButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginRegisterButton.topAnchor.constraint(equalTo: loginConatinerView.bottomAnchor, constant: 12).isActive = true
    }
    
    
    fileprivate func setupLogoImageViewConstraints() {
        logo.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -10).isActive = true
        logo.bottomAnchor.constraint(equalTo: loginResgisterSegmentedControl.topAnchor, constant: -20).isActive = true
        logo.widthAnchor.constraint(equalToConstant: 280).isActive = true
        logo.heightAnchor.constraint(equalToConstant: 140).isActive = true
    }
    
    fileprivate func setupLoginRegisterSegmentedControlConstraints() {
        loginResgisterSegmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginResgisterSegmentedControl.bottomAnchor.constraint(equalTo: loginConatinerView.topAnchor, constant: -12).isActive = true
        loginResgisterSegmentedControl.widthAnchor.constraint(equalTo: loginConatinerView.widthAnchor).isActive = true
        loginResgisterSegmentedControl.heightAnchor.constraint(equalToConstant: 36).isActive = true
    }
    
    private func setupLoginView(){
        
        // Background color
       //loginRegisterViewBackgroundLayer.frame = self.view.bounds
       //view.layer.addSublayer(loginRegisterViewBackgroundLayer)
        //view.applyMainAppTheme()
        view.applyBottomBarAppTheme()
        
        view.addSubview(loginConatinerView)
        setupConstraintsOfInputContainer()
        
        view.addSubview(loginRegisterButton)
        setupConstraintsOfRegitserButton()
      
        
        view.addSubview(loginResgisterSegmentedControl)
        setupLoginRegisterSegmentedControlConstraints()
        
        view.addSubview(logo)
        setupLogoImageViewConstraints()
        
    }
    
    private func setupActivityIndicator(){
        self.activityIndicator = UIActivityIndicatorView(style: .whiteLarge)
        self.activityIndicator.center = self.view.center
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
    lazy var loginRegisterViewBackgroundLayer: CAGradientLayer = {
        var gradientLayer = CAGradientLayer()
        gradientLayer.colors = [hexStringToCGColor(hex: "#D585FF"),hexStringToCGColor(hex: "#00FFEE")]
        return gradientLayer
    }()
    
    lazy var loginRegisterButtonBagroundLayer: CAGradientLayer = {
        var gradientLayer = CAGradientLayer()
        gradientLayer.colors = [hexStringToCGColor(hex: "#3A3897"),hexStringToCGColor(hex: "#A3A1FF")]
        return gradientLayer
    }()
    
    
    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
            )
    }
    
  
    func hexStringToCGColor (hex:String) -> CGColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return UIColor.gray.cgColor
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        ).cgColor
    }
    
}

class TextField: UITextField {
    
    let padding = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 5)
    
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
            
            
          //  UIEdgeInsetsInsetRect(bounds, padding)
    }
    
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
         return bounds.inset(by: padding)
        //return UIEdgeInsetsInsetRect(bounds, padding)
    }
    
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
         return bounds.inset(by: padding)
        //return UIEdgeInsetsInsetRect(bounds, padding)
    }
}



