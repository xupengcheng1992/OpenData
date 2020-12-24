//
//  ThreeCell.swift
//  Opendata
//
//  Created by 许鹏程 on 2019/10/24.
//  Copyright © 2019 许鹏程. All rights reserved.
//

import UIKit

class TotalCell: UITableViewCell {
    var titleLabel : UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc var model : NewModel?{
        didSet{
            guard let model = model else{ return }
            titleLabel.text = model.title
        }
    }
}

extension TotalCell{
    func setUp(){
        titleLabel = UILabel()
        titleLabel.numberOfLines = 0
        titleLabel.font = UIFont.systemFont(ofSize: 13)
        self.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(5)
            make.left.equalTo(18)
            make.right.equalTo(-2)
            make.bottom.equalTo(-5)
        }
    }
}
