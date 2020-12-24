//
//  BackCell.swift
//  Opendata
//
//  Created by 许鹏程 on 2019/12/12.
//  Copyright © 2019 许鹏程. All rights reserved.
//

import UIKit

class BackCell: UITableViewCell {
    var titleLabel : UILabel!
    var numberLabel : UILabel!
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension BackCell{
    func setUp(){
        let leftImg = UIImageView(frame: CGRect(x: 20, y: 13, width: 13, height: 13))
        leftImg.image = UIImage(named: "top")
        self.addSubview(leftImg)
        
        titleLabel = UILabel(frame: CGRect(x: 45, y: 10, width: 70, height: 20))
        titleLabel.text = "中西區"
        titleLabel.textColor = UIColor.init(r: 132, g: 43, b: 28)
        self.addSubview(titleLabel)
        titleLabel.font = UIFont.systemFont(ofSize: 13)
        
        numberLabel = UILabel(frame: CGRect(x: 230, y: 12, width: 100, height: 15))
        numberLabel.text = "243 266人"
        numberLabel.textAlignment = .left
        numberLabel.textColor = UIColor.init(r: 132, g: 43, b: 28)
        numberLabel.font = UIFont.systemFont(ofSize: 13)
        self.addSubview(numberLabel)
        
        let rightImg = UIImageView(frame: CGRect(x: kScreenWidth - 30, y: 8, width: 21, height: 20))
        self.contentView.addSubview(rightImg)
        rightImg.image = UIImage(named: "mark")
    }
}
