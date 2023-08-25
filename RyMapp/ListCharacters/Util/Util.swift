//
//  FactoryApp.swift
//  CeibaApp
//
//  Created by yesid mendoza on 24/08/23.
//

import Foundation
import UIKit

class Util {
    static let sharedInstance = Util()
    private init() { }

    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
}


extension UIColor {
    static var random: UIColor {
        return UIColor(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1),
            alpha: 1.0
        )
    }
}

enum Endpoint {
    case users
    static let baseURL = "https://rickandmortyapi.com/api/character"
       
    var path: String {
        switch self {
        case .users:
            return "/?page=1"
        }
    }
    func url() -> URL? {
            return URL(string: Endpoint.baseURL + path)
    }
}
