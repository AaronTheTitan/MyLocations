//
//  LocationDetailsViewController.swift
//  ab-MyLocations
//
//  Created by Aaron Bradley on 3/25/15.
//  Copyright (c) 2015 Aaron Bradley. All rights reserved.
//

import UIKit
import CoreLocation

class LocationDetailsViewController: UITableViewController {

    var coordinate = CLLocationCoordinate2D(latitude: 0, longitude: 0)
    var placemark: CLPlacemark?

    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var latitudeLabel: UILabel!
    @IBOutlet weak var longitudeLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!

    // MARK: - Load Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        descriptionTextView.text = ""
        categoryLabel.text = ""

        latitudeLabel.text = String(format: "%.8f", coordinate.latitude)
        longitudeLabel.text = String(format: "%.8f", coordinate.longitude)

        if let placemark = placemark {
            addressLabel.text = stringFromPlacemark(placemark)
        } else {
            addressLabel.text = "No Address Found"
        }

        dateLabel.text = formatDate(NSDate())
    }

    // MARK: - Other Methods
    func stringFromPlacemark(placemark: CLPlacemark) -> String {
        return

    }

    // MARK: - IB Action Methods

    @IBAction func done() {
        dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func cancel() {
        dismissViewControllerAnimated(true, completion: nil)
    }
}
