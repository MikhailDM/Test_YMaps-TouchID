//
//  MapViewController.swift
//  WAI
//
//  Created by Михаил Дмитриев on 21.05.2020.
//  Copyright © 2020 Mikhail Dmitriev. All rights reserved.
//

import UIKit
import YandexMapKit
import CoreLocation


class MapViewController: UIViewController {
    //MARK: - OUTLETS
    @IBOutlet weak var mapView: YMKMapView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    
    //MARK: - MANAGERS
    private let locationManager = CLLocationManager()
    private let mapManager = MapManager()
    
    
    //MARK: - LOADING
    override func viewDidLoad() {
        super.viewDidLoad()
        //NanigationBar hide
        navigationController?.navigationBar.isHidden = false
        //Self as delegate for Location
        locationManager.delegate = self
        //Request current location
        locationManager.requestLocation()
        //Activity indicator
        activityIndicator.startAnimating()
    }
}


extension MapViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            setUpMap(location: YMKPoint(latitude: location.coordinate.latitude,
                                        longitude: location.coordinate.longitude))
        }
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    private func setUpMap(location: YMKPoint) {
        activityIndicator.stopAnimating()
        mapView.mapWindow.map.mapObjects.addPlacemark(with: location)
        mapView.mapWindow.map.move(
            with: YMKCameraPosition.init(target: location, zoom: 15, azimuth: 0, tilt: 0),
            animationType: YMKAnimation(type: YMKAnimationType.smooth, duration: 5),
            cameraCallback: nil)
    }
}
