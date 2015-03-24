//
//  FirstViewController.swift
//  ab-MyLocations
//
//  Created by Aaron Bradley on 3/23/15.
//  Copyright (c) 2015 Aaron Bradley. All rights reserved.
//

import UIKit
import CoreLocation

class CurrentLocationViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var latitudeLabel: UILabel!
    @IBOutlet weak var longitudeLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var tagButton: UIButton!
    @IBOutlet weak var getButton: UIButton!

    let locationManager = CLLocationManager()

    var location: CLLocation?
    var updatingLocation = false
    var lastLocationError: NSError?


    // MARK: - BEGIN CODE ----------------------------/
    override func viewDidLoad() {
        super.viewDidLoad()
        updateLabels()
    }

    @IBAction func getLocation() {

        let authStatus: CLAuthorizationStatus = CLLocationManager.authorizationStatus()

        if authStatus == .NotDetermined {
            locationManager.requestWhenInUseAuthorization()
            return
        }

        if authStatus == .Denied || authStatus == .Restricted {
            showLocationServicesDeniedAlert()
            return
        }

        startLocationManager()
        updateLabels()

        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        locationManager.startUpdatingLocation()
    }

    func locationManager(manager: CLLocationManager!, didFailWithError error: NSError!) {
        println("didFailWithError \(error)")

        if error.code == CLError.LocationUnknown.rawValue {
            return
        }

        lastLocationError = error

        stopLocationManager()
        updateLabels()
    }

    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        let newLocation = locations.last as CLLocation
        println("didUpdateLocations \(newLocation)")

        if newLocation.timestamp.timeIntervalSinceNow < -5 {
            return
        }

        if newLocation.horizontalAccuracy < 0 {
            return
        }

        if location == nil || location!.horizontalAccuracy > newLocation.horizontalAccuracy {
            lastLocationError = nil
            location = newLocation
            updateLabels()

            if newLocation.horizontalAccuracy <= locationManager.desiredAccuracy {
                println("***We're done!")
                stopLocationManager()
            }
        }
//
//        lastLocationError = nil
//        location = newLocation
//        updateLabels()
    }

    func startLocationManager() {
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
            updatingLocation = true
        }
    }

    func stopLocationManager() {
        if updatingLocation {
            locationManager.stopUpdatingLocation()
            locationManager.delegate = nil
            updatingLocation = false
        }
    }

    func showLocationServicesDeniedAlert() {
        let alert = UIAlertController(title: "Location Services Disabled", message: "Please enable location services for this app in Settings.", preferredStyle: .Alert)
        let okAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
        presentViewController(alert, animated: true, completion: nil)
    }

    func updateLabels() {

        if let location = location {
            latitudeLabel.text = String(format: "%.8f", location.coordinate.latitude)
            longitudeLabel.text = String(format: "%.8f", location.coordinate.longitude)
            tagButton.hidden = false
            messageLabel.text = ""
        } else {
            latitudeLabel.text = ""
            longitudeLabel.text = ""
            addressLabel.text = ""
            tagButton.hidden = true

            var statusMessage: String

            if let error = lastLocationError {
                if error.domain == kCLErrorDomain && error.code == CLError.Denied.rawValue {
                    statusMessage = "Location Services Disabled"
                } else {
                    statusMessage = "Error Getting Location"
                }
            } else if !CLLocationManager.locationServicesEnabled() {
                statusMessage = "Location Services Disabled"
            } else if updatingLocation {
                statusMessage = "Searching..."
            } else {
                statusMessage = "Tap 'Get My Location' to Start"
            }

            messageLabel.text = statusMessage
        }
    }
}

