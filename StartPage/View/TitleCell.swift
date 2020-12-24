//
//  TitleCell.swift
//  Opendata
//
//  Created by 许鹏程 on 2019/10/14.
//  Copyright © 2019 许鹏程. All rights reserved.
//

import UIKit
import SnapKit

class TitleCell: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension TitleCell{
    func setUp(){
        backgroundColor = UIColor.clear
     
        
        let titleLabel = UILabel()
        self.addSubview(titleLabel)
        titleLabel.textColor = UIColor.white
        titleLabel.font = UIFont.systemFont(ofSize: 19)
        titleLabel.text = "中原樓市大數據"
        titleLabel.textAlignment = NSTextAlignment.center
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(10)
            make.centerX.equalTo(self.snp.centerX)
        }
        
        
        let splitBtn = UIButton()
        self.addSubview(splitBtn)
        splitBtn.backgroundColor = UIColor.white
        splitBtn.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.left.equalTo(50)
            make.right.equalTo(-50)
            make.height.equalTo(2)
        }
        
        let dataLabel = UILabel()
        self.addSubview(dataLabel)
        dataLabel.textColor = UIColor.white
        dataLabel.text = "Centaline Property Market Big Data"
        dataLabel.font = UIFont.systemFont(ofSize: 18)
        dataLabel.textAlignment = NSTextAlignment.center
        dataLabel.snp.makeConstraints { (make) in
            make.top.equalTo(splitBtn.snp.bottom).offset(6)
            make.centerX.equalTo(self.snp.centerX)
            make.bottom.equalTo(-10)
        }
    }
}
