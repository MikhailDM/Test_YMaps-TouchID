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
        let context = LAContext()
        var error: NSError?

        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "Identify yourself!"

            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) {
                [weak self] success, authenticationError in

                DispatchQueue.main.async {
                    if success {
                        //self?.unlockSecretMessage()
                        print("ID PASS")
                    } else {
                        print("ID FAILED")
                    }
                }
            }
        } else {
            // no biometry
        }
        
        
        
        
        //performSegue(withIdentifier: "mapSegue", sender: .none)
    }
}
