//
//  DetailsListPresenter.swift
//  RegistrationFormVIPER
//
//  Created by David Daniel Leah (BFS EUROPE) on 11/04/2019.
//  Copyright © 2019 David Daniel Leah (BFS EUROPE). All rights reserved.
//

import UIKit

class DetailsListPresenter: DetailsListPresenterProtocol {
    var wireframe: DetailsListWireFrameProtocol?
    
    var view: DetailsListViewProtocol?
    
    func viewDidLoad() {
        view?.initUser()
    }
    
    func backButtonPressed(from view: UIViewController, with animation: Int) {
        wireframe?.goBackToRegistration(from: view, with: animation)
    }

}

