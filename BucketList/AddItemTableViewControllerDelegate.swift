//
//  AddItemTableViewControllerDelegate.swift
//  BucketList
//
//  Created by McCabe Tonna on 11/7/17.
//  Copyright © 2017 Wambl, LLC. All rights reserved.
//

import Foundation

protocol AddItemTableViewControlDelegate: class {
    func itemSaved(by controller: AddItemTableViewController, with text: String, at indexPath: NSIndexPath?)
    
    func cancelButtonPressed(by controller: AddItemTableViewController)
}
