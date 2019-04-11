//
//  DetailsListProtocols.swift
//  RegistrationFormVIPER
//
//  Created by David Daniel Leah (BFS EUROPE) on 11/04/2019.
//  Copyright © 2019 David Daniel Leah (BFS EUROPE). All rights reserved.
//

import UIKit

protocol DetailsListViewProtocol : class {
    func initUser()
}

protocol DetailsListPresenterProtocol : class {
    
    var wireframe : DetailsListWireFrameProtocol? {set get}
    var view : DetailsListViewProtocol? {set get}
    
    func viewDidLoad()
    
}

protocol DetailsListInputInteractorProtocol : class {
   
}

protocol DetailsListOutputInteractorProtocol : class {
    
}

protocol DetailsListWireFrameProtocol : class {
    func goBackToRegistration(from view: UIViewController)
}

