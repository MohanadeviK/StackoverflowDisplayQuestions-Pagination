//
//  Services.swift
//  StackOverflowQuestionsDisplay
//
//  Created by Madhu on 01/04/18.
//  Copyright © 2018 Madhu. All rights reserved.
//

//MARK: Header Files

import UIKit
import Alamofire
import ObjectMapper

typealias responseHandler = (DataResponse<Any>) -> Void


class Services {
    static func makeGETCall(urlString : String, parameters: [String : AnyObject]? = nil,
                            completionHandler : @escaping responseHandler, errorHandler: responseHandler? = nil) {
       
        let percentageURL : String = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        print("urlString", urlString)
        
        Alamofire.request(percentageURL, parameters: parameters)
            .responseJSON(completionHandler: { response in
                print("Response" ,response.result.value ?? "", response.response?.statusCode ?? 0)
                switch response.result {
                case .success( _):
                    if (response.response?.statusCode)! == 201 || response.response?.statusCode == 200 {
                        completionHandler(response)
                    } else {
                        print("status code 400")
                    }
                case .failure( let error):
                    print("SERVICE Error Message : " + error.localizedDescription)
                }
            })
    }
}
