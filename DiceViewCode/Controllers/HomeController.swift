//
//  HomeController.swift
//  DiceViewCode
//
//  Created by Matheus Sousa on 27/06/23.
//

import UIKit


class HomeController: UIViewController {
    
    var screen: HomeScreen?
    
    
    override func loadView() {
        self.screen = HomeScreen()
        self.view = self.screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
}
