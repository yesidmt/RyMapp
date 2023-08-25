//
//  FactoryApp.swift
//  CeibaApp
//
//  Created by yesid mendoza on 24/08/23.
//


import UIKit

/// PostUserView Module View
class DetailCharactersView: UIViewController {

    // MARK: - @IBOutlet
    @IBOutlet weak var content: UIView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var status: UILabel!
    @IBOutlet weak var imageCharacter: UIImageView!
    @IBOutlet weak var species: UILabel!
    // MARK: - Properties
    var user: [Character] = []
    var posts: [PostUserData] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupDataUser()
    }
    func setupView () {
        content.layer.borderColor = UIColor.blue.cgColor
        content.layer.shadowColor = UIColor.blue.cgColor
        content.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        content.layer.shadowRadius = 5.0
        content.layer.shadowOpacity = 0.4
    }
    func setupDataUser() {
        name.text = user[0].name
        status.text = user[0].status
        species.text = user[0].species
        
        
        let url = URL(string: user[0].image)!
        Util.sharedInstance.getData(from: url) { data, response, error in
                guard let data = data, error == nil else { return }
                DispatchQueue.main.async() { [weak self] in
                    self?.imageCharacter.image = UIImage(data: data)
                }
        }
    }
   
}
