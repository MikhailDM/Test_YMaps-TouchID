//
//  TouchIDManager.swift
//  WAI
//
//  Created by Михаил Дмитриев on 21.05.2020.
//  Copyright © 2020 Mikhail Dmitriev. All rights reserved.
//

import Foundation
import LocalAuthentication

protocol TouchIDManagerDelegate {
    //Segue function from View
    func segueToMap()    
}

class TouchIDManager {
    
    var delegate: TouchIDManagerDelegate?
    
    func touchRequest(){
        let context = LAContext()
        var error: NSError?

        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "Identification required"
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                DispatchQueue.main.async {
                    if success {
                        self.delegate?.segueToMap()
                        print("ID PASS")
                    } else {
                        print("ID FAILED")
                    }
                }
            }
        } else {
            enterPassword()
            print("NO BIOMETRY")
        }
    }
    //Password in case no biometry
    private func enterPassword() {
        let context = LAContext()
        var error: NSError?
        if context.canEvaluatePolicy(.deviceOwnerAuthentication, error: &error) {
            let reason = "Enter Password"
            context.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: reason) { success, authenticationError in
                DispatchQueue.main.async {
                    if success {
                        self.delegate?.segueToMap()
                        print("PASSWORD PASS")
                    } else {
                        print("PASSWORD FAILED")
                    }
                }
            }
        } else {
            print("NO PASSWORD")
        }
    }
}
