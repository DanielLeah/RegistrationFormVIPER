//
//  RegistrationListPresenter.swift
//  RegistrationFormVIPER
//
//  Created by David Daniel Leah (BFS EUROPE) on 10/04/2019.
//  Copyright © 2019 David Daniel Leah (BFS EUROPE). All rights reserved.
//

import UIKit

class RegistrationListPresenter: RegistrationListPresenterProtocol {
    
    var wireframe: RegistrationListWireFrameProtocol?
    var view: RegistrationListViewProtocol?
    var interactor: RegistrationListInputInteractorProtocol?
    var presenter: RegistrationListPresenterProtocol?
    
    func evaluateInputs(inputs: Register) {
        self.saveRegistration(user: inputs)
    }
    
    func viewDidLoad() {
    }
    
    func saveRegistration(user: Register){
        interactor?.evaluate(inputs: user)
    }
    
    func showUserDetails(view: UIViewController){
        wireframe?.pushToDetail(from: view)
    }
}

extension RegistrationListPresenter: RegistrationListOutputInteractorProtocol{
    func didEvaluateWithResult(message: String ,img: String,title: String) {
        view?.setAlerts(message: message, img: img, title: title)
    }
    
}
