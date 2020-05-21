//
//  MapManager.swift
//  WAI
//
//  Created by Михаил Дмитриев on 21.05.2020.
//  Copyright © 2020 Mikhail Dmitriev. All rights reserved.
//

import Foundation
import YandexMapKit
import CoreLocation

/*protocol MapManagerDelegate {
    func didUpdateLocation(_ locationManager: MapManager)
}*/


struct MapManager {
//MARK: - MANAGERS
    let locationManager = CLLocationManager()

//MARK: - DELEGATE
    //var delegate: MapManagerDelegate?
    
    
//MARK: - CURRENT LOCATION FOR YMAP
    func getCurrentLocation() -> YMKPoint {
        let TARGET_LOCATION = YMKPoint(latitude: 59.945933, longitude: 30.320045)
        return TARGET_LOCATION
    }
    
    func location() {
        //locationManager.requestLocation()
    }
}
