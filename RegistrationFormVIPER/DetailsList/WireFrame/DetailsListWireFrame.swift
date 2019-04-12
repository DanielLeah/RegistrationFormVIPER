//
//  DetailsListWireFrame.swift
//  RegistrationFormVIPER
//
//  Created by David Daniel Leah (BFS EUROPE) on 11/04/2019.
//  Copyright © 2019 David Daniel Leah (BFS EUROPE). All rights reserved.
//

import UIKit

class DetailsListWireFrame: DetailsListWireFrameProtocol {
    
    class func createUserDetailModule(with userDetailRef: DetailsListView) {
        let presenter = DetailsListPresenter()
        userDetailRef.presenter = presenter
        userDetailRef.presenter?.view = userDetailRef
        userDetailRef.presenter?.wireframe = DetailsListWireFrame()
    }
    
    func goBackToRegistration(from view: UIViewController, with animation: Int) {

        switch animation {
        case 1:
            //top
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut , animations: {
                view.view.frame = CGRect(x: 0, y:0, width: view.view.frame.width, height: view.view.frame.height * -1)
            }) { (finished) in
                view.dismiss(animated: false, completion: nil)
            }
        case 2:
            //right
            UIView.animate(withDuration: 0.5, delay: 0, options: .layoutSubviews , animations: {
                view.view.frame = CGRect(x: view.view.frame.width * 2, y:0, width: view.view.frame.width, height: view.view.frame.height)
            }) { (finished) in
                view.dismiss(animated: false, completion: nil)
            }
        case 3:
            //bottom
            UIView.animate(withDuration: 0.5, delay: 0, options: .layoutSubviews , animations: {
                view.view.frame = CGRect(x: view.view.frame.width, y:view.view.frame.height, width: view.view.frame.width * -1, height: 0)
            }) { (finished) in
                view.dismiss(animated: false, completion: nil)
            }
        case 4:
            //left
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut, animations: {
                view.view.frame = CGRect(x: view.view.frame.width * -1, y: 0, width: view.view.frame.width, height: view.view.frame.height)
            }) { (finished) in
                view.dismiss(animated: false, completion: nil)
            }
        default:
            view.dismiss(animated: false, completion: nil)
        }
        
    }
    
    
}
