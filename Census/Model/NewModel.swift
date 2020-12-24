//
//  NewModel.swift
//  Opendata
//
//  Created by 蔡生伟 on 2019/11/25.
//  Copyright © 2019 许鹏程. All rights reserved.
//

import UIKit

class NewModel: NSObject {
    @objc var title : String = ""
    @objc var id : Int = 0
    @objc var type : Int = 1   // 1:第一层 ，2: 第二层  3: 第三层
    @objc var imageStr : String = ""
}
