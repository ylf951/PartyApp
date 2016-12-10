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

        geocoder.geocodeAddressString(address, completionHandler: {(placemarks, error) -> void in
            if((error) != nil){
                print("Error", error)
            }
            
        })
        
        print(address)
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        
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
