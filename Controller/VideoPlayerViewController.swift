//
//  VideoPlayerViewController.swift
//  MagentoAPI
//
//  Created by Work on 2/19/19.
//  Copyright © 2019 TheMysteryPuzzles. All rights reserved.
//

import UIKit
import WebKit

class VideoPlayerViewController: UIViewController, WKUIDelegate {

    
     var webView: WKWebView!
  
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myURL = URL(string:"https://www.apple.com")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
    }
}
