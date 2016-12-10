//
//  Persistance.swift
//  PartyApp
//
//  Created by Linfeng Yu on 2016/12/9.
//  Copyright © 2016年 Linfeng Yu. All rights reserved.
//

import Foundation

class Persistance {
    
    let partiesKey = "party"
    
    func saveParty(party: Party) {
        
        let userDefaults = UserDefaults.standard
        var parties = fetchParties()
        
        parties.append(party)
        
        let data = NSKeyedArchiver.archivedData(withRootObject: parties)
        userDefaults.set(data, forKey: partiesKey)
        userDefaults.synchronize()
        
    }
    
    func deleteParty(index: Int) {
        let userDefaults = UserDefaults.standard
        var parties = fetchParties()
        parties.remove(at: index)
        
        let data = NSKeyedArchiver.archivedData(withRootObject: parties)
        userDefaults.set(data, forKey: partiesKey)
        userDefaults.synchronize()
    }
    
    
    func fetchParties() -> [Party] {
        let userDefaults = UserDefaults.standard
        let parties = userDefaults.object(forKey: partiesKey) as? Data
        
        if let parties = parties {
            return NSKeyedUnarchiver.unarchiveObject(with: parties) as! [Party]
        }
        else{
            return [Party]()
        }
    }
}
