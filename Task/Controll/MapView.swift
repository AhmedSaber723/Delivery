//
//  MapView.swift
//  Task
//
//  Created by Saber on 4/6/20.
//  Copyright © 2020 Saber. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapView: UIViewController {

    @IBOutlet weak var MapDidView: MKMapView!
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkLocationServices()
        // Do any additional setup after loading the view.
    }
    
    func 	setuplocationmanager() {
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    func checkLocationServices() {
        if CLLocationManager.locationServicesEnabled(){
            setuplocationmanager()
            checkLocationAuthorization()
        }else {
            
        }
    }

    func checkLocationAuthorization(){
        
        switch CLLocationManager.authorizationStatus() {
        case .authorizedWhenInUse:
            MapDidView.showsUserLocation = true
            break
        case .denied:
            break
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
            break
        case .restricted:
            break
        case .authorizedAlways:
            break
            
        
       
    }
   
    
}
    
}

extension MapView : CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
    }
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        
    }
    
}
