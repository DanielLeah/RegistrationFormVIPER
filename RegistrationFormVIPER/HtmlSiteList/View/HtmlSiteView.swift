//
//  HtmlSiteView.swift
//  RegistrationFormVIPER
//
//  Created by David Daniel Leah (BFS EUROPE) on 17/04/2019.
//  Copyright © 2019 David Daniel Leah (BFS EUROPE). All rights reserved.
//

import Foundation
import WebKit
import SnapKit

class HtmlSiteView : UIViewController,  WKScriptMessageHandler, WKNavigationDelegate, HtmlSiteViewProtocol {
    var webView : WKWebView!
    var activityIndicator: UIActivityIndicatorView!
    var presenter : HtmlSitePresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initViews()
        
        webView.configuration.userContentController.add(self, name: "jsHandler")
        let url = Bundle.main.url(forResource: "index", withExtension: "html", subdirectory: "Project Assesment")!
        webView.loadFileURL(url, allowingReadAccessTo: url)
        let request = URLRequest(url: url)
        webView.load(request)
        
        
        
        
    }
    
    func initViews(){
        webView = WKWebView()
        webView.navigationDelegate = self
        webView.customUserAgent = "AppAgent"
        activityIndicator = UIActivityIndicatorView()
        
        let backButton : UIButton = {
            let button = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 60))
            button.setTitle("Back", for: .normal)
            button.addTarget(self, action: #selector(dismissView), for: .touchUpInside)
            return button
        }()
        
        self.view.addSubview(webView)
        self.view.addSubview(backButton)
        self.view.addSubview(activityIndicator)
        
        webView.addObserver(self, forKeyPath: #keyPath(WKWebView.isLoading), options: .new, context: nil)
        
        webView.snp.makeConstraints { (make) in
            make.height.equalTo(view.frame.height)
            make.width.equalTo(view.frame.width)
        }
        activityIndicator.snp.makeConstraints { (make) in
            make.centerX.centerY.equalTo(webView)
        }
    }
    
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "loading"{
            if webView.isLoading{
                activityIndicator.startAnimating()
                activityIndicator.isHidden = false
            }else{
                activityIndicator.stopAnimating()
                activityIndicator.isHidden = true
                loadData()
            }
        }
    }
    
    @objc func dismissView(){
        presenter.wireframe?.goBackToRegistration(from: self)
    }
    
    func loadData(){
        if let userData = UserDefaults.standard.data(forKey: "user"),
            let userDefault = try? JSONDecoder().decode(Register.self, from: userData) {
            var firstLastName = userDefault.name.split(separator: " ", maxSplits: 1)
            webView.evaluateJavaScript("document.getElementById(\"firstname\").value = \"\(firstLastName[0])\"", completionHandler: nil)
            webView.evaluateJavaScript("document.getElementById(\"lastname\").value = \"\(firstLastName[1])\"", completionHandler: nil)
            webView.evaluateJavaScript("document.getElementById(\"email\").value = \"\(userDefault.email)\"", completionHandler: nil)
            webView.evaluateJavaScript("document.getElementById(\"gender\").value = \"\(userDefault.gender.lowercased())\"", completionHandler: nil)
            webView.evaluateJavaScript("document.getElementById(\"bday\").value = '11/10/1994'", completionHandler: nil)
        }
    }
    
    func saveData(data: [String : String]) {
        let firstLast = data["firstName"]! + " " + data["lastName"]!
        let user : Register = Register(name: firstLast, email: data["email"]!, password: "", gender: data["gender"]!, phone: "00000000000")
        if let encoded = try? JSONEncoder().encode(user) {
            UserDefaults.standard.set(encoded, forKey: "user")
        }
    }
    
    func updateHTMLUI(){
        if let inputsDetails = UserDefaults.standard.dictionary(forKey: "userDetails"){
            webView.evaluateJavaScript("document.getElementById(\"firstname\").value = \"\(inputsDetails["firstName"]!)\"", completionHandler: nil)
            webView.evaluateJavaScript("document.getElementById(\"lastname\").value = \"\(inputsDetails["lastName"]!)\"", completionHandler: nil)
            webView.evaluateJavaScript("document.getElementById(\"email\").value = \"\(inputsDetails["email"]!)\"", completionHandler: nil)
            webView.evaluateJavaScript("document.getElementById(\"gender\").value = \"\(inputsDetails["gender"]!)\"", completionHandler: nil)
            webView.evaluateJavaScript("document.getElementById(\"bday\").value = \"\(inputsDetails["bday"]!)\"", completionHandler: nil)
        }
        
    }
    
    
    
    
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        var inputsHTML : [String : String]
            if message.name == "jsHandler" {
                inputsHTML = message.body as! [String : String]
                saveData(data: inputsHTML)
                DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2)) {
                    self.webView.evaluateJavaScript("controller.clearLocalInputs()", completionHandler: nil)
                    DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2)) {
                        self.loadData()
                    }
                }
            }
        }
    
    
}
