//
//  LocationsViewController.swift
//  ab-MyLocations
//
//  Created by Aaron Bradley on 3/29/15.
//  Copyright (c) 2015 Aaron Bradley. All rights reserved.
//

import UIKit
import CoreData
import CoreLocation

class LocationsViewController: UITableViewController {

    var managedObjectContext: NSManagedObjectContext!

    override func viewDidLoad() {
        super.viewDidLoad()

    }


    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("LocationCell") as UITableViewCell
        let descriptionLabel = cell.viewWithTag(100) as UILabel
        descriptionLabel.text = "If you can see this"

        let addresLabel = cell.viewWithTag(101) as UILabel
        addresLabel.text = "Then it works!"

        return cell
    }
}
