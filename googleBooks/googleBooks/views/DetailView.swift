//
//  DetailView.swift
//  googleBooks
//
//  Created by 김현지 on 3/5/24.
//

import UIKit

class DetailView: BaseView, UITableViewDelegate, UITableViewDataSource {
    
    var contentV: UITableView!
    
    override func initView() {
        super.initView()
        
        contentV = MakeUITableViewKit.shared.makeTableView(size: CGSize(width: mainWidth, height: mainHeight), addView:self.mainV)
        contentV.register(DetailBookInfoCell.self, forCellReuseIdentifier: "DetailBookInfoCell")
        contentV.register(DetailBtnsCell.self, forCellReuseIdentifier: "DetailBtnsCell")
        contentV.register(DetailBookContentCell.self, forCellReuseIdentifier: "DetailBookContentCell")
        contentV.register(DetailStarInfoCell.self, forCellReuseIdentifier: "DetailStarInfoCell")
        contentV.register(DetailCreatorInfoCell.self, forCellReuseIdentifier: "DetailCreatorInfoCell")
        contentV.separatorStyle = .none
        
        contentV.delegate = self
        contentV.dataSource = self
        
        autoKit.setAutoLayout(0, Trailing: 0, Top: 0, Bottom: 0, Width: nil, Height: nil, TargetView: contentV, MainView: self.mainV)
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
    
    /** UITableView */
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell: DetailBookInfoCell = tableView.dequeueReusableCell(withIdentifier: "DetailBookInfoCell") as! DetailBookInfoCell
            cell.selectionStyle = .none
            return cell
        } else if indexPath.row == 1 {
            let cell: DetailBtnsCell = tableView.dequeueReusableCell(withIdentifier: "DetailBtnsCell") as! DetailBtnsCell
            cell.selectionStyle = .none
            return cell
        } else if indexPath.row == 2 {
            let cell: DetailBookContentCell = tableView.dequeueReusableCell(withIdentifier: "DetailBookContentCell") as! DetailBookContentCell
            cell.selectionStyle = .none
            return cell
        } else if indexPath.row == 3{
            let cell: DetailStarInfoCell = tableView.dequeueReusableCell(withIdentifier: "DetailStarInfoCell") as! DetailStarInfoCell
            cell.selectionStyle = .none
            return cell
        }
        
        let cell: DetailCreatorInfoCell = tableView.dequeueReusableCell(withIdentifier: "DetailCreatorInfoCell") as! DetailCreatorInfoCell
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
