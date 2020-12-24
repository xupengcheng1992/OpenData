//
//  ThreeModel.swift
//  Opendata
//
//  Created by 许鹏程 on 2019/10/30.
//  Copyright © 2019 许鹏程. All rights reserved.
//

import UIKit

class ThreeModel: NSObject {
    @objc var ParamName : String = ""
    @objc var Id : Int = 0
    
     init(dic : [String : AnyObject]){
         super.init()
         setValuesForKeys(dic)
     }
    override func setValue(_ value: Any?, forUndefinedKey key: String) {}
}
