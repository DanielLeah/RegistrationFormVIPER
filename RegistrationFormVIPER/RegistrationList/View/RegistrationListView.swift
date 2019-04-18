//
//  RegistrationListView.swift
//  RegistrationFormVIPER
//
//  Created by David Daniel Leah (BFS EUROPE) on 09/04/2019.
//  Copyright © 2019 David Daniel Leah (BFS EUROPE). All rights reserved.
//

import UIKit
import SnapKit
import SwiftEntryKit

class RegistrationListView : UIViewController, RegistrationListViewProtocol {
    
    //MARK: Properties
    let containerViewBGColor = UIColor(red: 167.0/255.0, green: 177.0/255.0, blue: 180.0/255.0, alpha: 1.0)
    
    let innerViewBGColor = UIColor(red: 190.0/255.0, green: 195.0/255, blue: 198.0/255.0, alpha: 1.0)
    
    var viewContainer : UIView!
    
    var viewTop : UIView!
    
    var imgName : UIImageView!
    
    var txtName : UITextField!
    
    var imgEmail : UIImageView!
    
    var txtEmail : UITextField!
    
    var imgPassword : UIImageView!
    
    var txtPassword : UITextField!
    
    var imgGender : UIImageView!
    
    var txtGender : UISegmentedControl!
    
    var imgTel : UIImageView!
    
    var txtTel: UITextField!
    
    let topInnerViewHeight : CGFloat = 30.0
    
    let textfieldHeight : CGFloat = 50.0
    
    var presenter : RegistrationListPresenterProtocol?
    
    var user : Register!

    var contentView : EKNotificationMessageView!
    
