//
//  CoreLocationController.swift
//  Travel in Silence
//
//  Created by Steve Clement on 11/04/15.
//  Copyright (c) 2015 Steve Clement. All rights reserved.
//

import Foundation
import CoreLocation

class CoreLocationController : NSObject, CLLocationManagerDelegate {

    var locationManager:CLLocationManager = CLLocationManager()
    
    override init() {
        super.init()
        
        self.locationManager.delegate = self
        self.locationManager.requestAlwaysAuthorization()
        self.locationManager.distanceFilter  = 300 // Must move at least 50 meters
        //self.locationManager.desiredAccuracy = kCLLocationAccuracyKilometer // Accurate within a kilometer
        self.locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters // Accurate within ten meters
    }
    
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        print("didChangeAuthorizationStatus")
        
        switch status {
        case .NotDetermined:
            print(".NotDetermined")
            break
            
        case .AuthorizedAlways:
            print(".Authorized")
            self.locationManager.startUpdatingLocation()
            break
            
        case .Denied:
            print(".Denied")
            break
            
        default:
            print("Unhandled authorization status")
            break
            
        }
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let location = locations.last as CLLocation!
        
        print("didUpdateLocations:  \(location.coordinate.latitude), \(location.coordinate.longitude)")
        
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(location, completionHandler: { (placemarks, e) -> Void in
            if let error = e {
                print("Error:  \(e!.localizedDescription)")
            } else {
                let placemark = placemarks!.last as CLPlacemark!
                
                let userInfo = [
                    "city":     placemark.locality,
                    "state":    placemark.administrativeArea,
                    "country":  placemark.country
                ]
                
                //NSNotificationCenter.defaultCenter().postNotificationName("LOCATION_AVAILABLE", object: nil, userInfo: userInfo)
                
                print("Location:  \(userInfo)")
                
            }
        })
        
    }
}