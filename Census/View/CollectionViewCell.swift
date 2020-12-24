//
//  collectionViewCell.swift
//  Opendata
//
//  Created by 许鹏程 on 2019/11/13.
//  Copyright © 2019 许鹏程. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    var titleLabel : UILabel!
    override init(frame: CGRect) {
        super.init(frame : frame)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var model : ThreeModel?{
        didSet{
            titleLabel.text = model?.ParamName
        }
    }
}

extension CollectionViewCell{
    func setUp(){
//        self.backgroundColor = UIColor.blue
        titleLabel = UILabel()
        titleLabel.text = "總人口"
        titleLabel.font = UIFont.systemFont(ofSize: 14)
        titleLabel.textColor = UIColor.lightGray
//        titleLabel.backgroundColor = UIColor.red
        self.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.snp.centerX)
            make.centerY.equalTo(self.snp.centerY)
        }
    }
}
