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
    @NSManaged var photoID: NSNumber?

    var hasPhoto: Bool {
        return photoID != nil
    }

    var photoPath: String {
        assert(photoID != nil, "No photo ID set")
        let filename = "Photo-\(photoID!.integerValue).jpg"
        return applicationDocumentsDirectory.stringByAppendingPathComponent(filename)
    }

    var photoImage: UIImage? {
        return UIImage(contentsOfFile: photoPath)
    }

    class func nextPhotoID() -> Int {
        let userDefaults = NSUserDefaults.standardUserDefaults()
        let currentID = userDefaults.integerForKey("PhotoID")
        userDefaults.setInteger(currentID + 1, forKey: "PhotoID")
        userDefaults.synchronize()
        return currentID
    }

    // A CODE SNIPPET I CAN USE TO REMOVE ANY FILE OR FOLDER...NSFILEMANAGER CLASS HAS MANY USEFUL METHODS FOR DEALING WITH THE FILE SYSTEM
    func removePhotoFile() {
        if hasPhoto {
            let path = photoPath
            let fileManager = NSFileManager.defaultManager()
            if fileManager.fileExistsAtPath(path) {
                var error: NSError?
                if !fileManager.removeItemAtPath(path, error: &error) {
                    println("Error removing file: \(error!)")
                }
            }
        }
    }

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
