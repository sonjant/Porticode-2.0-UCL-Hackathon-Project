//
//  ViewController.swift
//  american express
//
//  Created by Sonja Tang on 28/10/2017.
//  Copyright © 2017 Sonja Tang. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    
    
    @IBAction func ImportImage(_ sender: AnyObject) {
        
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.sourceType = UIImagePickerControllerSourceType.photoLibrary
        imagePickerController.allowsEditing = false
        self.present(imagePickerController, animated: true, completion: nil)
    }
    

    
    @IBOutlet weak var label: UILabel!
    @IBAction func buttonTapped(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

class MapViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    var locationManager = CLLocationManager()
    
    @IBOutlet weak var map: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        locationManager.requestWhenInUseAuthorization()
        
        locationManager.startUpdatingLocation()
        
        setupPlaces()
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        if let location = manager.location?.coordinate {
        
        let center = CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)
        
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
            
        self.map.setRegion(region, animated: true)
            
        self.map.showsUserLocation = true
        }
    }
    
    func setupPlaces(){
        let bigBen = MKPointAnnotation()
        let bigBenLocation = CLLocationCoordinate2D(latitude: 51.5007, longitude: -0.1246)
        bigBen.coordinate = bigBenLocation
        bigBen.title = "Big Ben"
        bigBen.subtitle = "Famous clock bell in tower."
        
        self.map.addAnnotation(bigBen)
    }
    

//        // Do any additional setup after loading the view, typically from a nib.
//        let coords = CLLocationCoordinate2D(latitude: 0.0, longitude: 0.0)
//        let span = MKCoordinateSpan(latitudeDelta: 0, longitudeDelta: 0)
//        let region = MKCoordinateRegion(center: coords, span: span)
//        map.setRegion(region, animated: true)
//        map.isScrollEnabled = true
    
//
//    let bigBen = MKPointAnnotation()
//    let bigBenLocation = CLLocationCoordinate2D(latitude: 51.5007, longitude: 0.1246)
//    bigBen.coordinate = bigBenLocation
//    bigBen.title = "Big Ben"
//    bigBen.subtitle = "Famous clock bell in tower."
//
//    func mapView(mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
//        var view = mapView.dequeueReusableAnnotationView(withIdentifier: "")
//        if view == nil {
//            view = MKPinAnnotationView(annotation: bigBen, reuseIdentifier: "")
//            view?.canShowCallout = true
//            view?.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
//        } else {
//            view?.annotation = annotation
//        }
//
//        mapView.addAnnotation(bigBen)
//
//        return view
//
//    }
//
//
//    var selectedAnnotation: MKPointAnnotation!
//
//    func mapView(mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
//        if control == view.rightCalloutAccessoryView {
//            selectedAnnotation = view.annotation as? MKPointAnnotation
//            performSegue(withIdentifier: "NextScene", sender: self)
//        }
//    }
    
}
