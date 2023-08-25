//
//  FactoryApp.swift
//  CeibaApp
//
//  Created by yesid mendoza on 24/08/23.
//

import UIKit

///  Module Router (aka: Wireframe)
class ListUserRouter: ListUserRouterProtocol {
    let view : ListUsersView
    
    init(listUserView: ListUsersView) {
        self.view = listUserView
    }
    func goToDetail (user: Character) {
        let postUserView = DetailCharactersView()
        postUserView.user.append(user)
        view.present(postUserView, animated: true)
        
       
       
    }
}
