//
//  FactoryApp.swift
//  CeibaApp
//
//  Created by yesid mendoza on 24/08/23.
//

import Foundation
import UIKit

class SessionUserCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var status: UILabel!
    @IBOutlet weak var species: UILabel!
    @IBOutlet weak var contentCard: UIView!
    @IBOutlet weak var imageCharacter: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        setView()
    }
    func setView(){
        self.contentCard.layer.borderWidth = 0.2
        self.contentCard.layer.borderColor = UIColor.blue.cgColor
        self.contentCard.layer.shadowColor = UIColor.blue.cgColor
        self.contentCard.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        self.contentCard.layer.shadowRadius = 9.0
        self.contentCard.layer.shadowOpacity = 0.5
        
    }
    func setData(item: Item) {
        name.text = item.name
        status.text = item.status
        species.text = item.species
        
        let url = URL(string: item.image)!
        Util.sharedInstance.getData(from: url) { data, response, error in
                guard let data = data, error == nil else { return }
                DispatchQueue.main.async() { [weak self] in
                    self?.imageCharacter.image = UIImage(data: data)
                }
        }
    }
    
}

