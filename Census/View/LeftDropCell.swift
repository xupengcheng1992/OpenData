//
//  LeftDrop.swift
//  Opendata
//
//  Created by 许鹏程 on 2019/11/7.
//  Copyright © 2019 许鹏程. All rights reserved.
//

import UIKit

class LeftDropCell: UITableViewCell {
    
    lazy var leftImg : UIImageView = UIImageView()
    
    lazy var rightLabel : UILabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc var model : FirstModel?{
        didSet{
            //检验模型是否是有值
            guard let model = model else{ return }
            rightLabel.text = model.TabName
        }
    }
}

extension LeftDropCell{
    func setUp(){
        self.selectionStyle = .none
        
        leftImg = UIImageView()
        self.addSubview(leftImg)
        leftImg.snp.makeConstraints { (make) in
            make.left.equalTo(70)
            make.width.equalTo(15)
            make.height.equalTo(15)
            make.top.equalTo(12)
            make.bottom.equalTo(-12)
        }
        
        rightLabel = UILabel()
        rightLabel.text = "人口"
        rightLabel.font = UIFont.systemFont(ofSize: 15)
        self.addSubview(rightLabel)
        rightLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(leftImg.snp.centerY)
            make.left.equalTo(leftImg.snp.right).offset(5)
        }
        
        let splitLabel = UILabel()
        splitLabel.backgroundColor = UIColor.init(r: 239, g: 239, b: 239)
        self.addSubview(splitLabel)
        splitLabel.snp.makeConstraints { (make) in
            make.left.right.equalTo(0)
            make.height.equalTo(1)
            make.bottom.equalTo(0)
        }
    }
}
