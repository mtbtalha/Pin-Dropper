//
//  PinDropViewController.swift
//  Pin Dropper
//
//  Created by Talha Babar on 7/1/15.
//  Copyright (c) 2015 Talha Babar. All rights reserved.
//

import UIKit

class PinDropViewController: UIViewController, GMSMapViewDelegate {

    var pins : [Pin] = []
    
    @IBOutlet weak var mapUIView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gMapsInitialization()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "ToPinsList") {
            var svc = segue.destinationViewController as! PinsListViewController;
            
            svc.pinsArray = pins
            
        }
    }

    
    func mapView(mapView: GMSMapView!, didTapAtCoordinate coordinate: CLLocationCoordinate2D) {
        var address : String?
        let long : CLLocationDegrees = coordinate.longitude
        let lat : CLLocationDegrees = coordinate.latitude
        let location = CLLocation(latitude: lat, longitude: long) //changed!!!

        //var placemark :AnyObject
        CLGeocoder().reverseGeocodeLocation(location, completionHandler: {(placemarks, error) -> Void in
            if error != nil {
                println("Reverse geocoder failed with error" + error.localizedDescription)
                return
            }
            
            if placemarks.count > 0 {
                let pm = placemarks[0] as! CLPlacemark
                address = pm.name
                println(pm.name)
                var newPin = Pin(latitude: coordinate.latitude, longitude: coordinate.longitude, address: address!)
                self.pins.append(newPin)
                println(self.pins.count)
            }
            else {
                println("Problem with the data received from geocoder")
            }
        })
        var newMarker = GMSMarker()
        newMarker.position = CLLocationCoordinate2DMake(coordinate.latitude, coordinate.longitude)
        newMarker.map = mapView
    }
    
    func gMapsInitialization(){
        let sydneyAustraliaLatitude = -33.883633
        let sydneyAustraliaLongitude = 151.193927
        let camera = GMSCameraPosition.cameraWithLatitude(sydneyAustraliaLatitude,
            longitude: sydneyAustraliaLongitude, zoom: 14)
        let mapView = GMSMapView.mapWithFrame(CGRectMake(0, 0, self.mapUIView.frame.size.width, self.mapUIView.frame.size.height), camera: camera)
        mapView.myLocationEnabled = true
        self.mapUIView.addSubview(mapView)
        self.view.addSubview(mapUIView)
        mapView.delegate = self
    }
    
}

