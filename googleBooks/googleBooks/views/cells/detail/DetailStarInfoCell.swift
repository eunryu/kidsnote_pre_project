//
//  DetailStarInfoCell.swift
//  googleBooks
//
//  Created by 김현지 on 3/6/24.
//

import UIKit

class DetailStarInfoCell: BaseTableViewCell {
    
    var titleLabel: UILabel!
    var ratingBox: UIView!
    var infoBtn: UILabel!
    
    override func initView() {
        super.initView()
        
        titleLabel = MakeUILabelKit.shared.makeLabel("평점 및 리뷰", size: CGSize(width: 150, height: 25), addView: self)
        MakeUILabelKit.shared.textDecoration(titleLabel, fontSize: 20, fontName: nil, color: .blk333, alignment: .left)

        ratingBox = MakeUIViewKit.shared.makeView(size: CGSize(width: 300, height: 200), background: .white)
        self.addSubview(ratingBox)
        
        infoBtn = MakeUILabelKit.shared.makeLabel("평점 및 리뷰 정보 !", size: CGSize(width: 150, height: 20), addView: self)
        MakeUILabelKit.shared.textDecoration(infoBtn, fontSize: 12, fontName: nil, color: .blk333, alignment: .left)
        
        autoKit.setAutoLayout(16, Trailing: 16, Top: 20, Bottom: nil, Width: nil, Height: 25, TargetView: titleLabel, MainView: self)
        autoKit.setAutoLayout(16, Trailing: nil, Top: nil, Bottom: 20, Width: 150, Height: 20, TargetView: infoBtn, MainView: self)
        autoKit.setAutoLayout(16, Trailing: 16, Top: nil, Bottom: nil, Width: nil, Height: 200, TargetView: ratingBox, MainView: self)
        autoKit.setViewTerm(10, topView: titleLabel, bottomView: ratingBox, mainView: self)
        autoKit.setViewTerm(20, topView: ratingBox, bottomView: infoBtn, mainView: self)
    }
    
}
