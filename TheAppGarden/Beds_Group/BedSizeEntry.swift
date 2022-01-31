//
//  BedSizeEntry.swift
//  TheAppGarden
//
//  Created by Ranula Ranatunga on 03/01/2020.
//  Copyright © 2020 Ranula Ranatunga. All rights reserved.
//

import UIKit

struct BedSizeEntry {
    
    var bedname : String
    var row : String
    var column : String
    var xField : String
    var yField : String
    var location : String
    
    
    var dictionaryData : [String: Any] {
        
        return [
        
            "bedname" : bedname,
            "row" : row,
            "column" : column,
            "xField" : xField,
            "yField" : yField, 
            "location" : location
            
        ]
    }
}

extension BedSizeEntry {
    
    init?(dictionary : [String: Any] ) {
        
        
    guard
        
        let bedname = dictionary["bedname"] as? String,
        let row = dictionary["row"] as? String,
        let column = dictionary["column"] as? String,
        let xField = dictionary["xField"] as? String,
        let yField = dictionary["yField"] as? String,
        let location = dictionary ["location"] as? String
        
        else {
            
            return nil
            
        }
        
       
        self.init(bedname: bedname , row: row , column:column , xField:xField , yField:yField , location:location)
        
    }
    
    
}

