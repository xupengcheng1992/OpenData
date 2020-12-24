//
//  CensusCell.swift
//  Opendata
//
//  Created by 许鹏程 on 2019/10/21.
//  Copyright © 2019 许鹏程. All rights reserved.
//

import UIKit

class CensusCell: UITableViewCell {
    var contenLabel : UILabel!
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension CensusCell{
    func setUp(){
        let imageView = UIImageView()
        self.addSubview(imageView)
        imageView.image = UIImage(named: "Lifting")
        imageView.snp.makeConstraints { (make) in
            make.top.equalTo(14)
            make.left.equalTo(8)
            make.width.equalTo(15)
            make.height.equalTo(15)
        }
        
        contenLabel = UILabel()
        self.addSubview(contenLabel)
        contenLabel.textColor = UIColor.black
        contenLabel.textAlignment = .center
        contenLabel.font = UIFont.systemFont(ofSize: 13)
        contenLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(imageView.snp.centerY)
            make.left.equalTo(imageView.snp.right).offset(4)
            make.bottom.equalTo(-14)
        }
        
        let bottomView = UIView()
        bottomView.backgroundColor = UIColor.init(r: 243, g: 243, b: 243)
        self.addSubview(bottomView)
        bottomView.snp.makeConstraints { (make) in
            make.bottom.equalTo(0)
            make.height.equalTo(1)
            make.left.right.equalTo(0)
        }
    }
}
