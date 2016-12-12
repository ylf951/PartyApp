//
//  AddPartyViewController.swift
//  PartyApp
//
//  Created by Linfeng Yu on 2016/12/9.
//  Copyright © 2016年 Linfeng Yu. All rights reserved.
//

import UIKit

class AddPartyViewController: UIViewController {

    
    let persistance = Persistance()
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var addressTF: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBAction func cancelButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveButton(_ sender: UIButton) {
        
        
        let name = nameTF.text ?? ""
        let address = addressTF.text ?? ""
        if name == "" || address == ""{
            let alertController = UIAlertController(title: "Warning", message: "Party name and address can not be blank!", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(defaultAction)
            present(alertController, animated: true, completion: nil)
        }
        else {
            let id = UUID().uuidString
            let date = datePicker.date
            
            let party = Party(id: id, startDate: date, name: name, address: address)
            persistance.saveParty(party: party)
            
            self.dismiss(animated: true, completion: nil)
            
        }
   
        
        
        
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
