//
//  FactoryApp.swift
//  CeibaApp
//
//  Created by yesid mendoza on 24/08/23.
//

import Foundation

struct PostUserData: Codable {
    let userId: Int
    let id: Int
    let title: String
    let body : String
}

struct PostUserItem {
    let title: String
    let body : String
}
