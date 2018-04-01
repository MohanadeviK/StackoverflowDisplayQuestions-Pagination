//
//  GetQuestions.swift
//  StackOverflowQuestionsDisplay
//
//  Created by Madhu on 01/04/18.
//  Copyright © 2018 Madhu. All rights reserved.
//

//MARK: Header Files

import UIKit
import ObjectMapper

class GetQuestions: Mappable {
    
    var items: Array<Items>?
    
    required init(map : Map) {
    }
    
    func mapping(map: Map) {
        items <- map["items"]
    }
}
