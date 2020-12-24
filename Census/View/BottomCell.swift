//
//  BottomCell.swift
//  Opendata
//
//  Created by 许鹏程 on 2019/11/14.
//  Copyright © 2019 许鹏程. All rights reserved.
//

import UIKit

class BottomCell: UITableViewCell {
    var titleLabel : UILabel!
    var numberLabel : UILabel!
    var leftView : UIView!
    var rightView : UIView!
    var typeStr = ""
    var codeStr = ""
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var model : AreaModel?{
        didSet{
            guard let model = model else { return }
            titleLabel.text = model.Namec
            let numberStr = StrTools.showInComma(source: model.T_POP) + "人"
            numberLabel.text = numberStr
            typeStr = model.Type
            codeStr = model.Code
        }
    }
}

extension BottomCell{
    func setUp(){
        self.selectionStyle = .none

        let leftImg = UIImageView(frame: CGRect(x: 20, y: 13, width: 13, height: 13))
        leftImg.image = UIImage(named: "right")
        self.addSubview(leftImg)
        
        titleLabel = UILabel(frame: CGRect(x: 45, y: 10, width: 70, height: 20))
        titleLabel.text = "中西區"
        self.addSubview(titleLabel)
        titleLabel.font = UIFont.systemFont(ofSize: 13)
        
        numberLabel = UILabel(frame: CGRect(x: 230, y: 12, width: 100, height: 15))
        numberLabel.text = "243 266人"
        numberLabel.textAlignment = .left
        numberLabel.font = UIFont.systemFont(ofSize: 13)
        self.addSubview(numberLabel)
        
        let rightImg = UIImageView(frame: CGRect(x: kScreenWidth - 30, y: 8, width: 21, height: 20))
        self.contentView.addSubview(rightImg)
        rightImg.image = UIImage(named: "mark")
        
        let cuttView = UIView()
        cuttView.backgroundColor = UIColor.init(r: 243, g: 243, b: 243)
        self.addSubview(cuttView)
        cuttView.snp.makeConstraints { (make) in
            make.bottom.equalTo(0)
            make.height.equalTo(1)
            make.left.right.equalTo(0)
        }
        
        //左侧的点击事件
        leftView = UIView()
        leftView.backgroundColor = UIColor.clear
        self.addSubview(leftView)
        leftView.snp.makeConstraints { (make) in
            make.top.left.bottom.equalTo(0)
            make.right.equalTo(-55)
        }
        
        //右侧的点击事件
        rightView = UIView()
        rightView.backgroundColor = UIColor.clear
        self.addSubview(rightView)
        rightView.snp.makeConstraints { (make) in
            make.top.bottom.right.equalTo(0)
            make.left.equalTo(leftView.snp.right)
        }
    }
}
