//
//  MapDataModel.swift
//  TripDashboard
//
//  Created by stephanie Chamblee on 8/11/17.
//  Copyright © 2017 Stephanie Chamblee. All rights reserved.
//

import UIKit
import SwiftyJSON

class MapDataModel: NSObject {

    var latitude = Double()
    var longitude = Double()
    var teamName = String()

    func loadJSON(jsonString: String?) -> Bool {
        
        if jsonString == nil {
            return false
        }
        if let dataFromString = jsonString?.data(using: .utf8, allowLossyConversion: false) {
            let json = JSON(data: dataFromString)
            for (index,subJson):(String, JSON) in json {
                latitude = json[0].double!
                longitude = json[1].double!
                teamName = json[14].string!
            }
            
            
        }
        return true
    }
}


