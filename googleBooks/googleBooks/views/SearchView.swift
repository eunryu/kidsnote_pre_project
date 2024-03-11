//
//  SearchView.swift
//  googleBooks
//
//  Created by 은냥 on 3/2/24.
//

import UIKit
import RxSwift

/// 디테일 뷰
class SearchView: BaseView, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    
    var searchNaviV: UIView!
    var backBtn: UIButton!
    var searchField: UITextField!
    var searchBtn: UIButton!
    
    var tabMenuV: UIStackView!
    var tabMenuBorderV: UIView!
    var contentV: UITableView!
    
    var ebookBtn: TabMenuButton!
    var audioBookBtn: TabMenuButton!
    
    var searchMenuType: TabType = .ebook
    var listData: [GoogleBookInfo] = []
    var audioBookData: [GoogleBookInfo] = []
    
    var googleBookVM = GoogleBookViewModel()
    var bag = DisposeBag()
    
    var isFirstLoad: Bool = true
    var searchMsg: String = ""
    
    override func initView() {
        super.initView()
        
        searchNaviV = UIView(frame: CGRect(x: 0, y: 0, width: mainWidth, height: 60))
        searchNaviV.translatesAutoresizingMaskIntoConstraints = false
        self.mainV.addSubview(searchNaviV)
        
        // navi
        backBtn = MakeUIButtonKit.shared.makeButton(nImage: UIImage(resource: .iconBack), pImage: UIImage(resource: .iconBack), size: CGSize(width: 24, height: 24), addView: searchNaviV)
        
        searchBtn = MakeUIButtonKit.shared.makeButton(nImage: UIImage(resource: .btnSearch), pImage: UIImage(resource: .iconBack), size: CGSize(width: 24, height: 24), addView: searchNaviV)
        
        searchField = MakeUITextFieldKit.shared.makeTextField(placeholder: "검색어를 입력하세요", size: CGSize(width: mainWidth, height: 40), addView: searchNaviV)
        searchField.delegate = self
        searchField.returnKeyType = .search
        
        let borderV = MakeUIViewKit.shared.makeBorderView(borderWidth: mainWidth, borderColor: UIColor.lightGray, addView: searchNaviV)
        
        tabMenuV = UIStackView(frame: CGRect(x: 0, y: 0, width: mainWidth, height: 60))
        tabMenuV.translatesAutoresizingMaskIntoConstraints = false
        tabMenuV.axis = .horizontal
        tabMenuV.distribution = .fillEqually
        self.mainV.addSubview(tabMenuV)
        
        // menuBtn
        ebookBtn = TabMenuButton(frame: CGRect(x: 0, y: 0, width: mainWidth / 2, height: 60))
        audioBookBtn = TabMenuButton(frame: CGRect(x: 0, y: 0, width: mainWidth / 2, height: 60))
        
        ebookBtn.setTitle(title: "search_tab_title_ebook".localized)
        audioBookBtn.setTitle(title: "search_tab_title_audiobook".localized)
        ebookBtn.changeBtnWithState(state: true)
        audioBookBtn.changeBtnWithState(state: false)
        
        tabMenuV.addArrangedSubview(ebookBtn)
        tabMenuV.addArrangedSubview(audioBookBtn)
        
        tabMenuBorderV = MakeUIViewKit.shared.makeBorderView(borderWidth: mainWidth, borderColor: UIColor.lightGray, addView: self.mainV)
        
        contentV = MakeUITableViewKit.shared.makeTableView(size: CGSize(width: mainWidth, height: 300), addView: self.mainV)
        contentV.register(SearchListCell.self, forCellReuseIdentifier: "SearchListCell")
        contentV.register(CmmBlankCell.self, forCellReuseIdentifier: "CmmBlankCell")
        contentV.showsVerticalScrollIndicator = false
        contentV.bounces = false
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
        
        autoKit.CenterY(backBtn, terms: 0, MainView: searchNaviV)
        autoKit.Leading(backBtn, MainView: searchNaviV, LeadingSize: 16)
        autoKit.setEqualWidthAndHeight(24, height: 24, targetView: backBtn)
        
        autoKit.CenterY(searchBtn, terms: 0, MainView: searchNaviV)
        autoKit.Trailing(searchBtn, MainView: searchNaviV, TrailingSize: 16)
        autoKit.setEqualWidthAndHeight(24, height: 24, targetView: searchBtn)
        
        autoKit.setViewTerm(10, leftView: backBtn, rightView: searchField, mainView: searchNaviV)
        autoKit.setViewTerm(5, leftView: searchField, rightView: searchBtn, mainView: searchNaviV)
        autoKit.CenterY(searchField, MainView: searchNaviV)
        autoKit.EqualHeight(searchField, Height: 40)
        
        searchBtn.addTarget(self, action: #selector(searchBtnAction(sender: )), for: .touchUpInside)
        NotificationCenter.default.addObserver(self, selector: #selector(textDidChange(_:)), name: UITextView.textDidChangeNotification, object: searchField)
        
        ebookBtn.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tabAction(sender: ))))
        audioBookBtn.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tabAction(sender: ))))
        ebookBtn.isUserInteractionEnabled = true
        audioBookBtn.isUserInteractionEnabled = true
        
        ebookBtn.tag = 100
        audioBookBtn.tag = 101
    }
    
    override func initModel() {
        super.initModel()
        
        googleBookVM = GoogleBookViewModel()
        googleBookVM.listReload.subscribe { itemArrayEle in
            if let itemArray = itemArrayEle.element {
                self.listData = itemArray
            }
            
            self.isFirstLoad = false
            self.contentV.reloadData()
        }.disposed(by: bag)
    }
    
    override func firstAction() {
        super.firstAction()
    }
    
    override func viewReloadAction() {
        super.viewReloadAction()
    }
    
    @objc func tabAction(sender: UITapGestureRecognizer) {
        if let view = sender.view {
            let tagNum = view.tag
            
            if tagNum == 100 {
                if searchMenuType != .ebook {
                    searchMenuType = .ebook
                    
                    ebookBtn.changeBtnWithState(state: true)
                    audioBookBtn.changeBtnWithState(state: false)
                    
                    self.contentV.reloadData()
                }
            } else if tagNum == 101 {
                if searchMenuType != .audioBook {
                    searchMenuType = .audioBook
                    
                    ebookBtn.changeBtnWithState(state: false)
                    audioBookBtn.changeBtnWithState(state: true)
                    
                    self.contentV.reloadData()
                }
            }
        }
    }
    
    /** TextDelegate */
    @objc private func textDidChange(_ notification: Notification) {
        if let textField = notification.object as? UITextField {
            if let txt = textField.text {
                self.searchMsg = txt
            }
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let txt = textField.text {
            // 검색
            self.searchMsg = txt
        }
        
        self.searchAction()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
    /** navi Btn Action */
    @objc func searchBtnAction(sender: UIButton) {
        self.view.endEditing(true)
    }
    
    func searchAction() {
        if "".elementsEqual(searchMsg) {
            // 팝업
            let popInfo = PopInfo(type: .msg, title: "알림", msg: "검색어를 입력해주세요", okBtn: PopBtnInfo(title: "확인", action: {
                self.searchField.becomeFirstResponder()
            }))
            self.showPopup(info: popInfo)
        } else {
            googleBookVM.searhcGoogleBook(searchMsg: searchMsg)
        }
    }
    
    /** UITableView */
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchMenuType == .ebook {
            if listData.count == 0 {
                return 1
            }
            
            return listData.count
        }
        
        if audioBookData.count == 0 {
            return 1
        }
        
        return audioBookData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if searchMenuType == .ebook {
            if listData.count == 0 {
                let cell: CmmBlankCell = tableView.dequeueReusableCell(withIdentifier: "CmmBlankCell") as! CmmBlankCell
                cell.selectionStyle = .none
                
                var type: BlankType = .dataBlank
                if isFirstLoad {
                    type = .notLoad
                }
                cell.setBlankInfo(type: type)
                
                return cell
            }
            
            let cell: SearchListCell = tableView.dequeueReusableCell(withIdentifier: "SearchListCell") as! SearchListCell
            cell.initData(item: self.listData[indexPath.row])
            cell.selectionStyle = .none
            return cell
        }
        
        if audioBookData.count == 0 {
            let cell: CmmBlankCell = tableView.dequeueReusableCell(withIdentifier: "CmmBlankCell") as! CmmBlankCell
            cell.selectionStyle = .none
            
            var type: BlankType = .dataBlank
            if isFirstLoad {
                type = .notLoad
            }
            cell.setBlankInfo(type: type)
            
            return cell
        }
        
        let cell: SearchListCell = tableView.dequeueReusableCell(withIdentifier: "SearchListCell") as! SearchListCell
        cell.initData(item: self.audioBookData[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if listData.count == 0 {
            return 250
        }
        
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if listData.count > 0 {
            let mainST = UIStoryboard(name: "Main", bundle: nil)
            let detailV = mainST.instantiateViewController(identifier: "DetailView") as! DetailView
            detailV.bookInfo = listData[indexPath.row]
            self.navigationController?.pushViewController(detailV, animated: true)
        }
    }
}

