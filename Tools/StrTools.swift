//
//  Label_Extension.swift
//  Opendata
//
//  Created by 许鹏程 on 2019/11/19.
//  Copyright © 2019 许鹏程. All rights reserved.
//

import UIKit

let interval = 3

class StrTools {
     class func showInComma(source: String, gap: Int = interval, seperator: Character=" ") -> String {
        var temp = source
        let count = temp.count
        let sepNum = count / gap
        guard sepNum >= 1 else {
            return temp
        }
        for i in 1...sepNum {
            let index = count - gap * i
            guard index != 0 else {
                break
            }
            temp.insert(seperator, at: temp.index(temp.startIndex, offsetBy: index))
        }
        return temp
    }
    
    class func getTextHeigh(textStr :  String, font : UIFont, width : CGFloat)  -> CGFloat{
        let normalText : NSString = textStr as NSString
        let size = CGSize(width: width, height:CGFloat(MAXFLOAT))  
        let dic = NSDictionary(object: font, forKey : kCTFontAttributeName as! NSCopying)
        let stringSize = normalText.boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: dic as? [NSAttributedString.Key:Any], context:nil).size
        return  stringSize.height
    }
    
    class func getTextWidth(textStr :  String, font : UIFont, height : CGFloat)  -> CGFloat{
        let normalText : NSString = textStr as NSString
        let size = CGSize(width: CGFloat(MAXFLOAT), height: height)
        let dic = NSDictionary(object: font, forKey : kCTFontAttributeName as! NSCopying)
        let stringSize = normalText.boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: dic as? [NSAttributedString.Key:Any], context:nil).size
        return  stringSize.width
    }
}
