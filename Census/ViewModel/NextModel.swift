//
//  NextModel.swift
//  Opendata
//
//  Created by 许鹏程 on 2019/12/11.
//  Copyright © 2019 许鹏程. All rights reserved.
//

import UIKit

class NextModel{
    var areaArr : [AreaModel] = [AreaModel]()
    
    func resquestData(typeStr : String, codeStr : String,finishCallback : @escaping () ->()){
        NetworkTools.requestData(urlString: "http://census.centamap.com/api/Page/GetAreaList?year=2016", methodType: .get, parameters: ["Type" : typeStr ,"Code" : codeStr]) { (response) in
            guard let responseArr = response as? [[String : AnyObject]] else { return }
            guard let dataArr = responseArr[0]["List"] as? [[String : AnyObject]] else { return }
            for dic in dataArr{
                let group = AreaModel(dic: dic)
                self.areaArr.append(group)
            }
            finishCallback()
        }
    }
}
