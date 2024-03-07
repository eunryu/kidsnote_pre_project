//
//  CmmBlankCell.swift
//  googleBooks
//
//  Created by 김현지 on 3/7/24.
//

import UIKit

class CmmBlankCell: BaseTableViewCell {
    
    var titleLabel: UILabel!
    var msgLabel: UILabel!
    
    override func initView() {
        super.initView()
        
        titleLabel = MakeUILabelKit.shared.makeLabel("-", size: CGSize(width: 200, height: 30), addView: self)
        MakeUILabelKit.shared.textDecoration(titleLabel, fontSize: 20, fontName: nil, color: .blk333, alignment: .center)
        
        msgLabel = MakeUILabelKit.shared.makeLabel("-", size: CGSize(width: 200, height: 20), addView: self)
        msgLabel.numberOfLines = 0
        MakeUILabelKit.shared.textDecoration(msgLabel, fontSize: 20, fontName: nil, color: .blk333, alignment: .center)
        
        autoKit.setAutoLayout(20, Trailing: 20, Top: 120, Bottom: nil, Width: nil, Height: 30, TargetView: titleLabel, MainView: self)
        autoKit.setAutoLayout(20, Trailing: 20, Top: nil, Bottom: nil, Width: nil, Height: nil, TargetView: msgLabel, MainView: self)
        autoKit.setViewTerm(16, topView: titleLabel, bottomView: msgLabel, mainView: self)
        autoKit.setHeightNotEqualSize(targetView: msgLabel, standardSize: 20, isBig: true)
    }
    
    func setBlankInfo(type: BlankType) {
        if type == .notLoad {
            titleLabel.text = "검색중..."
            msgLabel.text = ""
        } else if type == .dataBlank {
            titleLabel.text = "검색 내용이 없습니다"
            msgLabel.text = "해당 검색어에 대한 책 리스트가 존재하지 않습니다, 다른 검색어로 시도해주세요!"
        }
    }
}
