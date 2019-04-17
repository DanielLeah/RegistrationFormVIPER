//
//  HtmlSiteProtocols.swift
//  RegistrationFormVIPER
//
//  Created by David Daniel Leah (BFS EUROPE) on 17/04/2019.
//  Copyright © 2019 David Daniel Leah (BFS EUROPE). All rights reserved.
//

import UIKit

protocol HtmlSiteViewProtocol : class {
    func loadData()
}

protocol HtmlSitePresenterProtocol : class {
    
    var wireframe : HtmlSiteWireFrameProtocol? {set get}
    var view : HtmlSiteViewProtocol? {set get}
    
    func viewDidLoad()
    
}

protocol HtmlSiteWireFrameProtocol : class {
    func goBackToRegistration(from view: UIViewController)
}
