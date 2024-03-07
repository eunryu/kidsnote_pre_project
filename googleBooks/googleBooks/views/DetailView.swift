//
//  DetailView.swift
//  googleBooks
//
//  Created by 김현지 on 3/5/24.
//

import UIKit

class DetailView: BaseView, UITableViewDelegate, UITableViewDataSource {
    
    var naviBar: UIView!
    var naviLabel: UILabel!
    var backBtn: UIButton!
    
    var contentV: UITableView!
    var bookInfo: GoogleBookInfo = GoogleBookInfo()
    
    override func initView() {
        super.initView()
        
        naviBar = UIView(frame: CGRect(x: 0, y: 0, width: mainWidth, height: 60))
        naviBar.translatesAutoresizingMaskIntoConstraints = false
        self.mainV.addSubview(naviBar)
        
        naviLabel = MakeUILabelKit.shared.makeLabel("도서정보", size: CGSize(width: 100, height: 30), addView: naviBar)
        MakeUILabelKit.shared.textDecoration(naviLabel, fontSize: 16, fontName: nil, color: .blk333, alignment: .center)
        
        backBtn = MakeUIButtonKit.shared.makeButton(nImage: UIImage(resource: .iconBack), pImage: UIImage(resource: .iconBack), size: CGSize(width: 26, height: 26), addView: naviBar)
        
        // content
        contentV = MakeUITableViewKit.shared.makeTableView(size: CGSize(width: mainWidth, height: mainHeight), addView:self.mainV)
        contentV.register(DetailBookInfoCell.self, forCellReuseIdentifier: "DetailBookInfoCell")
        contentV.register(DetailBtnsCell.self, forCellReuseIdentifier: "DetailBtnsCell")
        contentV.register(DetailBookContentCell.self, forCellReuseIdentifier: "DetailBookContentCell")
        contentV.register(DetailStarInfoCell.self, forCellReuseIdentifier: "DetailStarInfoCell")
        contentV.register(DetailCreatorInfoCell.self, forCellReuseIdentifier: "DetailCreatorInfoCell")
        contentV.separatorStyle = .none
        contentV.showsVerticalScrollIndicator = false
        
        contentV.delegate = self
        contentV.dataSource = self
        
        safeKit.basicLayout(left: 0, right: 0, targetView: naviBar, baseView: self.mainV)
        safeKit.singleLayout(type: .top, value: 0, targetView: naviBar, baseView: self.mainV)
        autoKit.EqualHeight(naviBar, Height: 60)
        
        safeKit.basicLayout(left: 0, right: 0, targetView: contentV, baseView: self.mainV)
        safeKit.singleLayout(type: .bottom, value: 0, targetView: contentV, baseView: self.mainV)
        autoKit.setViewTerm(0, topView: naviBar, bottomView: contentV, mainView: self.mainV)
        
        autoKit.setCenterLayout(true, Y: true, TargetView: naviLabel, MainView: naviBar)
        autoKit.setEqualWidthAndHeight(100, height: 30, targetView: naviLabel)
        
        autoKit.CenterY(backBtn, terms: 0, MainView: naviBar)
        autoKit.Leading(backBtn, MainView: naviBar, LeadingSize: 16)
        autoKit.setEqualWidthAndHeight(26, height: 26, targetView: backBtn)
        
        // action
        backBtn.addTarget(self, action: #selector(backAction(sender: )), for: .touchUpInside)
    }
    
    override func initModel() {
        super.initModel()
    }
    
    override func firstAction() {
        super.firstAction()
    }
    
    override func viewReloadAction() {
        super.viewReloadAction()
    }
    
    /** Back Action */
    @objc func backAction(sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    /** UITableView */
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell: DetailBookInfoCell = tableView.dequeueReusableCell(withIdentifier: "DetailBookInfoCell") as! DetailBookInfoCell
            cell.initData(data: bookInfo)
            cell.selectionStyle = .none
            return cell
        } else if indexPath.row == 1 {
            let cell: DetailBtnsCell = tableView.dequeueReusableCell(withIdentifier: "DetailBtnsCell") as! DetailBtnsCell
            cell.selectionStyle = .none
            return cell
        } else if indexPath.row == 2 {
            let cell: DetailBookContentCell = tableView.dequeueReusableCell(withIdentifier: "DetailBookContentCell") as! DetailBookContentCell
            cell.initData(content: bookInfo.shortDescription)
            cell.selectionStyle = .none
            return cell
        } else if indexPath.row == 3 {
            let cell: DetailStarInfoCell = tableView.dequeueReusableCell(withIdentifier: "DetailStarInfoCell") as! DetailStarInfoCell
            cell.selectionStyle = .none
            return cell
        }
        
        let cell: DetailCreatorInfoCell = tableView.dequeueReusableCell(withIdentifier: "DetailCreatorInfoCell") as! DetailCreatorInfoCell
        cell.initData(bookInfo: bookInfo)
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
