//
//  CensusVC.swift
//  Opendata
//
//  Created by 许鹏程 on 2019/10/16.
//  Copyright © 2019 许鹏程. All rights reserved.
//

import UIKit

let listNumber = 3
let downCell = "downCell"
let peopleCell = "peopleCell"
let liveCell = "liveCell"
let totalCell = "totalCell"
let leftDropCell = "leftDropCell"
let rightDropCell = "rightDropCell"
let collectionCell = "collectionCell"
let bottomCell = "bottomCell"
let headCell = "headCell"
let backCell = "backCell"
//延迟动画
let nstime = 0.5
var leftIcon : UIImageView = UIImageView()
var leftLabel : UILabel = UILabel()
var arrowImg : UIImageView = UIImageView()
var rightLabel : UILabel = UILabel()
var rightArrow : UIImageView = UIImageView()
var secondGroup : [SecondModel] = [SecondModel]()
var newModelArr : [NewModel] = [NewModel]()
var totalHeight : CGFloat = 0
var flag = 0

var monitor : NSInteger = 0
var vector : NSInteger = 0

class BestVC: UIViewController {
    var titleView : UIView!
    var titleLabel : UILabel!
    
    private lazy var dataViewModel : DataViewModel = DataViewModel()
    
    private lazy var bottomData : BottomModel = BottomModel()
    
    private lazy var nextModel : NextModel = NextModel()
    
    lazy var imageArr : [String] = {
        let imageArr = ["people","education","economic","home","house"]
        return imageArr
    }()
    
    lazy var placeholderArr : [String] = {
        let placeholderArr = ["總人口","性別比率"]
        return placeholderArr
    }()
    
    //蒙版
    lazy var coverView : UIView = {
        let coverView = UIView.init(frame: self.view.bounds)
        coverView.backgroundColor = UIColor.black
        coverView.alpha = 0.2
        //取消蒙版操作
        let cancelTap = UITapGestureRecognizer(target: self, action: #selector(cancelIncident))
        coverView.addGestureRecognizer(cancelTap)
        return coverView
    }()
    
    //下拉箭头
    lazy var triangleImg : UIImageView = {
        let triangleImg = UIImageView()
        triangleImg.image = UIImage(named: "triangle")
        view.addSubview(triangleImg)
        triangleImg.snp.makeConstraints { (make) in
            make.top.equalTo(titleView.snp.bottom).offset(-5)
            make.right.equalTo(-10)
            make.width.equalTo(20)
            make.height.equalTo(20)
        }
        return triangleImg
    }()
    
    //筛选列表
    lazy var downTableView : UITableView = {
        let downTableView = UITableView(frame: CGRect(x: view.right - 65, y: 79, width: 60, height: 130))
        downTableView.backgroundColor = UIColor.white
        downTableView.delegate = self
        downTableView.dataSource = self
        downTableView.register(CensusCell.self, forCellReuseIdentifier: downCell)
        downTableView.separatorStyle = .none
        downTableView.isScrollEnabled = false
        return downTableView
    }()
    
    lazy var strArr : [String] = {
        let strArr = ["預設","升序","降序"]
        return strArr
    }()
    
    //左上列表
    lazy var leftTableView : UITableView = {
        let leftTableView = UITableView(frame: CGRect(x: -255, y: 70, width: 255, height: view.height - 106))
        leftTableView.dataSource = self
        leftTableView.delegate = self
        leftTableView.separatorStyle = .none
        leftTableView.showsVerticalScrollIndicator = false
        leftTableView.estimatedRowHeight = 44
        leftTableView.rowHeight = UITableView.automaticDimension
        leftTableView.register(PeopleCell.self, forCellReuseIdentifier: peopleCell)
        leftTableView.register(LiveCell.self, forCellReuseIdentifier: liveCell)
        leftTableView.register(TotalCell.self, forCellReuseIdentifier: totalCell)
        return leftTableView
    }()
    
    //左侧下拉列表
    lazy var peopleTableView : UITableView = {
        let peopleTableView = UITableView(frame: CGRect(x: 0, y: 106, width: kScreenWidth/2, height: 180))
        peopleTableView.delegate = self
        peopleTableView.dataSource = self
        peopleTableView.separatorStyle = .none
        peopleTableView.register(LeftDropCell.self, forCellReuseIdentifier: leftDropCell)
        peopleTableView.layer.shadowColor = UIColor(white: 000000, alpha: 0.3).cgColor
        peopleTableView.layer.shadowOffset = CGSize(width: 0.5, height: 2)
        peopleTableView.layer.shadowOpacity = 1
        peopleTableView.clipsToBounds = false
        return peopleTableView
    }()
    
    //右侧下拉列表
    lazy var secondTableView : UITableView = {
        let secondTableView = UITableView(frame: CGRect(x: kScreenWidth/2, y: 106, width: kScreenWidth/2, height: 180))
        secondTableView.delegate = self
        secondTableView.dataSource = self
        secondTableView.isScrollEnabled = false
        secondTableView.separatorStyle = .none
        secondTableView.register(RightDropCell.self, forCellReuseIdentifier: rightDropCell)
        secondTableView.layer.shadowColor = UIColor(white: 000000, alpha: 0.3).cgColor
        secondTableView.layer.shadowOffset = CGSize(width: 0.5, height: 2)
        secondTableView.layer.shadowOpacity = 1
        secondTableView.clipsToBounds = false
        return secondTableView
    }()
    
    //collectionView
    lazy var collectionView : UICollectionView = {
        let layout = CenterFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 106, width: kScreenWidth, height: 44),collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: collectionCell)
        collectionView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        collectionView.backgroundColor = UIColor.white
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    //bottom tableView
    lazy var bottomTableView : UITableView = {
        let bottomTableView = UITableView(frame: CGRect(x: 0, y: 150, width: kScreenWidth, height: kScreenHight - 186))
        bottomTableView.dataSource = self
        bottomTableView.delegate = self
        bottomTableView.rowHeight = 40
        bottomTableView.bounces = false
        bottomTableView.showsVerticalScrollIndicator = false
        bottomTableView.register(BottomCell.self, forCellReuseIdentifier: bottomCell)
        bottomTableView.register(HeadView.self, forHeaderFooterViewReuseIdentifier: headCell)
        bottomTableView.separatorStyle = .none
        return bottomTableView
    }()
    
