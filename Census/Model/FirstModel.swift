//
//  DataModel.swift
//  Opendata
//
//  Created by 许鹏程 on 2019/10/24.
//  Copyright © 2019 许鹏程. All rights reserved.
//

import UIKit

class FirstModel: NSObject {
    @objc var TabName : String = ""
    @objc var tabId : Int = 0
    @objc lazy var secondGroup : [SecondModel] = [SecondModel]()
    @objc var tag = 0 
    
    @objc var MenuItemGroups : [[String : AnyObject]]?{
        didSet{
            guard let menuItemGroups = MenuItemGroups else { return }
            for dic in menuItemGroups{
                secondGroup.append(SecondModel(dic: dic))
            }
        }
    }

    override init() {}
    
    init(dic : [String : AnyObject]){
        super.init()
        setValuesForKeys(dic)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {}
}
