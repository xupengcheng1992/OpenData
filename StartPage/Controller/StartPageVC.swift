//
//  StartPageVC.swift
//  Opendata
//
//  Created by 许鹏程 on 2019/10/14.
//  Copyright © 2019 许鹏程. All rights reserved.
//

import UIKit
let titleId = "titleId"
let mainId = "mainId"
class StartPageVC: UIViewController {
    var populationVC  : PopulationVC!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
}

extension StartPageVC{
    func setUp(){
        let backImg = UIImageView(frame: self.view.bounds)
        backImg.image = UIImage(named: "WechatIMG2")
        view.addSubview(backImg)
    
        //MARK:- 创建tableView
        let tableView = UITableView()
        tableView.backgroundColor = UIColor.clear
        tableView.separatorStyle = .none
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.left.right.bottom.equalTo(0)
            make.top.equalTo(15)
        }
        tableView.estimatedRowHeight = 44
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.register(TitleCell.self, forCellReuseIdentifier: titleId)
        tableView.register(MainCell.self, forCellReuseIdentifier: mainId)
    }
}

extension StartPageVC : UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: titleId, for: indexPath)as! TitleCell
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: mainId, for: indexPath)as! MainCell
            cell.enterBtn.addTarget(self, action: #selector(clickIndent), for: .touchUpInside)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 0
        }
        return 25
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
}

extension StartPageVC{
    @objc func clickIndent(){
        populationVC = PopulationVC()
        populationVC.modalPresentationStyle = .fullScreen
        self.present(populationVC, animated: true, completion: nil)
    }
}
