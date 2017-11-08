//
//  AddItemTableViewController.swift
//  BucketList
//
//  Created by McCabe Tonna on 11/7/17.
//  Copyright © 2017 Wambl, LLC. All rights reserved.
//

import UIKit

class AddItemTableViewController: UITableViewController {
    
     weak var delegate: AddItemTableViewControlDelegate?
    
    var item: String?
    var indexPath: NSIndexPath?
    
   
    
    @IBOutlet weak var itemTextField: UITextField!
   
    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
        delegate?.cancelButtonPressed(by: self)
        
    }
    
    @IBAction func saveButtonPressed(_ sender: UIBarButtonItem) {
        print("saved")
        let text = itemTextField.text!
        delegate?.itemSaved(by: self, with: text, at: indexPath)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        itemTextField.text = item
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

   

}
