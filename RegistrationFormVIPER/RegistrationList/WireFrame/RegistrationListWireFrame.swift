//
//  RegistrationListWireFrame.swift
//  RegistrationFormVIPER
//
//  Created by David Daniel Leah (BFS EUROPE) on 10/04/2019.
//  Copyright © 2019 David Daniel Leah (BFS EUROPE). All rights reserved.
//

import UIKit

class RegistrationListWireFrame: RegistrationListWireFrameProtocol {
    func pushToDetail(from view: UIViewController) {
        let userDetailViewController = view.storyboard?.instantiateViewController(withIdentifier: "DetailsListView") as! DetailsListView
        DetailsListWireFrame.createUserDetailModule(with: userDetailViewController)
        view.present(userDetailViewController, animated: true, completion: nil)
    }
    

    
//    func pushToDetails(from view: UIViewController) {
//        let fruitDetailViewController = view.storyboard?.instantiateViewController(withIdentifier: "FruitDetailView") as! FruitDetailView
//        FruitDetailWireFrame.createFruitDetailModule(with: fruitDetailViewController, and: fruit)
//        view.navigationController?.pushViewController(fruitDetailViewController, animated: true)
//    }
    
    class func createRegistrationListModule(registListRef: RegistrationListView) {
        let presenter : RegistrationListPresenterProtocol & RegistrationListOutputInteractorProtocol = RegistrationListPresenter()
        registListRef.presenter = presenter
        registListRef.presenter?.wireframe = RegistrationListWireFrame()
        registListRef.presenter?.view = registListRef
        registListRef.presenter?.interactor = RegistrationListInteractor()
        registListRef.presenter?.interactor?.presenter = presenter
    }
}
