//
//  CategoryPickerViewController.swift
//  ab-MyLocations
//
//  Created by Aaron Bradley on 3/25/15.
//  Copyright (c) 2015 Aaron Bradley. All rights reserved.
//

import UIKit

class CategoryPickerViewController: UITableViewController {

    var selectedCategoryName = ""
    var selectedIndexPath = NSIndexPath()

    let categories = ["No Category", "Apple Store", "Bar", "Bookstore", "Club", "Grocery Store", "Historic Building", "House", "Icecream Vendor", "Landmark", "Park"]


    // MARK: - UITableViewsource

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCellWithIdentifier("Cell") as UITableViewCell
        let categoryName = categories[indexPath.row]
        cell.textLabel!.text = categoryName

        if categoryName == selectedCategoryName {
            cell.accessoryType = .Checkmark
            selectedIndexPath = indexPath
        } else {
            cell.accessoryType = .None
        }

        return cell
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {

        if indexPath.row != selectedIndexPath.row {

            if let newCell = tableView.cellForRowAtIndexPath(indexPath) {
                newCell.accessoryType = .Checkmark
            }

            if let oldCell = tableView.cellForRowAtIndexPath(selectedIndexPath) {
                oldCell.accessoryType = .None
            }

            selectedIndexPath = indexPath
        }
    }

    // MARK: - SEGUE
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {

        if segue.identifier == "PickedCategory" {
            let cell = sender as UITableViewCell

            if let indexPath = tableView.indexPathForCell(cell) {
                selectedCategoryName = categories[indexPath.row]
            }
        }
    }

}