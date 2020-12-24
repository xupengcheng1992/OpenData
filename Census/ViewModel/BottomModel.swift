//
//  BottomModel.swift
//  Opendata
//
//  Created by 许鹏程 on 2019/11/15.
//  Copyright © 2019 许鹏程. All rights reserved.
//

import UIKit
import Alamofire

class BottomModel{
    var areaArr : [AreaModel] = [AreaModel]()
    var pathArr : [AreaModel] = [AreaModel]()
    
    func resquestData(finishCallback : @escaping () ->()){
        NetworkTools.requestData(urlString: listUrl, methodType: .get) { (response) in
            guard let responseArr = response as? [[String : AnyObject]] else { return }
            guard let dataArr = responseArr[0]["List"] as? [[String : AnyObject]] else { return }
            guard let pathArr = responseArr[0]["Path"] as? [[String : AnyObject]] else { return }
            
            for dic in dataArr{
                let group = AreaModel(dic: dic)
                self.areaArr.append(group)
            }
            
            for dic in pathArr{
                let group = AreaModel(dic: dic)
                self.pathArr.append(group)
            }
            
            finishCallback()
        }
    }
}
