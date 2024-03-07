//
//  DetailCreatorInfoCell.swift
//  googleBooks
//
//  Created by 김현지 on 3/6/24.
//

import UIKit

class DetailCreatorInfoCell: BaseTableViewCell {
    
    var titleLabel: UILabel!
    var dateInfoLabel: UILabel!
    
    override func initView() {
        super.initView()
        
        titleLabel = MakeUILabelKit.shared.makeLabel("게시일", size: CGSize(width: 100, height: 26), addView: self)
        MakeUILabelKit.shared.textDecoration(titleLabel, fontSize: 20, fontName: nil, color: .blk333, alignment: .left)
        
        dateInfoLabel = MakeUILabelKit.shared.makeLabel("2023년 3월 21일 아라크네", size: CGSize(width: 100, height: 25), addView: self)
        MakeUILabelKit.shared.textDecoration(dateInfoLabel, fontSize: 14, fontName: nil, color: .blk666, alignment: .left)
        
        autoKit.setAutoLayout(16, Trailing: 16, Top: 20, Bottom: nil, Width: nil, Height: 26, TargetView: titleLabel, MainView: self)
        autoKit.setAutoLayout(16, Trailing: 16, Top: nil, Bottom: 30, Width: nil, Height: 20, TargetView: dateInfoLabel, MainView: self)
        autoKit.setViewTerm(16, topView: titleLabel, bottomView: dateInfoLabel, mainView: self)
    }
    
    func initData(bookInfo: GoogleBookInfo) {
        dateInfoLabel.text = "\(bookInfo.publishedDate), \(bookInfo.publisher)"
    }
}
