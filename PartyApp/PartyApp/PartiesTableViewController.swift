//
//  PartiesTableViewController.swift
//  PartyApp
//
//  Created by Linfeng Yu on 2016/12/9.
//  Copyright © 2016年 Linfeng Yu. All rights reserved.
//

import UIKit

class PartiesTableViewController: UITableViewController {
    
    let mapSegueIdentifier = "mapSegue"
    let persistance = Persistance()
    var parties = [Party]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // Fetch up to date parties and reload data for tableView everytime this UITableViewController is displayed,
    // especially when a new party is added
    override func viewWillAppear(_ animated: Bool) {
        parties = persistance.fetchParties()
        self.tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    // Get the count of items to display in the tableView
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return parties.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "partyCell", for: indexPath) as! PartyTableViewCell
        
        //Configure the cell...
        
        //Get party to show in this particular row
        let party = parties[indexPath.row]
        
        //Display party name
        cell.nameLabel.text = party.name
        
        //Display startDate in specific date format
        let dataFormatter = DateFormatter()
        dataFormatter.dateFormat = "MM/dd/yy, hh:mma"
        cell.startDateLabel.text =  dataFormatter.string(from: party.startDate)
        
        return cell
    }
    
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    
    // Override to support editing the table view.
    // Enable swipe to delte cell
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete party stored
            persistance.deleteParty(index: indexPath.row)
            // Delete the row from the data source
            parties.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
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
    // Handle cell click event, use segue to envoke new ViewController and pass the party data in this particular cell
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == mapSegueIdentifier {
            let destination = segue.destination as! MapViewController
            let party = parties[tableView.indexPathForSelectedRow!.row]
            destination.address = party.address
        }
    }
    
    
}


