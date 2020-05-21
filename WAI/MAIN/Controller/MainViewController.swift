//
//  MainViewController.swift
//  WAI
//
//  Created by Михаил Дмитриев on 21.05.2020.
//  Copyright © 2020 Mikhail Dmitriev. All rights reserved.
//

import UIKit
import CoreLocation
import LocalAuthentication

class MainViewController: UIViewController {
//MARK: - OUTLETS
    @IBOutlet weak var checkAndGoButton: UIButton!
    
    
//MARK: - MANAGERS
    //TouchID Manager
    var touchIDManager = TouchIDManager()
    
    //Manager !!!!!!!!!!!!!
    let locationManager = CLLocationManager()
    
    
//MARK: - LOADING
    override func viewDidLoad() {
        super.viewDidLoad()
        //NanigationBar hide
        navigationController?.navigationBar.isHidden = true
        //User location request
        locationManager.requestWhenInUseAuthorization()
        //Delegate
        touchIDManager.delegate = self
    }
}




//MARK: - EXTENSION. TouchIDManagerDelegate
extension MainViewController: TouchIDManagerDelegate {   
    
    @IBAction func checkAndGoButtonPressed(_ sender: UIButton) {
        touchIDManager.touchRequest()
        print("Button Pressed")
    }
    func segueToMap() {
           performSegue(withIdentifier: "mapSegue", sender: .none)
    }
}
