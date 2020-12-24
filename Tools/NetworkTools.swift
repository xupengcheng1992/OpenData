//
//  NetworkTools.swift
//  SwiftTest
//
//  Created by 许鹏程 on 2019/5/28.
//  Copyright © 2019 CDT-3. All rights reserved.
//

import UIKit
import Alamofire

enum MehodType{
    case get
    case post
}

class NetworkTools {
    class func requestData(urlString : String, methodType : MehodType ,parameters : [String : String]? = nil,finishCallback : @escaping ( _ result : AnyObject) -> ()){
        let method : HTTPMethod
        switch methodType {
        case .get:
            method = .get
            break
        default:
            method = .post
        }
        Alamofire.request(urlString, method: method, parameters: parameters).responseJSON { (response) in
            guard let result = response.result.value else{
                return
            }
            finishCallback(result as AnyObject)
        }
    }
}
