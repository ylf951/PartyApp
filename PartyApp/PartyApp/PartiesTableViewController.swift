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

        /*
        let party = Party(id: "test", startDate: Date(), name: "Party Five", address: "2000 S Eads St")
        persistance.saveParty(party: party)
        */
        
        parties = persistance.fetchParties()
        
        
        print(parties.count)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source



    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return parties.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "partyCell", for: indexPath) as! PartyTableViewCell

        //Configure the cell...
        
        let party = parties[indexPath.row]
        
        cell.nameLabel.text = party.name
        
        
        
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            persistance.deleteParty(index: indexPath.row)
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
