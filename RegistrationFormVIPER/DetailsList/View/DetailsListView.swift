//
//  DetailsListView.swift
//  RegistrationFormVIPER
//
//  Created by David Daniel Leah (BFS EUROPE) on 11/04/2019.
//  Copyright © 2019 David Daniel Leah (BFS EUROPE). All rights reserved.
//

import UIKit
import SwiftEntryKit
import SnapKit

class DetailsListView : UIViewController, DetailsListViewProtocol{
    
    var user : Register! = nil
    
    var presenter : DetailsListPresenterProtocol?
    
    override func viewDidLoad() {
        presenter?.viewDidLoad()
        initViews()
        addGestures()
    }
    
    func initUser () {
        if let userData = UserDefaults.standard.data(forKey: "user"),
            let userDefault = try? JSONDecoder().decode(Register.self, from: userData) {
            user = userDefault
        }
        
        
    }
    
    func initViews(){
        
        let imgUser : UIImageView = {
            let imgView = UIImageView()
            var img = UIImage()
            
            if (String(user.gender) == "Male"){
                img = UIImage(named: "male")!
            }else if (String(user.gender) == "Female" ){
                img = UIImage(named: "female")!
            }else{
                img = UIImage(named: "neutral")!
            }
            
            imgView.image = img
            imgView.layer.cornerRadius = 10
            return imgView
        }()
        
        let labelEmail : UILabel = {
            let lbl = UILabel()
            lbl.text = user.email
            return lbl
        }()
        
        let labelPhone : UILabel = {
            let lbl = UILabel()
            lbl.text = user.phone
            return lbl
        }()
        
        let textStackView : UIStackView = {
            let stackView = UIStackView(arrangedSubviews: [labelEmail,labelPhone])
            stackView.axis = .vertical
            stackView.distribution = .fillEqually
            stackView.spacing = 10
            return stackView
        }()
        
        let mainStackView : UIStackView = {
            let stackView = UIStackView(arrangedSubviews: [imgUser,textStackView])
            stackView.axis = .horizontal
            stackView.distribution = .fillEqually
            stackView.spacing = 10
            return stackView
        }()
        
        self.view.addSubview(mainStackView)
        
        mainStackView.snp.makeConstraints { (make) in
            make.width.equalTo(UIScreen.main.bounds.width / 2)
            make.height.equalTo(UIScreen.main.bounds.height / 4)
            make.center.equalTo(self.view)
        }
    }
    
    func addGestures(){
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture))
        swipeDown.direction = UISwipeGestureRecognizer.Direction.down
        self.view.addGestureRecognizer(swipeDown)
    }
    
    @objc func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            
            
            switch swipeGesture.direction {
            case UISwipeGestureRecognizer.Direction.right:
                print("Swiped right")
            case UISwipeGestureRecognizer.Direction.down:
                presenter?.wireframe?.goBackToRegistration(from: self)
            case UISwipeGestureRecognizer.Direction.left:
                print("Swiped left")
            case UISwipeGestureRecognizer.Direction.up:
                print("Swiped up")
            default:
                break
            }
        }
    }
}
