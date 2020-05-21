//
//  MainViewController.swift
//  WAI
//
//  Created by Михаил Дмитриев on 21.05.2020.
//  Copyright © 2020 Mikhail Dmitriev. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
//MARK: - OUTLETS
    @IBOutlet weak var checkAndGoButton: UIButton!
        
    
//MARK: - LOADING
    override func viewDidLoad() {
        super.viewDidLoad()
        //Hide Navigation Bar
        navigationController?.navigationBar.isHidden = true
    }
   

}
