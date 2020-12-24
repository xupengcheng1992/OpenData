//
//  mainCell.swift
//  Opendata
//
//  Created by 许鹏程 on 2019/10/15.
//  Copyright © 2019 许鹏程. All rights reserved.
//

import UIKit

class MainCell: UITableViewCell {
    var enterBtn : UIButton!
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MainCell{
    func setUp(){
        self.backgroundColor = UIColor.clear
        
        let backView = UIView()
        self.addSubview(backView)
        backView.backgroundColor  = UIColor.black
        backView.alpha = 0.6
        backView.snp.makeConstraints { (make) in
            make.left.equalTo(10)
            make.right.equalTo(-10)
            make.top.bottom.equalTo(0)
        }

        let image = UIImageView()
        image.backgroundColor = UIColor.blue
        self.addSubview(image)
        image.snp.makeConstraints { (make) in
            make.top.equalTo(3)
            make.left.equalTo(13);
            make.right.equalTo(-13)
            make.height.equalTo(200)
        }
        
        let titileLabel = UILabel()
        titileLabel.text = "2016年中期人口統計"
        titileLabel.textColor = UIColor.white
        titileLabel.textAlignment = NSTextAlignment.center
        self.addSubview(titileLabel)
        titileLabel.snp.makeConstraints { (make) in
            make.top.equalTo(image.snp.bottom).offset(18)
            make.left.equalTo(32)
        }
        
        let textLabel = UILabel()
        self.addSubview(textLabel)
        textLabel.textColor = UIColor.init(r: 195, g: 201, b: 205)
        textLabel.numberOfLines = 0
        textLabel.font = UIFont.systemFont(ofSize: 13)
        textLabel.text = "根據慣例，自1961年起，香港每10年進行一次人口普查，並在兩次人口普查中間，進行一次中期人口統計。香港於2016年6月30日至8月2日的34天期間進行了2016年中期人口統計"
        textLabel.snp.makeConstraints { (make) in
            make.top.equalTo(titileLabel.snp.bottom).offset(10)
            make.left.equalTo(25)
            make.right.equalTo(-25)
        }
        
        enterBtn = UIButton()
        enterBtn.setTitle("查看人口普查詳細>", for: .normal)
        enterBtn.setTitleColor(UIColor.white, for: .normal)
        enterBtn.backgroundColor = UIColor.orange
        enterBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 13)
        self.addSubview(enterBtn)
        enterBtn.snp.makeConstraints { (make) in
            make.top.equalTo(textLabel.snp.bottom).offset(20)
            make.centerX.equalTo(self.snp.centerX)
            make.left.equalTo(13)
            make.right.equalTo(-13)
            make.height.equalTo(35)
            make.bottom.equalTo(-15)
        }
    }
}
