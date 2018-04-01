//
//  WebServices.swift
//  StackOverflowQuestionsDisplay
//
//  Created by Madhu on 01/04/18.
//  Copyright © 2018 Madhu. All rights reserved.
//

//MARK: Header Files

import UIKit

extension Services {
    
    static func getQuestions(pageNo : Int, pageSize : Int, completionHandler : @escaping responseHandler) {
       makeGETCall(urlString: "https://api.stackexchange.com/2.2/questions?page=\(pageNo)&pagesize=\(pageSize)&site=stackoverflow", completionHandler: completionHandler)
    }
}
