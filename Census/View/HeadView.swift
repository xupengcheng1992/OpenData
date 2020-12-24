//
//  HeadView.swift
//  Opendata
//
//  Created by 许鹏程 on 2019/11/14.
//  Copyright © 2019 许鹏程. All rights reserved.
//

import UIKit

class HeadView: UITableViewHeaderFooterView {
    var titileLabel : UILabel!
    var numberLabel : UILabel!

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var model : AreaModel?{
        didSet{
            guard let model = model else { return }
            titileLabel.text = model.Namec
            let numberStr = StrTools.showInComma(source: model.T_POP) + "人"
            numberLabel.text = numberStr
        }
    }
}

extension HeadView{
    func setUp(){
        self.contentView.backgroundColor = UIColor.init(r: 250, g: 233, b: 231)
        
        titileLabel = UILabel(frame: CGRect(x: 13, y: 10, width: 50, height: 15))
        titileLabel.text = "全香港"
        titileLabel.textColor = UIColor.init(r: 132, g: 43, b: 28)
        titileLabel.font = UIFont.init(name: "HelveticaNeue-Medium", size: 15)
        self.contentView.addSubview(titileLabel)
        
        numberLabel = UILabel(frame: CGRect(x: 214, y: 10, width: 100, height: 15))
        self.contentView.addSubview(numberLabel)
        numberLabel.text = "7 336 585人"
        numberLabel.textAlignment = .left
        numberLabel.font = UIFont.init(name: "HelveticaNeue-Medium", size: 15)
        numberLabel.textColor = UIColor.init(r: 132, g: 43, b: 28)
        
        let rightImg = UIImageView(frame: CGRect(x: kScreenWidth - 30, y: 8, width: 21, height: 20))
        self.contentView.addSubview(rightImg)
        rightImg.image = UIImage(named: "mark")
    }
}
