//
//  ServiceProviderDetailMapView.swift
//  al-ios-challenge
//
//  Created by Dustin Waldron on 6/15/19.
//  Copyright © 2019 Dustin Waldron. All rights reserved.
//

import UIKit
import MapKit

class ServiceProviderDetailMapView: MKMapView {
    
    let RegionRadius: CLLocationDistance = 1000
    var serviceProviderLocation: CLLocation!
    
    private func setInitialLocation(latitude: Double, longitude: Double) {
        serviceProviderLocation = CLLocation(latitude: latitude, longitude: longitude)
    }
    
    func centerMapOnServiceProviderLocation(serviceProvider: ServiceProvider) {
        setInitialLocation(latitude: serviceProvider.latitude, longitude: serviceProvider.longitude)
        let coordinateRegion = MKCoordinateRegion(center: serviceProviderLocation.coordinate, latitudinalMeters: RegionRadius, longitudinalMeters: RegionRadius)
        setRegion(coordinateRegion, animated: true)
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
