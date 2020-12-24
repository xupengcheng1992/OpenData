//
//  SecondModel.swift
//  Opendata
//
//  Created by 许鹏程 on 2019/10/24.
//  Copyright © 2019 许鹏程. All rights reserved.
//

import UIKit

class SecondModel: NSObject {
    @objc var Title : String = ""
    @objc var GroupId : Int = 0
    @objc var threeGroup : [ThreeModel] = [ThreeModel]()
    @objc var tag = 0
    @objc var labelModel = CGRect(x: 0, y: 0, width: 0, height: 0)
    @objc var splitModel = CGRect(x: 0, y: 0, width: 0, height: 0)
    
    @objc var Items : [[String : AnyObject]]?{
        didSet{
            guard let items = Items else { return }
            for dic in items {
                threeGroup.append(ThreeModel(dic: dic))
            }
        }
    }
    
    init(dic : [String : AnyObject]){
        super.init()
        setValuesForKeys(dic)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {}
}
