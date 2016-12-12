//
//  MapViewController.swift
//  PartyApp
//
//  Created by Linfeng Yu on 2016/12/10.
//  Copyright © 2016年 Linfeng Yu. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController {

    var address = String()
    let geocoder = CLGeocoder()
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        // Forward geocoding using Apple map built-in CLGeocoder
        geocoder.geocodeAddressString(address, completionHandler: { (placemarks, error) in
            if (placemarks?.count)! > 0 {
                let placemark = placemarks?[0]
                let location = placemark?.location
                let coordinate = location?.coordinate
                
                // Obtained location with latlong
                let initialLocation = CLLocation(latitude: coordinate!.latitude, longitude: coordinate!.longitude)
                
                self.centerMapOnLocation(location: initialLocation)
                
                let annotation = MKPointAnnotation()
                annotation.coordinate = CLLocationCoordinate2D(latitude: coordinate!.latitude, longitude:coordinate!.longitude)
                annotation.title = self.address
                self.addPin(annotation: annotation)
            }
            
        })
    
    }

    // Make the location center in map and specify the rectangular region to display
    func centerMapOnLocation(location: CLLocation) {
        let regionRadius: CLLocationDistance = 1000
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius * 2.0, regionRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    // Add a single pin to MKMapView
    func addPin(annotation: MKPointAnnotation) {
        mapView.addAnnotation(annotation)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
