//
//  ViewController.swift
//  PruebaCLGeocoder
//
//  Created by Juan Daniel Rodrgiuez Perez on 08/09/21.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {
    var locationManager = CLLocationManager()
    lazy var geocoder = CLGeocoder()
    @IBOutlet var locationLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.requestWhenInUseAuthorization()
        var currentLoc: CLLocation!
        if(CLLocationManager.authorizationStatus() == .authorizedWhenInUse ||
        CLLocationManager.authorizationStatus() == .authorizedAlways) {
           currentLoc = locationManager.location
           print(currentLoc.coordinate.latitude)
           print(currentLoc.coordinate.longitude)
            let location = CLLocation(latitude: currentLoc.coordinate.latitude, longitude: currentLoc.coordinate.longitude)

                // Geocode Location
                geocoder.reverseGeocodeLocation(location) { (placemarks, error) in
                    // Process Response
                    self.processResponse(withPlacemarks: placemarks, error: error)
                }

        }else{
            print("No Location")
        }
    }
    
    private func processResponse(withPlacemarks placemarks: [CLPlacemark]?, error: Error?){
        if let error = error {
            print("Unable to Reverse Geocode Location (\(error))")
        } else {
            if let placemarks = placemarks, let placemark = placemarks.first {
                locationLabel.text = placemark.administrativeArea
                
            } else {
               print("No Matching Addresses Found")
            }
        }
    }

}
extension CLPlacemark {

    var compactAddress: String? {
        if let name = name {
            var result = ""

            if let street = thoroughfare{
                result += "\(street)"
            }
            if let subStreet = subThoroughfare{
                result += " \(subStreet)"
            }
           
            if let subLocality = subLocality{
                result += ", \(subLocality)"
            }
            if let subadmin = subAdministrativeArea{
                result += ", \(subadmin)"
            }
            if let cp = postalCode{
                result += "CP:, \(cp)"
                
            }
            if let admin = administrativeArea{
                result += "administrativeArea: \(admin)"
            }
            
            if let city = locality {
                result += ", \(city)"
            }


            return result
        }

        return nil
    }

}
