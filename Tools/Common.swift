//
//  Colour_Extension.swift
//  Opendata
//
//  Created by 许鹏程 on 2019/10/15.
//  Copyright © 2019 许鹏程. All rights reserved.
//

import UIKit

let kScreenWidth = UIScreen.main.bounds.size.width

let kScreenHight = UIScreen.main.bounds.size.height

let censusUrl = "http://census.centamap.com/api/Census/GetMenu?year=2016"

let listUrl = "http://census.centamap.com/api/Page/GetAreaList?year=2016&type=hk&code=hk"

extension UIColor{
    convenience init(r : CGFloat, g : CGFloat, b : CGFloat) {
        self.init(red : r / 255.0, green : g / 255.0, blue : b / 255.0, alpha: 1.0)
    }
}

extension UIView{
    //x position
    var x : CGFloat{
        get {
            return frame.origin.x
        }
        set(newVal){
            var tempFrame : CGRect = frame
            tempFrame.origin.x     = newVal
            frame                  = tempFrame
        }
    }
    //y position
    var y : CGFloat{
        get {
            return frame.origin.y
        }
        set(newVal){
            var tempFrame : CGRect = frame
            tempFrame.origin.y     = newVal
            frame                  = tempFrame
        }
    }
    //height
    var height : CGFloat{
        get {
            return frame.size.height
        }
        set(newVal){
            var tmpFrame : CGRect = frame
            tmpFrame.size.height  = newVal
            frame                 = tmpFrame
        }
    }
    // width
    var width : CGFloat {
        get {
            return frame.size.width
        }
        set(newVal) {
            var tmpFrame : CGRect = frame
            tmpFrame.size.width   = newVal
            frame                 = tmpFrame
        }
    }
    // left
    var left : CGFloat {
        get {
            return x
        }
        set(newVal) {
            x = newVal
        }
    }
    
    // right
    var right : CGFloat {
        get {
            return x + width
        }
        set(newVal) {
            x = newVal - width
        }
    }
    // top
    var top : CGFloat {
        get {
            
            return y
        }
        set(newVal) {
            
            y = newVal
        }
    }
    // bottom
    var bottom : CGFloat {
        get {
            return y + height
        }
        set(newVal) {
            
            y = newVal - height
        }
    }
    //centerX
    var centerX : CGFloat {
        get {
            return center.x
        }
        set(newVal) {
            
            center = CGPoint(x: newVal, y: center.y)
        }
    }
    //centerY
    var centerY : CGFloat {
        get {
            return center.y
        }
        set(newVal) {
            
            center = CGPoint(x: center.x, y: newVal)
        }
    }
    //middleX
    var middleX : CGFloat {
        get {
            return width / 2
        }
    }
    
    //middleY
    var middleY : CGFloat {
        get {
            return height / 2
        }
    }
    
    //middlePoint
    var middlePoint : CGPoint {
        get {
            return CGPoint(x: middleX, y: middleY)
        }
    }
}
