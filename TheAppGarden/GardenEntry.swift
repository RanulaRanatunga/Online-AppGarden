//
//  GardenEntry.swift
//  TheAppGarden
//
//  Created by Amal on 05/12/2019.
//  Copyright © 2019 Ranula Ranatunga. All rights reserved.
//

import UIKit


struct GardenEntry {
    
//    var GardenName :String
//    var GardenLocation :String
//    var GardenImage :String
    
    var description : String
    var name : String
    var image : String
    //var beds:Bedentity = [BedEntity]

    

    var dictionary: [String: Any] {
        
        return [
            
            "description": description,
            "name" : name,
            "image": image
        ]
    }
}

extension GardenEntry {
    
    init?(dictionary: [String: Any]) {
        
        guard let description = dictionary["description"] as? String,
        let name = dictionary["name"] as? String,
        let image = dictionary["image"] as? String
        
            else {
                
                return nil
        }
        
      //  self.init(gardenName: gardenName , gardenDescription: gardenDescription ,gardenImage: gardenImage)
        
        
        self.init(description: description , name: name , image: image)
    }
}
