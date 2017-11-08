//
//  ViewController.swift
//  BucketList
//
//  Created by McCabe Tonna on 11/7/17.
//  Copyright © 2017 Wambl, LLC. All rights reserved.
//

import UIKit

class BucketListViewController: UITableViewController, AddItemTableViewControlDelegate {
    var items = ["go to the moon", "eat a candy bar", "swim in the amazon", "ride a motorcycle in tokyo"]
    override func viewDidLoad() {
        super.viewDidLoad()
        print("loaded")
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return  items.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListItemCell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        return cell
    }
    
    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print("select")
//    }
    
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        performSegue(withIdentifier: "editItemSegue", sender: indexPath)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        items.remove(at: indexPath.row)
        tableView.reloadData()
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "addItemSegue" {
        let navigationCongroller = segue.destination as! UINavigationController
        let addItemTableViewController = navigationCongroller.topViewController as! AddItemTableViewController
        
        addItemTableViewController.delegate = self
        }
        else if segue.identifier == "editItemSegue"{
            let navigationCongroller = segue.destination as! UINavigationController
            let addItemTableViewController = navigationCongroller.topViewController as! AddItemTableViewController
            
            addItemTableViewController.delegate = self
            
            
            let indexPath = sender as! NSIndexPath
            let item = items[indexPath.row]
            
            addItemTableViewController.item = item
            addItemTableViewController.indexPath = indexPath
        }
        
    }
    func cancelButtonPressed(by conroller: AddItemTableViewController){
        
        dismiss(animated: true, completion: nil)
    }
    
    func itemSaved(by controller: AddItemTableViewController, with text: String, at indexPath: NSIndexPath?) {
       
        if let ip = indexPath {
            print("in edit line 69 - bucketlist controller")
            items[ip.row] = text
            
        } else {
            items.append(text)
            tableView.reloadData()
            dismiss(animated: true, completion: nil)
        }
        
      tableView.reloadData()
        dismiss(animated:true, completion:nil)
    }
}
//
//extension ViewController: UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//       return  items.count //logic
//    }
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "ListItemCell", for: indexPath)
//        cell.textLabel?.text = items[indexPath.row]
//        return cell
//        //logic
//    }
//}
//extension ViewController: UITableViewDelegate {
//}
//
