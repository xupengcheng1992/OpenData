//
//  PeopleCell.swift
//  Opendata
//
//  Created by 许鹏程 on 2019/10/25.
//  Copyright © 2019 许鹏程. All rights reserved.
//

import UIKit


class PeopleCell: UITableViewCell {
    
    var leftImg : UIImageView!
    
    var rightLabel : UILabel!
    
    var dataArr :  Array<SecondModel>!
    
    var tableView : UITableView!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc var model : NewModel?{
        didSet{
            //检验模型是否是有值
            guard let model = model else{ return }
            rightLabel.text = model.title
        }
    }
}

extension PeopleCell{
    func setUp(){
        self.backgroundColor = UIColor.lightGray
        self.selectionStyle = .none
        
        leftImg = UIImageView()
        leftImg.image = UIImage(named: "people")
        self.addSubview(leftImg)
        leftImg.snp.makeConstraints { (make) in
            make.left.equalTo(10)
            make.width.equalTo(15)
            make.height.equalTo(15)
            make.top.equalTo(5)
            make.bottom.equalTo(-10)
        }

        rightLabel = UILabel()
        rightLabel.text = "人口"
        rightLabel.font = UIFont.systemFont(ofSize: 15)
        self.addSubview(rightLabel)
        rightLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(leftImg.snp.centerY)
            make.left.equalTo(leftImg.snp.right).offset(5)
        }
    }
}

