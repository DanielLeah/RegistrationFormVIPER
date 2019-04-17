//
//  HtmlSiteWireFrame.swift
//  RegistrationFormVIPER
//
//  Created by David Daniel Leah (BFS EUROPE) on 17/04/2019.
//  Copyright © 2019 David Daniel Leah (BFS EUROPE). All rights reserved.
//

import UIKit

class HtmlSiteWireFrame: HtmlSiteWireFrameProtocol {
    
    class func createHtmlSiteModule(with HtmlSiteRef: HtmlSiteView) {
        let presenter = HtmlSitePresenter()
        HtmlSiteRef.presenter = presenter
        HtmlSiteRef.presenter?.view = HtmlSiteRef
        HtmlSiteRef.presenter?.wireframe = HtmlSiteWireFrame()
    }
    
    func goBackToRegistration(from view: UIViewController) {
        view.dismiss(animated: false, completion: nil)
        
    }
    
    
}
