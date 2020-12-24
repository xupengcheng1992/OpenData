//
//  AreaModel.swift
//  Opendata
//
//  Created by 许鹏程 on 2019/11/15.
//  Copyright © 2019 许鹏程. All rights reserved.
//

import UIKit

class AreaModel: NSObject {
    @objc var Namec : String = ""
    @objc var T_POP : String = ""
    @objc var `Type` : String = ""
    @objc var Code = ""
    
    init(dic : [String : AnyObject]) {
        super.init()
        setValuesForKeys(dic)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {}
}
