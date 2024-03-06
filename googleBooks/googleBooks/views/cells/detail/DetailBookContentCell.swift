//
//  DetailBookContentCell.swift
//  googleBooks
//
//  Created by 김현지 on 3/6/24.
//

import UIKit

class DetailBookContentCell: BaseTableViewCell {
    
    var titleLabel: UILabel!
    var arrowV: UIImageView!
    var contentLabel: UILabel!
    
    override func initView() {
        super.initView()
        
        titleLabel = MakeUILabelKit.shared.makeLabel("eBook 정보", size: CGSize(width: 150, height: 25), addView: self)
        MakeUILabelKit.shared.textDecoration(titleLabel, fontSize: 20, fontName: nil, color: .blk333, alignment: .left)
        
        contentLabel = MakeUILabelKit.shared.makeLabel("애플, 구글, 그리고 마이크로 소프트가 펼치는 솰라솰라", size: CGSize(width: 150, height: 20), addView: self)
        MakeUILabelKit.shared.textDecoration(contentLabel, fontSize: 11, fontName: nil, color: .contentGray, alignment: .left)
        contentLabel.numberOfLines = 5
        contentLabel.lineBreakMode = .byTruncatingTail
        
        autoKit.setAutoLayout(16, Trailing: 16, Top: 20, Bottom: nil, Width: nil, Height: 25, TargetView: titleLabel, MainView: self)
        autoKit.setAutoLayout(16, Trailing: 16, Top: nil, Bottom: 20, Width: nil, Height: nil, TargetView: contentLabel, MainView: self)
        autoKit.setHeightNotEqualSize(targetView: contentLabel, standardSize: 0, isBig: true)
        autoKit.setViewTerm(10, topView: titleLabel, bottomView: contentLabel, mainView: self)
        
        let bottomBorder = MakeUIViewKit.shared.makeBorderView(borderWidth: 100, borderColor: .borderGray, addView: self)
        autoKit.setAutoLayout(0, Trailing: 0, Top: nil, Bottom: 0, Width: nil, Height: 1, TargetView: bottomBorder, MainView: self)
    }
}