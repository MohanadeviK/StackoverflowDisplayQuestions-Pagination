//
//  Items.swift
//  StackOverflowQuestionsDisplay
//
//  Created by Madhu on 01/04/18.
//  Copyright © 2018 Madhu. All rights reserved.
//

//MARK: Header Files

import UIKit
import ObjectMapper

class Items: Mappable {
    
    var tags : Array<String>?
    var owner : OwnerDetails?
    var topic: String?
    
    required init(map : Map) {
    }
    
    func mapping(map: Map) {
        topic <- map["title"]
        tags <- map["tags"]
        owner <- map["owner"]
    }
}
