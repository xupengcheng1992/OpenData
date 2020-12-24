//
//  RightDropCell.swift
//  Opendata
//
//  Created by 许鹏程 on 2019/11/7.
//  Copyright © 2019 许鹏程. All rights reserved.
//

import UIKit

class RightDropCell: UITableViewCell {
    let interval : CGFloat = 19.0
    
    lazy var rightLabel : UILabel = UILabel()
    
    lazy var splitLabel : UILabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc var model : SecondModel?{
        didSet{
            //检验模型是否是有值
            guard let model = model else{ return }
            rightLabel.text = model.Title
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        rightLabel.frame = model!.labelModel
        splitLabel.frame = model!.splitModel
    }
}

extension RightDropCell{
    func setUp(){
        rightLabel = UILabel()
        rightLabel.numberOfLines = 0
        rightLabel.font = UIFont.systemFont(ofSize: 14)
        self.contentView.addSubview(rightLabel)
        rightLabel.textAlignment = .center
        
        
        splitLabel = UILabel()
        splitLabel.backgroundColor = UIColor.init(r: 239, g: 239, b: 239)
        self.contentView.addSubview(splitLabel)
    }
}

