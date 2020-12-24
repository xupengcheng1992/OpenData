//
//  leftCell.swift
//  Opendata
//
//  Created by 许鹏程 on 2019/10/22.
//  Copyright © 2019 许鹏程. All rights reserved.
//

import UIKit
class LiveCell: UITableViewCell {
    var titleLabel : UILabel!
    var threeDataArr : Array<ThreeModel>!
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
            guard let model = model else{ return }
            titleLabel.text = model.title
        }
    }
}

extension LiveCell{
    func setUp(){
        titleLabel = UILabel()
        titleLabel.numberOfLines = 0
        self.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(5)
            make.left.equalTo(10)
            make.right.equalTo(-2)
            make.bottom.equalTo(-5)
        }
        titleLabel.textColor = UIColor.init(r: 162, g: 115, b: 114)
        titleLabel.font = UIFont(name: "Helvetica-Bold", size: 13)
    }
}
