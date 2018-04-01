//
//  OwnerDetails.swift
//  StackOverflowQuestionsDisplay
//
//  Created by Madhu on 01/04/18.
//  Copyright © 2018 Madhu. All rights reserved.
//

//MARK: Header Files

import ObjectMapper
import UIKit

class OwnerDetails: Mappable {
    var reputation : Int?
    var userId : Double?
    var userType: String?
    var acceptRate: Int?
    var profileImage: String?
    var displayName: String?
    var link: String?

    
    required init(map : Map) {
    }
    
    func mapping(map: Map) {
        reputation <- map["reputation"]
        userId <- map["user_id"]
        userType <- map["user_type"]
        acceptRate <- map["accept_rate"]
        profileImage <- map["profile_image"]
        displayName <- map["display_name"]
        link <- map["link"]
    }
}
