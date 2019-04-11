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
    
    func goBackToRegistration(from view: UIViewController) {
        view.dismiss(animated: true, completion: nil)
    }
    
    
}
