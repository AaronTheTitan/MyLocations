//
//  MyLocations.swift
//  ab-MyLocations
//
//  Created by Aaron Bradley on 3/27/15.
//  Copyright (c) 2015 Aaron Bradley. All rights reserved.
//

import Foundation
import CoreData
import CoreLocation
import MapKit

class Location: NSManagedObject, MKAnnotation {

    @NSManaged var latitude: Double
    @NSManaged var longitude: Double
    @NSManaged var date: NSDate
    @NSManaged var locationDescription: String
    @NSManaged var category: String
    @NSManaged var placemark: CLPlacemark?


    // MKAnnotation protocol requres the class to implement 3 properties: coordinate, title, subtitle
    var coordinate: CLLocationCoordinate2D {
        return CLLocationCoordinate2DMake(latitude, longitude)
    }

    var title: String! {
        if locationDescription.isEmpty {
            return "(No Description)"
        } else {
            return locationDescription
        }
    }

    var subtitle: String! {
        return category
    }

}