    lazy var levelTableView : UITableView = {
        let levelTableView = UITableView(frame: CGRect(x: 0, y: 150, width: kScreenWidth, height: kScreenHight - 186))
        levelTableView.dataSource = self
        levelTableView.delegate = self
        levelTableView.rowHeight = 40
        levelTableView.bounces = false
        levelTableView.showsVerticalScrollIndicator = false
        levelTableView.register(BottomCell.self, forCellReuseIdentifier: bottomCell)
        levelTableView.register(BackCell.self, forCellReuseIdentifier: backCell)
        levelTableView.register(HeadView.self, forHeaderFooterViewReuseIdentifier: headCell)
        levelTableView.separatorStyle = .none
        return levelTableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
}

extension BestVC{
    //初始化UI
    func setUp(){
        loadData()
        //初始化开关
        view.backgroundColor = UIColor.white
        
        titleView = UIView()
        titleView.backgroundColor = UIColor.init(r: 146, g: 33, b: 19)
        titleView.backgroundColor = UIColor.red
        view.addSubview(titleView)
        titleView.snp.makeConstraints { (make) in
            make.left.right.equalTo(0)
            make.top.equalTo(0)
            make.height.equalTo(70)
        }
        
        let bottomView = UIView()
        bottomView.backgroundColor = UIColor.init(r: 87, g: 87, b: 87)
        view.addSubview(bottomView)
        bottomView.snp.makeConstraints { (make) in
            make.bottom.equalTo(0)
            make.left.right.equalTo(0)
            make.height.equalTo(40)
        }
        bottomView.isUserInteractionEnabled = true
        
        //返回按钮
        let backImg = UIImageView()
        view.addSubview(backImg)
        backImg.image = UIImage(named: "back")
        bottomView.addSubview(backImg)
        backImg.snp.makeConstraints { (make) in
            make.left.equalTo(10)
            make.centerY.equalTo(bottomView.snp.centerY)
            make.width.equalTo(20)
            make.height.equalTo(20)
        }
        backImg.isUserInteractionEnabled = true
        let backTap = UITapGestureRecognizer()
        backTap.addTarget(self, action: #selector(skipIncident))
        backImg.addGestureRecognizer(backTap)
        
        titleLabel = UILabel()
        titleLabel.text = "全香港"
        titleLabel.textColor = UIColor.white
        titleLabel.font = UIFont(name: "HelveticaNeue-Medium", size: 16)
        titleView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(titleView.snp.centerX)
            make.top.equalTo(38)
        }
        
        let letfImg = UIImageView()
        letfImg.image = UIImage(named: "menu")
        titleView.addSubview(letfImg)
        letfImg.snp.makeConstraints { (make) in
            make.left.equalTo(10)
            make.centerY.equalTo(titleLabel.snp.centerY)
            make.width.equalTo(22)
            make.height.equalTo(22)
        }
        //MARK:- 添加左侧手势事件
        letfImg.isUserInteractionEnabled = true
        let populationTap = UITapGestureRecognizer(target: self, action: #selector(leftIncident))
        letfImg.addGestureRecognizer(populationTap)
        
        let rightImg = UIImageView()
        rightImg.image = UIImage(named: "sort")
        titleView.addSubview(rightImg)
        rightImg.snp.makeConstraints { (make) in
            make.right.equalTo(-10)
            make.width.equalTo(22)
            make.height.equalTo(22)
            make.centerY.equalTo(titleLabel.snp.centerY)
        }
        
        //MARK:- 添加筛选功能
        rightImg.isUserInteractionEnabled = true
        let filterTap = UITapGestureRecognizer(target : self, action: #selector(filterIncident))
        rightImg.addGestureRecognizer(filterTap)
        
        let leftView = UIView()
        view.addSubview(leftView)
        leftView.layer.borderWidth = 1
        leftView.layer.borderColor = UIColor.init(r: 239, g: 239, b: 239).cgColor
        leftView.snp.makeConstraints { (make) in
            make.left.equalTo(0)
            make.top.equalTo(titleView.snp.bottom)
            make.width.equalTo(kScreenWidth/2)
            make.height.equalTo(36)
        }
        let leftTap = UITapGestureRecognizer(target: self, action: #selector(peopleIncident))
        leftView.addGestureRecognizer(leftTap)
        
        
        leftLabel = UILabel()
        view.addSubview(leftLabel)
        leftLabel.text = "人口"
        leftLabel.textColor = UIColor.black
        leftLabel.font = UIFont(name: "PingFangSC-Regular", size: 15)
        leftLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(leftView.snp.centerX)
            make.centerY.equalTo(leftView.snp.centerY)
        }
        
        leftIcon = UIImageView()
        view.addSubview(leftIcon)
        leftIcon.image = UIImage(named: "people")
        leftIcon.snp.makeConstraints { (make) in
            make.right.equalTo(leftLabel.snp.left).offset(-5)
            make.width.equalTo(16)
            make.height.equalTo(16)
            make.centerY.equalTo(leftLabel.snp.centerY)
        }
        
        arrowImg  = UIImageView()
        view.addSubview(arrowImg)
        arrowImg.image = UIImage(named: "under")
        arrowImg.snp.makeConstraints { (make) in
            make.left.equalTo(leftLabel.snp.right).offset(5)
            make.width.equalTo(16)
            make.height.equalTo(16)
            make.centerY.equalTo(leftLabel.snp.centerY)
        }
        
        //居港人口
        let rightView = UIView()
        view.addSubview(rightView)
        rightView.layer.borderWidth = 1
        rightView.layer.borderColor = UIColor.init(r: 239, g: 239, b: 239).cgColor
        rightView.snp.makeConstraints { (make) in
            make.right.equalTo(0)
            make.top.equalTo(titleView.snp.bottom)
            make.width.equalTo(kScreenWidth/2)
            make.height.equalTo(36)
        }
        
        let secondTap = UITapGestureRecognizer.init(target: self, action: #selector(scondIncident))
        rightView.addGestureRecognizer(secondTap)
        
        rightLabel = UILabel()
        view.addSubview(rightLabel)
        rightLabel.textColor = UIColor.black
        rightLabel.textAlignment = .center
        rightLabel.text = "居港人口"
        rightLabel.font = UIFont(name: "PingFangSC-Regular", size: 15)
        rightLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(rightView.snp.centerY)
            make.right.equalTo(-60)
            make.width.equalTo(100)
        }
        
        rightArrow = UIImageView()
        rightArrow.image = UIImage(named: "under")
        view.addSubview(rightArrow)
        rightArrow.snp.makeConstraints { (make) in
            make.left.equalTo(rightLabel.snp.right).offset(5)
            make.width.equalTo(16)
            make.height.equalTo(16)
            make.centerY.equalTo(rightLabel.snp.centerY)
        }
        
        view.addSubview(collectionView)
        view.addSubview(bottomTableView)
    }
    
    //MARK:- 网络请求
    func loadData(){
        dataViewModel.resquestData{
            self.peopleTableView.reloadData()
            secondGroup = self.dataViewModel.firstArr[0].secondGroup
            var tabID_Arr = [NewModel]()
            var count = 0
            for firstModel in self.dataViewModel.firstArr {
                let model1 = NewModel()
                model1.id = firstModel.tabId
                model1.title = firstModel.TabName
                model1.type = 1
                model1.imageStr = self.imageArr[count]
                count += 1
                tabID_Arr.append(model1)
                for secondModel in firstModel.secondGroup {
                    let model2 = NewModel()
                    model2.id = secondModel.GroupId
                    model2.title = secondModel.Title
                    model2.type = 2
                    tabID_Arr.append(model2)
                    for thirdModel in secondModel.threeGroup {
                        let model3 = NewModel()
                        model3.id = thirdModel.Id
                        model3.title = thirdModel.ParamName
                        model3.type = 3
                        tabID_Arr.append(model3)
                    }
                }
            }
            newModelArr = tabID_Arr
        }
        bottomData.resquestData {
            self.bottomTableView.reloadData()
        }
    }
}

//MARK:- 手势相应
extension BestVC{
    //返回事件
    @objc func skipIncident(){
        self.dismiss(animated: true, completion: nil)
    }
    
    //右边手势
    @objc func filterIncident(){
        view.addSubview(coverView)
        view.addSubview(triangleImg)
        view.addSubview(downTableView)
    }
    
    //取消手势
    @objc func cancelIncident(){
        coverView.removeFromSuperview()
        downTableView.removeFromSuperview()
        UIView.animate(withDuration: nstime) {
            self.leftTableView.transform = CGAffineTransform(translationX: -255, y: 0)
        }
        leftTableView.removeFromSuperview()
    }
    
    //左边手势
    @objc func leftIncident(){
        view.addSubview(coverView)
        view.addSubview(leftTableView)
        UIView.animate(withDuration: nstime) {
            self.leftTableView.transform = CGAffineTransform(translationX: 255, y: 0)
        }
    }
    
    @objc func peopleIncident(){
        view.addSubview(peopleTableView)
        UIView.animate(withDuration: 0.3) {
            arrowImg.transform = CGAffineTransform(rotationAngle: CGFloat.pi).concatenating(arrowImg.transform).inverted()
        }
        secondTableView.removeFromSuperview()
    }
    
    @objc func scondIncident(){
        view.addSubview(secondTableView)
        UIView.animate(withDuration: 0.3) {
            rightArrow.transform = CGAffineTransform(rotationAngle: CGFloat.pi).concatenating(rightArrow.transform).inverted()
        }
        peopleTableView.removeFromSuperview()
    }
}

extension BestVC : UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (tableView == downTableView){
            return listNumber
        }else if (tableView == secondTableView){
            return secondGroup.count
        }else if (tableView == bottomTableView){
            return bottomData.areaArr.count
        }else if (tableView == leftTableView || tableView == peopleTableView){
            return newModelArr.count
        }else {
            print(nextModel.areaArr.count + 1)
            return nextModel.areaArr.count + 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (tableView == downTableView){
            let cell = tableView.dequeueReusableCell(withIdentifier: downCell, for: indexPath)as! CensusCell
            cell.contenLabel.text = strArr[indexPath.row]
            return cell
        }else if (tableView == leftTableView){
            let newModel = newModelArr[indexPath.row]
            if newModel.type == 1 {
                let cell = tableView.dequeueReusableCell(withIdentifier: peopleCell, for: indexPath)as! PeopleCell
                cell.model = newModel
                cell.leftImg.image = UIImage(named: newModel.imageStr)
                return cell
            }else if newModel.type == 2 {
                let cell = tableView.dequeueReusableCell(withIdentifier: liveCell, for: indexPath)as! LiveCell
                cell.model = newModel
                return cell
            }else if newModel.type == 3 {
                let cell = tableView.dequeueReusableCell(withIdentifier: totalCell, for: indexPath)as! TotalCell
                cell.model = newModel
                return cell
            }else {
                let cell = tableView.dequeueReusableCell(withIdentifier: totalCell, for: indexPath)as! TotalCell
                return cell
            }
        }else if(tableView == peopleTableView){
            let cell = tableView.dequeueReusableCell(withIdentifier: leftDropCell, for: indexPath)as! LeftDropCell
            cell.leftImg.image = UIImage(named: imageArr[indexPath.row])
            cell.model = dataViewModel.firstArr[indexPath.row]
            return cell
        }else if(tableView == secondTableView){
            let cell = tableView.dequeueReusableCell(withIdentifier: rightDropCell, for: indexPath)as! RightDropCell
            cell.model = dataViewModel.firstArr[monitor].secondGroup[indexPath.row]
            return cell
        }else if tableView == bottomTableView{
            let cell = tableView.dequeueReusableCell(withIdentifier: bottomCell, for: indexPath)as! BottomCell
            cell.model = bottomData.areaArr[indexPath.row]
            //左边手势
            let nextTap = TapGestureRecognizerExtention(target: self, action: #selector(levelIncident(tap:)))
            nextTap.parameterOne = cell.typeStr
            nextTap.parameterTwo = cell.codeStr
            cell.leftView.addGestureRecognizer(nextTap)
            return cell
        }else{
            if indexPath.row == 0{
                let cell = tableView.dequeueReusableCell(withIdentifier: backCell, for: indexPath)as! BackCell
                return cell
            }
            let cell = tableView.dequeueReusableCell(withIdentifier: bottomCell, for: indexPath)as! BottomCell
            print(indexPath.row)
            cell.model = nextModel.areaArr[indexPath.row]
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == peopleTableView {
            leftLabel.text = self.dataViewModel.firstArr[indexPath.row].TabName
            leftIcon.image = UIImage(named: imageArr[indexPath.row])
            UIView.animate(withDuration: 0.3) {
                arrowImg.transform = CGAffineTransform(rotationAngle: CGFloat.pi).concatenating(arrowImg.transform).inverted()
            }
            peopleTableView.removeFromSuperview()
            monitor = indexPath.row
            secondGroup = self.dataViewModel.firstArr[monitor].secondGroup
            view.addSubview(secondTableView)
            secondTableView.reloadData()
        }else if tableView == secondTableView{
            rightLabel.text = dataViewModel.firstArr[monitor].secondGroup[indexPath.row].Title
            UIView.animate(withDuration: 0.3) {
                rightArrow.transform = CGAffineTransform(rotationAngle: CGFloat.pi).concatenating(rightArrow.transform).inverted()
            }
            vector = indexPath.row
            collectionView.reloadData()
            secondTableView.removeFromSuperview()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        self.secondTableView.frame = CGRect(x: self.secondTableView.x, y: self.secondTableView.y, width: self.secondTableView.width, height: 500)
        if tableView == secondTableView {
            let cell = dataViewModel.firstArr[monitor].secondGroup[indexPath.row]
            let labelHeight = StrTools.getTextHeigh(textStr: cell.Title, font: UIFont.systemFont(ofSize: 14), width: kScreenWidth/2)
            let cellHeight = labelHeight + 20
            cell.labelModel = CGRect(x: 0, y: 10, width: kScreenWidth/2, height: labelHeight)
            cell.splitModel = CGRect(x: 0, y: labelHeight + 19, width: kScreenWidth/2, height: 1)
            totalHeight += cellHeight
            if indexPath.row == secondGroup.count - 1{
                flag += 1
                if flag == 3{
                    totalHeight = totalHeight / 3
                    self.secondTableView.frame = CGRect(x: self.secondTableView.x, y: self.secondTableView.y, width: self.secondTableView.width, height: totalHeight)
                    flag = 0
                    totalHeight = 0
                }
            }
            return cellHeight
        }else if tableView == leftTableView {
            let newModel = newModelArr[indexPath.row]
            if newModel.type == 1{
                return 30
            }else if newModel.type == 2{
                return (StrTools.getTextHeigh(textStr: newModel.title, font: UIFont.systemFont(ofSize: 13), width: leftTableView.frame.size.width - 12) + 10)
            }else{
                return (StrTools.getTextHeigh(textStr: newModel.title, font: UIFont.systemFont(ofSize: 13), width: leftTableView.frame.size.width - 18) + 11)
            }
        }else if tableView == downTableView{
            return 44
        }else if tableView == peopleTableView{
            return 39
        }else if tableView == bottomTableView || tableView == levelTableView{
            return 40
        }
        return 100
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = UIView()
        if tableView == bottomTableView || tableView == levelTableView{
            let headView = tableView.dequeueReusableHeaderFooterView(withIdentifier: headCell) as!HeadView
            if self.bottomData.pathArr.count > 0 {
                headView.model = self.bottomData.pathArr[0]
            }
            return headView
        }
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if tableView == bottomTableView || tableView == levelTableView{
            return 36
        }
        return 0
    }
}

extension BestVC : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if dataViewModel.firstArr.count == 0 {
            return 2
        }
        return dataViewModel.firstArr[monitor].secondGroup[vector].threeGroup.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: collectionCell, for: indexPath)as! CollectionViewCell
        if dataViewModel.firstArr.count == 0 {
            if indexPath.row == 0 {
                cell.titleLabel.textColor = UIColor.init(r: 132, g: 43, b: 28)
            }else{
                cell.titleLabel.textColor = UIColor.lightGray
            }
            cell.titleLabel.text = placeholderArr[indexPath.row]
            return cell
        }
        if indexPath.row == 0 {
            cell.titleLabel.textColor = UIColor.init(r: 132, g: 43, b: 28)
        }else{
            cell.titleLabel.textColor = UIColor.lightGray
        }
        cell.model = dataViewModel.firstArr[monitor].secondGroup[vector].threeGroup[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if dataViewModel.firstArr.count == 0 {
            let strWidth = StrTools.getTextWidth(textStr: placeholderArr[indexPath.row], font: UIFont.systemFont(ofSize: 14), height: 20)
            return CGSize(width: strWidth, height: 20)
        }
        let strWidth  = StrTools.getTextWidth(textStr: dataViewModel.firstArr[monitor].secondGroup[vector].threeGroup[indexPath.row].ParamName, font: UIFont.systemFont(ofSize: 14), height: 20)
        return CGSize(width: strWidth, height: 20)
    }
}

extension BestVC{
    @objc func levelIncident(tap:TapGestureRecognizerExtention){
        nextModel.resquestData(typeStr: tap.parameterOne, codeStr: tap.parameterTwo) {
            self.bottomTableView.isHidden = true
            self.view.addSubview(self.levelTableView)
        }
    }
    
    @objc func rightIncident(){
          print("请求数据")
    }
}


