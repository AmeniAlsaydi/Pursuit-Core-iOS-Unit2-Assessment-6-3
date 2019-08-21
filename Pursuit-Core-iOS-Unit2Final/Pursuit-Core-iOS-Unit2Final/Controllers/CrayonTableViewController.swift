//
//  CrayonTableViewController.swift
//  Pursuit-Core-iOS-Unit2Final
//
//  Created by Michelle Cueva on 8/21/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class CrayonTableViewController: UITableViewController {
    
    var allCrayons:[Crayon]!
    
//    var cellColor: startingColor!

    override func viewDidLoad() {
        super.viewDidLoad()
        getCrayonInfo()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    func getCrayonInfo() {
        let allItems = Crayon.allTheCrayons
        allCrayons = allItems
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allCrayons.count
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
         let crayon = allCrayons[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "crayonCell", for: indexPath)
       
        cell.textLabel?.text = crayon.name
        cell.detailTextLabel?.text = crayon.hex
        cell.backgroundColor = UIColor.init(displayP3Red: CGFloat(crayon.red/255), green: CGFloat(crayon.green/255), blue: CGFloat(crayon.blue/255), alpha: 1)
        if cell.backgroundColor == UIColor(red: 0, green: 0, blue: 0, alpha: 1) {
            cell.textLabel?.textColor = UIColor.white
            cell.detailTextLabel?.textColor = UIColor.white
        }

        return cell
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let segueIdentifer = segue.identifier else {fatalError("No indentifier in segue")}
        
        switch segueIdentifer {
            
        case "colorSegue":
            guard let DetailVC = segue.destination as? DetailViewController else {
                fatalError("Unexpected segue VC")
                
            }
            guard let selectedIndexPath = tableView.indexPathForSelectedRow else {fatalError("No row selected")
            }
            
            let currentCrayon = allCrayons[selectedIndexPath.row]
            
            DetailVC.crayon = currentCrayon
            
            
            
        default:
            fatalError("unexpected segue identifies")
            
        }
    }

}
