//
//  FactoryApp.swift
//  CeibaApp
//
//  Created by yesid mendoza on 24/08/23.
//

import UIKit

struct Item {
    var id: Int = 0
    var name: String = ""
    var status: String = ""
    var species: String = ""
    var image: String = ""
    
}
struct Users: Codable {
    var data: [Character]
}
struct User: Codable {
    let id: Int
    let name: String
    let gender: String
    let image: String
    let species: String
    let status: String
}


struct Location: Codable {
    let name: String
    let url: String
}

struct Origin: Codable {
    let name: String
    let url: String
}

struct Character: Codable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let origin: Origin
    let location: Location
    let image: String
    let episode: [String]
    let url: String
    let created: String
}

struct Info: Codable {
    let count: Int
    let pages: Int
    let next: String
}

struct RickAndMortyAPIResponse: Codable {
    let info: Info
    let results: [Character]
}
