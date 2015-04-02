//
//  String+AddText.swift
//  ab-MyLocations
//
//  Created by Aaron Bradley on 4/1/15.
//  Copyright (c) 2015 Aaron Bradley. All rights reserved.
//

extension String {
    mutating func addText(text: String?, withSeparator separator: String = "") {
        if let text = text {
            if !isEmpty {
                self += separator
            }
            self += text
        }
    }
}
