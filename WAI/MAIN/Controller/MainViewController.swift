//
//  MainViewController.swift
//  WAI
//
//  Created by Михаил Дмитриев on 21.05.2020.
//  Copyright © 2020 Mikhail Dmitriev. All rights reserved.
//

import UIKit
import CoreLocation

class MainViewController: UIViewController {
//MARK: - OUTLETS
    @IBOutlet weak var checkAndGoButton: UIButton!
    
    
//MARK: - MANAGERS
    //Manager
    let locationManager = CLLocationManager()
    
    
//MARK: - LOADING
    override func viewDidLoad() {
        super.viewDidLoad()
        //NanigationBar hide
        navigationController?.navigationBar.isHidden = true
        //User location request
        locationManager.requestWhenInUseAuthorization()
    }
    
    
 //MARK: - ACTIONS
    @IBAction func checkAndGoButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "mapSegue", sender: .none)
    }
}
