//
//  LocationDetailsViewController.swift
//  ab-MyLocations
//
//  Created by Aaron Bradley on 3/25/15.
//  Copyright (c) 2015 Aaron Bradley. All rights reserved.
//

import UIKit

class LocationDetailsViewController: UITableViewController {

//    var coordinate = CLLocationCoordinate2D(latitude: 0, longitude: 0)
//    var placemark: CLPlacemark?

    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var latitudeLabel: UILabel!
    @IBOutlet weak var longitudeLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!

    @IBAction func done() {
        dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func cancel() {
        dismissViewControllerAnimated(true, completion: nil)
    }
}
