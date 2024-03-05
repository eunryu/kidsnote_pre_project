//
//  SearchView.swift
//  googleBooks
//
//  Created by 은냥 on 3/2/24.
//

import UIKit

/// 디테일 뷰
class SearchView: BaseView, UITableViewDelegate, UITableViewDataSource {
    
    var searchNaviV: UIView!
    var tabMenuV: UIStackView!
    var tabMenuBorderV: UIView!
    var contentV: UITableView!
    
    var searchMenuType: TabType = .ebook
    
    override func initView() {
        super.initView()
        
        searchNaviV = UIView(frame: CGRect(x: 0, y: 0, width: mainWidth, height: 60))
        searchNaviV.translatesAutoresizingMaskIntoConstraints = false
        self.mainV.addSubview(searchNaviV)
        
        let borderV = MakeUIViewKit.shared.makeBorderView(borderWidth: mainWidth, borderColor: UIColor.lightGray, addView: searchNaviV)
        
        tabMenuV = UIStackView(frame: CGRect(x: 0, y: 0, width: mainWidth, height: 60))
        tabMenuV.translatesAutoresizingMaskIntoConstraints = false
        tabMenuV.axis = .horizontal
        tabMenuV.distribution = .fillEqually
        self.mainV.addSubview(tabMenuV)
        
        // menuBtn
        let ebookBtn = TabMenuButton(frame: CGRect(x: 0, y: 0, width: mainWidth / 2, height: 60))
        let audioBookBtn = TabMenuButton(frame: CGRect(x: 0, y: 0, width: mainWidth / 2, height: 60))
        
        ebookBtn.setTitle(title: "search_tab_title_audiobook".localized)
        audioBookBtn.setTitle(title: "search_tab_title_ebook".localized)
        ebookBtn.changeBtnWithState(state: true)
        audioBookBtn.changeBtnWithState(state: false)
        
        tabMenuV.addArrangedSubview(ebookBtn)
        tabMenuV.addArrangedSubview(audioBookBtn)
        
        tabMenuBorderV = MakeUIViewKit.shared.makeBorderView(borderWidth: mainWidth, borderColor: UIColor.lightGray, addView: self.mainV)
        
        contentV = MakeUITableViewKit.shared.makeTableView(size: CGSize(width: mainWidth, height: 300), addView: self.mainV)
        contentV.register(SearchListCell.self, forCellReuseIdentifier: "SearchListCell")
        contentV.delegate = self
        contentV.dataSource = self
        
        // SafeLayout And AutoLayout
        safeKit.basicLayout(left: 0, right: 0, targetView: searchNaviV, baseView: self.mainV)
        safeKit.singleLayout(type: .top, value: 0, targetView: searchNaviV, baseView: self.mainV)
        autoKit.EqualHeight(searchNaviV, Height: 60)
        
        safeKit.basicLayout(left: 0, right: 0, targetView: tabMenuV, baseView: self.mainV)
        autoKit.EqualHeight(tabMenuV, Height: 60)
        autoKit.setViewTerm(0, topView: searchNaviV, bottomView: tabMenuV, mainView: self.mainV)
        
        autoKit.setAutoLayout(0, Trailing: 0, Top: nil, Bottom: 0, Width: nil, Height: 1, TargetView: borderV, MainView: searchNaviV)
        
        safeKit.basicLayout(left: 0, right: 0, targetView: tabMenuBorderV, baseView: self.mainV)
        autoKit.EqualHeight(tabMenuBorderV, Height: 1)
        autoKit.setViewTerm(0, topView: tabMenuV, bottomView: tabMenuBorderV, mainView: self.mainV)
        
        safeKit.basicLayout(left: 0, right: 0, targetView: contentV, baseView: self.mainV)
        safeKit.singleLayout(type: .bottom, value: 0, targetView: contentV, baseView: self.mainV)
        autoKit.setViewTerm(0, topView: tabMenuBorderV, bottomView: contentV, mainView: self.mainV)
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
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: SearchListCell = tableView.dequeueReusableCell(withIdentifier: "SearchListCell") as! SearchListCell
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

