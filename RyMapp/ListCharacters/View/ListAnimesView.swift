//
//  ListAnimesView.swift
//  AnimesView
//
//  Created by yesid mendoza on 31/01/23.
//

import UIKit

class ListAnimesView: UIViewController {
    var viewcontroller: UIViewController {
        return createViewcontroller()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "ListAnimesView"
     
    }
    func createViewcontroller() -> UIViewController {
        let view = ListAnimesView(nibName: "ListAnimesView", bundle: Bundle.main)
        return view
    }

}

