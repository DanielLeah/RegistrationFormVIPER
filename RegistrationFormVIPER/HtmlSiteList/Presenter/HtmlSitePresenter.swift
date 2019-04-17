//
//  HtmlSitePresenter.swift
//  RegistrationFormVIPER
//
//  Created by David Daniel Leah (BFS EUROPE) on 17/04/2019.
//  Copyright © 2019 David Daniel Leah (BFS EUROPE). All rights reserved.
//

import UIKit

class HtmlSitePresenter: HtmlSitePresenterProtocol {
    var wireframe: HtmlSiteWireFrameProtocol?
    
    var view: HtmlSiteViewProtocol?
    
    func viewDidLoad() {
        view?.loadData()
    }
    
    func backButtonPressed(from view: UIViewController, with animation: Int) {
        wireframe?.goBackToRegistration(from: view)
    }

    
    
}
