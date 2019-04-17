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
    
    func pushToHTML(from view: UIViewController) {
        let htmlSiteViewController = view.storyboard?.instantiateViewController(withIdentifier: "HtmlSiteView") as! HtmlSiteView
        HtmlSiteWireFrame.createHtmlSiteModule(with: htmlSiteViewController)
        view.present(htmlSiteViewController, animated: true, completion: nil)
    }
    
    class func createRegistrationListModule(registListRef: RegistrationListView) {
        let presenter : RegistrationListPresenterProtocol & RegistrationListOutputInteractorProtocol = RegistrationListPresenter()
        registListRef.presenter = presenter
        registListRef.presenter?.wireframe = RegistrationListWireFrame()
        registListRef.presenter?.view = registListRef
        registListRef.presenter?.interactor = RegistrationListInteractor()
        registListRef.presenter?.interactor?.presenter = presenter
    }
}
