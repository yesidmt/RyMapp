//
//  FactoryApp.swift
//  CeibaApp
//
//  Created by yesid mendoza on 24/08/23.
//

import UIKit

/// ListUserPresenter Module Presenter
class ListUserPresenter {
    
    weak var view: listUserViewProtocol?
    private var interactor: ListUserInteractorProtocol
    var router: ListUserRouter
    
    init(ListUserInteractor: ListUserInteractor, router: ListUserRouter) {
        self.interactor = ListUserInteractor
        self.router = router
    }

    func goToDetail(user: Character) {
        router.goToDetail(user: user)
    }
    func getAllUsers() {
        interactor.getAllUsers(completion: { [weak self] (users) in
            guard let _ = self else {
                return
            }
            self?.view?.setItemsTableviewUsers(users: users)
       
        })
    }
}
