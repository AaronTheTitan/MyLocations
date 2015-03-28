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

class Location: NSManagedObject {

    @NSManaged var latitude: Double
    @NSManaged var longitude: Double
    @NSManaged var date: NSDate
    @NSManaged var locationDescription: String
    @NSManaged var category: String
    @NSManaged var placemark: CLPlacemark?

}
