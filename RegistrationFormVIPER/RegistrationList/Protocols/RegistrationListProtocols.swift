//
//  RegistrationListProtocols.swift
//  RegistrationFormVIPER
//
//  Created by David Daniel Leah (BFS EUROPE) on 09/04/2019.
//  Copyright © 2019 David Daniel Leah (BFS EUROPE). All rights reserved.
//

import UIKit

protocol RegistrationListViewProtocol : class {
    //add updates to the view
    func setAlerts(message: String, img: String, title: String)
}

protocol RegistrationListPresenterProtocol : class {
    //send updates from the view
    
    var interactor: RegistrationListInputInteractorProtocol? {get set}
    var wireframe: RegistrationListWireFrameProtocol? {get set}
    var view: RegistrationListViewProtocol? {get set}
    func viewDidLoad()
    
    func evaluateInputs(inputs : Register)
    
    func showUserDetails(view: UIViewController)
}

protocol RegistrationListInputInteractorProtocol : class {
    //Presenter -> Interactor
    var presenter: RegistrationListOutputInteractorProtocol? {get set}
    func evaluate(inputs: Register)
}

protocol RegistrationListOutputInteractorProtocol : class {
   //Interactor -> Presenter
    func didEvaluateWithResult(message: String, img: String, title: String)
}

protocol RegistrationListWireFrameProtocol : class {
     //Presenter -> Wireframe
    func pushToDetail(from view: UIViewController)
    static func createRegistrationListModule(registListRef: RegistrationListView)
}
