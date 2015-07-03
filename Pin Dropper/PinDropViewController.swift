//
//  PinDropViewController.swift
//  Pin Dropper
//
//  Created by Talha Babar on 7/1/15.
//  Copyright (c) 2015 Talha Babar. All rights reserved.
//

import UIKit

class PinDropViewController: UIViewController, GMSMapViewDelegate {

    let PinsListSegueIdentifier = "ToPinsList"
    var count = 1
    var pins : [Pin] = []
    
    @IBOutlet weak var mapUIView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeMapView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == PinsListSegueIdentifier) {
            let svc = segue.destinationViewController as! PinsListViewController;
            svc.pinsArray = pins
        }
    }

    
    func mapView(mapView: GMSMapView!, didTapAtCoordinate coordinate: CLLocationCoordinate2D) {
        var address : String?
        let tapedAtlongitude = coordinate.longitude
        let tapedAtlattitude = coordinate.latitude
        let location = CLLocation(latitude: tapedAtlattitude, longitude: tapedAtlongitude) //changed!!!

        //var placemark :AnyObject
        CLGeocoder().reverseGeocodeLocation(location, completionHandler: {(placemarks, error) -> Void in
            if error != nil {
                println("Reverse geocoder failed with error" + error.localizedDescription)
                return
            }
            
            if placemarks.count > 0 {
                if  let placemark = placemarks[0] as? CLPlacemark {
                    address = placemark.name
                    let newPin = Pin(pinNumber: self.count, latitude: coordinate.latitude, longitude:coordinate.longitude, address: address!)
                    self.count++
                    self.pins.append(newPin)
                }
            }
            else {
                println("Problem with the data received from geocoder")
            }
        })
        let newMarker = GMSMarker()
        newMarker.position = CLLocationCoordinate2DMake(coordinate.latitude, coordinate.longitude)
        newMarker.map = mapView
    }
    
    func initializeMapView(){
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

