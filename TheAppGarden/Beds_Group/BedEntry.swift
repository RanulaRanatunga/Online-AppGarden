//
//  BedEntry.swift
//  TheAppGarden
//
//  Created by Amal on 17/12/2019.
//  Copyright © 2019 Ranula Ranatunga. All rights reserved.
//

import UIKit

struct BedEntry {
    
    var bedDescription : String
    var bedName : String

    
     // var beds: BedEntry = [BedEntry]
    //var bedDescription : [BedEntry] = []
   // var bedName : [BedEntry] = []

    var dictionaryData : [String: Any]
    {
        return [
        
            "bedDescription": bedDescription,
            "bedName" : bedName
            
        ]
    }
}

extension BedEntry {
    
    init?(dictionary: [String: Any]) {
        
        guard
         let bedDescription = dictionary["bedDescription"] as? String,
         let bedName = dictionary["bedName"] as? String
        
        else {
            
            return nil
        }
        
        self.init(bedDescription: bedDescription , bedName: bedName)
        
    }
}
