//
//  DataViewModel.swift
//  Opendata
//
//  Created by 许鹏程 on 2019/10/23.
//  Copyright © 2019 许鹏程. All rights reserved.
//

import UIKit
import Alamofire

class DataViewModel {
    var firstArr : [FirstModel] = [FirstModel]()

    func resquestData(finishCallback : @escaping () ->()){
        NetworkTools.requestData(urlString: censusUrl, methodType: .get) { (response) in
            guard let responseArr = response as? [[String : AnyObject]] else { return }

            for dic in responseArr{
                let group = FirstModel(dic: dic)


                self.firstArr.append(group)
            }
            finishCallback()
        }
    }
}

