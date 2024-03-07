//
//  DetailBtnsCell.swift
//  googleBooks
//
//  Created by 김현지 on 3/5/24.
//

import UIKit

class DetailBtnsCell: BaseTableViewCell {
    
    var btnsMainBox: UIStackView!
    var readSampleBtn: UIView!
    var readWishBtn: UIView!
    
    var infoImgV: UIImageView!
    var infoMsgLabel: UILabel!
    
    var freeSampleBtn: TabMenuButton!
    var buyBookBtn: TabMenuButton!
    
    var detailV: DetailView!
    
    override func initView() {
        super.initView()
        
        btnsMainBox = UIStackView(frame: CGRect(x: 0, y: 0, width: 0, height: 40))
        btnsMainBox.translatesAutoresizingMaskIntoConstraints = false
        btnsMainBox.axis = .horizontal
        btnsMainBox.distribution = .fillEqually
        btnsMainBox.spacing = 10
        self.addSubview(btnsMainBox)
        
        infoImgV = MakeUIImageViewKit.shared.makeImageView(image: UIImage(resource: .iconInfo), size: CGSize(width: 12, height: 12), addView: self)
        infoMsgLabel = MakeUILabelKit.shared.makeLabel("Google Play 웹사이트에서 구매한 책을 이 앱에서 읽을 수 있습니다.", size: CGSize(width: 0, height: 0), addView: self)
        MakeUILabelKit.shared.textDecoration(infoMsgLabel, fontSize: 12, fontName: nil, color: .blk666, alignment: .left)
        infoMsgLabel.numberOfLines = 0
        
        autoKit.setAutoLayout(16, Trailing: 16, Top: 13, Bottom: nil, Width: nil, Height: 40, TargetView: btnsMainBox, MainView: self)
        autoKit.setAutoLayout(16, Trailing: nil, Top: nil, Bottom: nil, Width: 20, Height: 20, TargetView: infoImgV, MainView: self)
        autoKit.equalViewTop(targetView: infoImgV, standardView: infoMsgLabel, mainView: self)
        
        autoKit.setViewTerm(10, leftView: infoImgV, rightView: infoMsgLabel, mainView: self)
        autoKit.setAutoLayout(nil, Trailing: 16, Top: nil, Bottom: 20, Width: nil, Height: nil, TargetView: infoMsgLabel, MainView: self)
        autoKit.setHeightNotEqualSize(targetView: infoMsgLabel, standardSize: 20, isBig: true)
        autoKit.setViewTerm(30, topView: btnsMainBox, bottomView: infoMsgLabel, mainView: self)
        
        let bottomBorder = MakeUIViewKit.shared.makeBorderView(borderWidth: 100, borderColor: .borderGray, addView: self)
        autoKit.setAutoLayout(0, Trailing: 0, Top: nil, Bottom: 0, Width: nil, Height: 1, TargetView: bottomBorder, MainView: self)
        
        // 버튼 추가
//        let freeSampleBtnInfo = CustomButtonInfo(type: .onlyTitle, title: "무료 샘플")
//        freeSampleBtn = CustomButton(frame: CGRect(x: 0, y: 0, width: btnsMainBox.frame.width / 2, height: 60))
//        freeSampleBtn.setCustomButton(info: freeSampleBtnInfo)
//        freeSampleBtn.setBtnDeco(bgColor: .cmmBlue, txtColor: .blk333, useBorder: false)
//        btnsMainBox.addArrangedSubview(freeSampleBtn)
//        
//        let buyBookBtnInfo = CustomButtonInfo(type: .onlyTitle, title: "전체 도서 구매하기")
//        buyBookBtn = CustomButton(frame: CGRect(x: 0, y: 0, width: btnsMainBox.frame.width / 2, height: 60))
//        buyBookBtn.setCustomButton(info: buyBookBtnInfo)
//        buyBookBtn.setBtnDeco(bgColor: .white, txtColor: .cmmBlue, useBorder: true)
//        btnsMainBox.addArrangedSubview(buyBookBtn)
        
    }
    
    func actionMapping(view: DetailView) {
        self.detailV = view
        
        freeSampleBtn = TabMenuButton(frame: CGRect(x: 0, y: 0, width: self.detailV.mainWidth / 2, height: 60))
        buyBookBtn = TabMenuButton(frame: CGRect(x: 0, y: 0, width: self.detailV.mainWidth / 2, height: 60))
        
        freeSampleBtn.setTitle(title: "search_tab_title_ebook".localized)
        buyBookBtn.setTitle(title: "search_tab_title_audiobook".localized)
        freeSampleBtn.changeBtnWithState(state: false)
        buyBookBtn.changeBtnWithState(state: false)
        
        btnsMainBox.addArrangedSubview(freeSampleBtn)
        btnsMainBox.addArrangedSubview(buyBookBtn)
        
        self.freeSampleBtn.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(showSampleAction(sender:))))
        self.freeSampleBtn.isUserInteractionEnabled = true
        
        self.buyBookBtn.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(showBuyPage(sender:))))
        self.buyBookBtn.isUserInteractionEnabled = true
    }
    
    @objc func showSampleAction(sender: UITapGestureRecognizer) {
        print("Check")
        if let detail = detailV {
            detail.showSampleAction()
        }
    }
    
    @objc func showBuyPage(sender: UITapGestureRecognizer) {
        print("Check")
        if let detail = detailV {
            detail.showBuyPage()
        }
    }
}