    //MARK: View Did Load
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        RegistrationListWireFrame.createRegistrationListModule(registListRef: self)
        addGestures()
        setupContainerView()
        setupTitle()
        setupInputs()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        loadUser()
    }
    
    //MARK: Gesture Recognizer
    func addGestures(){
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        tapGesture.cancelsTouchesInView = true
        self.view.addGestureRecognizer(tapGesture)
    }
    
    @objc func hideKeyboard(){
        txtName.resignFirstResponder()
        txtEmail.resignFirstResponder()
        txtTel.resignFirstResponder()
        txtPassword.resignFirstResponder()
        SwiftEntryKit.dismiss(.displayed)
    }
    
    //MARK: Setup Views
    func setupContainerView() {
        viewContainer = UIView()
        self.view.addSubview(viewContainer)
        
        viewContainer.snp.makeConstraints { (make) in
            make.left.equalTo(self.view).offset(20)
            make.right.equalTo(self.view).offset(-20)
            make.center.equalTo(self.view)
            make.top.equalTo(self.view).offset(50)
            make.bottom.equalTo(self.view).offset(-50)
            make.centerX.equalTo(self.view)
            make.centerY.equalTo(self.view)
            
        }
        
        viewContainer.backgroundColor = containerViewBGColor
        viewContainer.layer.cornerRadius = 10.0
        viewContainer.clipsToBounds = true
    }
    
    func setupTitle() {
        viewTop = UIView()
        viewContainer.addSubview(viewTop)
        
        viewTop.backgroundColor = innerViewBGColor
        
        viewTop.snp.makeConstraints { (make) in
            make.left.equalTo(viewContainer)
            make.top.equalTo(viewContainer)
            make.right.equalTo(viewContainer)
            make.height.equalTo(topInnerViewHeight)
        }
        
        let lblTitle = UILabel()
        viewTop.addSubview(lblTitle)
        
        lblTitle.text = "REGISTER"
        lblTitle.textAlignment = .center
        lblTitle.textColor = UIColor.white
        lblTitle.backgroundColor = UIColor.clear
        lblTitle.font = UIFont(name: "Futura-Bold", size: 25.0)
        
        lblTitle.snp.makeConstraints { (make) in
            make.edges.equalTo(viewTop).inset(UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0))
        }
    }
    
    func setupInputs(){
        imgName = {
            let img = UIImageView()
            img.image = UIImage(named: "nameIcon")
            img.backgroundColor = .white
            img.contentMode = .scaleAspectFit
            img.layer.cornerRadius = 10;
            return img
        }()
        
        txtName = {
            let txt = UITextField()
            txt.placeholder = "Enter your name"
            txt.borderStyle = .none
            txt.font = UIFont(name: "Futura-Bold", size: 15.0)
            txt.backgroundColor = .white
            txt.setLeftPaddingPoints(10)
            txt.layer.cornerRadius = 10
            return txt
        }()
       
        let nameStackView : UIStackView = {
            let stackView = UIStackView(arrangedSubviews: [imgName,txtName])
            stackView.axis = .horizontal
            stackView.distribution = .fillProportionally
            stackView.spacing = 10
            return stackView
        }()
        
        imgEmail = {
            let img = UIImageView()
            img.image = UIImage(named: "emailIcon")
            img.backgroundColor = .white
            img.contentMode = .scaleAspectFit
            img.layer.cornerRadius = 10;
            return img
        }()
        
        txtEmail = {
            let txt = UITextField()
            txt.placeholder = "Enter your email"
            txt.borderStyle = .none
            txt.keyboardType = .emailAddress
            txt.autocapitalizationType = .none
            txt.setLeftPaddingPoints(10)
            txt.font = UIFont(name: "Futura-Bold", size: 15.0)
            txt.backgroundColor = .white
            txt.layer.cornerRadius = 10
            return txt
        }()
        
        let emailStackView : UIStackView = {
            let stackView = UIStackView(arrangedSubviews: [imgEmail,txtEmail])
            stackView.axis = .horizontal
            stackView.distribution = .fillProportionally
            stackView.spacing = 10
            return stackView
        }()
        
        imgPassword = {
            let img = UIImageView()
            img.image = UIImage(named: "passwordIcon")
            img.backgroundColor = .white
            img.contentMode = .scaleAspectFit
            img.layer.cornerRadius = 10;
            return img
        }()
        
        txtPassword = {
            let txt = UITextField()
            txt.placeholder = "Enter your password"
            txt.borderStyle = .none
            txt.isSecureTextEntry = true
            txt.setLeftPaddingPoints(10)
            txt.font = UIFont(name: "Futura-Bold", size: 15.0)
            txt.backgroundColor = .white
            txt.layer.cornerRadius = 10
            return txt
        }()
        
        let passwordStackView : UIStackView = {
            let stackView = UIStackView(arrangedSubviews: [imgPassword,txtPassword])
            stackView.axis = .horizontal
            stackView.distribution = .fillProportionally
            stackView.spacing = 10
            return stackView
        }()
        
        imgGender = {
            let img = UIImageView()
            img.image = UIImage(named: "genderIcon")
            img.backgroundColor = .white
            img.contentMode = .scaleAspectFit
            img.layer.cornerRadius = 10;
            return img
        }()
        
        txtGender = {
            let items = ["Other", "Male", "Female"]
            let seg = UISegmentedControl(items: items)
            seg.backgroundColor = .none
            seg.selectedSegmentIndex = 0
            seg.setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "Futura-Bold", size: 14.0)!], for: .normal)
            seg.layer.cornerRadius = 10.0
            seg.tintColor = .darkGray
            return seg
        }()
        
        let genderStackView : UIStackView = {
            let stackView = UIStackView(arrangedSubviews: [imgGender,txtGender])
            stackView.axis = .horizontal
            stackView.distribution = .fillProportionally
            stackView.spacing = 10
            return stackView
        }()
        
        
        imgTel = {
            let img = UIImageView()
            img.image = UIImage(named: "phoneIcon")
            img.backgroundColor = .white
            img.contentMode = .scaleAspectFit
            img.layer.cornerRadius = 10;
            return img
        }()
        
        txtTel = {
            let txt = UITextField()
            txt.placeholder = "Enter your phone"
            txt.borderStyle = .none
            txt.keyboardType = .numberPad
            txt.setLeftPaddingPoints(10)
            txt.font = UIFont(name: "Futura-Bold", size: 15.0)
            txt.backgroundColor = .white
            txt.layer.cornerRadius = 10
            return txt
        }()
        
        let telStackView : UIStackView = {
            let stackView = UIStackView(arrangedSubviews: [imgTel,txtTel])
            stackView.axis = .horizontal
            stackView.distribution = .fillProportionally
            stackView.spacing = 10
            return stackView
        }()
        
        let buttonSubmit : UIButton = {
            let button = UIButton(type: .system)
            button.backgroundColor = .clear
            button.layer.cornerRadius = 20.0
            button.layer.borderColor = UIColor.red.cgColor
            button.layer.borderWidth = 1
            button.setTitleColor(.red, for: .normal)
            button.titleLabel?.font =  UIFont(name: "Futura-Bold", size: 25.0)
            button.setTitle("Submit", for: .normal)
            button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
            return button
        }()
        
        let buttonStackView : UIStackView = {
            let stackView = UIStackView(arrangedSubviews: [buttonSubmit])
            stackView.axis = .horizontal
            stackView.distribution = .fillProportionally
            return stackView
        }()
        
        let mainStackView : UIStackView = {
            let stackView = UIStackView(arrangedSubviews: [nameStackView,emailStackView, passwordStackView, genderStackView, telStackView, buttonStackView])
            stackView.axis = .vertical
            stackView.distribution = .fillProportionally
            stackView.spacing = 10
            return stackView
        }()
        
        viewContainer.addSubview(mainStackView)
    
        txtName.snp.makeConstraints { (make) in
            make.width.equalTo(imgName).multipliedBy(4)
        }
        
        txtEmail.snp.makeConstraints { (make) in
            make.width.equalTo(imgEmail).multipliedBy(4)
        }
        
        txtPassword.snp.makeConstraints { (make) in
            make.width.equalTo(imgPassword).multipliedBy(4)
        }
        
        txtGender.snp.makeConstraints { (make) in
            make.width.equalTo(imgGender).multipliedBy(4)
        }
        
        txtTel.snp.makeConstraints { (make) in
            make.width.equalTo(imgTel).multipliedBy(4)
        }
        
        mainStackView.snp.makeConstraints { (make) in
            make.top.equalTo(viewTop).offset(50)
            make.left.equalTo(20)
            make.bottom.right.equalTo(-20)
        }
        
        buttonStackView.snp.makeConstraints { (make) in
            make.height.equalTo(telStackView).multipliedBy(2)
            make.height.equalTo(genderStackView).multipliedBy(2)
            make.height.equalTo(passwordStackView).multipliedBy(2)
            make.height.equalTo(emailStackView).multipliedBy(2)
            make.height.equalTo(nameStackView).multipliedBy(2)
        }
    }
    
    @objc func buttonAction(){
    // do this with EntryKit
       /* let title = EKProperty.LabelContent(text: "Continue with HTML Page?", style: .init(font: UIFont.init(name: "OpenSans", size: 14)!, color: .black))
        let description = EKProperty.LabelContent(text: "Description", style: .init(font: UIFont.init(name: "OpenSans", size: 14)!, color: .black))
        let message = EKSimpleMessage(title: title, description: description)
        let button = EKProperty.ButtonContent(
        let buttonStack = EKProperty.ButtonBarContent(with: <#T##EKProperty.ButtonContent...##EKProperty.ButtonContent#>, separatorColor: .red, expandAnimatedly: true)
        let alert = EKAlertMessage(simpleMessage: message, buttonBarContent: EKProperty.ButtonBarContent)*/
        user = Register(name: txtName.text!, email: txtEmail.text!, password: txtPassword.text!, gender: txtGender.titleForSegment(at: txtGender.selectedSegmentIndex)!, phone: txtTel.text!)
        self.presenter?.evaluateInputs(inputs: user!)
    
    }
    
    
    func loadUser(){
        user = presenter?.interactor?.loadFromDefaults()
        updateUI()
    }
    
    func clearInputs() {
        txtName.text = ""
        txtTel.text = ""
        txtGender.selectedSegmentIndex = 0
        txtEmail.text = ""
        txtPassword.text = ""
    }
    
    func updateUI(){
        txtName.text = user.name
        txtTel.text = user.phone
        if (user.gender == "Male"){
            txtGender.selectedSegmentIndex = 1
        }else if (user.gender == "Female"){
            txtGender.selectedSegmentIndex = 2
        }else{
            txtGender.selectedSegmentIndex = 0
        }
        txtEmail.text = user.email
        txtPassword.text = user.password
    }
    
    
    func setAlerts(message : String, img : String, title: String) {

        showNotification(message: message, img: img, superTitle: title)
    
        if (img == "success"){
            let alert = UIAlertController(title: "Continue with HTML Page?", message: nil, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { (action) in
                self.clearInputs()
                self.presenter?.showHtmlDetails(view: self)
            }))
            alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: { (action) in
                self.presenter?.showUserDetails(view: self)
            }))
            
            self.present(alert, animated: true)
        }
    }
    
    private func showNotification(message : String, img : String, superTitle: String){
        var attributes = EKAttributes()
        attributes.positionConstraints = .fullWidth
        attributes.hapticFeedbackType = .error
        attributes.positionConstraints.safeArea = .empty(fillSafeArea: true)
        attributes.entryBackground = .visualEffect(style: .light)
        attributes.displayDuration = 3
        
        let title = EKProperty.LabelContent(text: superTitle, style: EKProperty.LabelStyle(font: UIFont.systemFont(ofSize: 20), color: .darkGray))
        let description = EKProperty.LabelContent(text: message, style: EKProperty.LabelStyle(font: UIFont.systemFont(ofSize: 20), color: .darkGray))
        let image = EKProperty.ImageContent(image: UIImage(named: img)!, size: CGSize(width: 40, height: 40))
        let simpleMessage = EKSimpleMessage(image: image, title: title, description: description)
        let notificationMessage = EKNotificationMessage(simpleMessage: simpleMessage)
        
        contentView = EKNotificationMessageView(with: notificationMessage)
    
        SwiftEntryKit.display(entry: contentView, using: attributes)
    }
}
