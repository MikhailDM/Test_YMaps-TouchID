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
    
    
//MARK: - MANAGERS
    //TouchID Manager
    var touchIDManager = TouchIDManager()
    
    
//MARK: - LOADING
    override func viewDidLoad() {
        super.viewDidLoad()
        //NanigationBar hide
        navigationController?.navigationBar.isHidden = true
        //Delegate
        touchIDManager.delegate = self
    }
}




//MARK: - EXTENSION. TouchIDManagerDelegate
extension MainViewController: TouchIDManagerDelegate {
    //Button pressed
    @IBAction func checkAndGoButtonPressed(_ sender: UIButton) {
        touchIDManager.touchRequest()
        print("Button Pressed")
    }
    func segueToMap() {
        //Segue to Map View if TouchID success. Logic in manager
        performSegue(withIdentifier: "mapSegue", sender: .none)
    }
}
