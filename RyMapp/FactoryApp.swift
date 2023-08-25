//
//  FactoryApp.swift
//  CeibaApp
//
//  Created by yesid mendoza on 24/08/23.
//

import Foundation
import UIKit

class FactoryApp {
    // MARK: - Properties
    let view = ListUsersView()
   
    func createAppInit(windows:UIWindow){
        let interactor = ListUserInteractor()
        let listUserRouter = ListUserRouter(listUserView: view)
        let presenter = ListUserPresenter(ListUserInteractor: interactor, router: listUserRouter)
        presenter.view = view
        view.presenter = presenter
        windows.rootViewController = view
        windows.makeKeyAndVisible()
    }
}
