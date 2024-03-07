//
//  SearchListCell.swift
//  googleBooks
//
//  Created by 김현지 on 3/4/24.
//

import UIKit

/// 검색 리스트 셀
class SearchListCell: UITableViewCell {
    
    var titleImgV: UIImageView!
    var titleLabel: UILabel!
    var writerLabel: UILabel!
    var bookCase: UILabel!
    
    let autoKit = AutoLayoutKit.shared
    let safeKit = SafeLayoutManager.shared
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        titleImgV = MakeUIImageViewKit.shared.makeImageView(image: UIImage(), size: CGSize(width: 70, height: 100), addView: self)
        titleImgV.containerDecoration(layerColor: nil, layerWidth: nil, bgColor: UIColor.blue, corner: 10)
        
        titleLabel = MakeUILabelKit.shared.makeLabel("-", size: CGSize(width: 100, height: 25), addView: self)
        titleLabel.numberOfLines = 2
        titleLabel.lineBreakMode = .byTruncatingTail
        MakeUILabelKit.shared.textDecoration(titleLabel, fontSize: 15, fontName: nil, color: UIColor.black, alignment: .left)
        
        writerLabel = MakeUILabelKit.shared.makeLabel("-", size: CGSize(width: 100, height: 15), addView: self)
        MakeUILabelKit.shared.textDecoration(writerLabel, fontSize: 12, fontName: nil, color: UIColor.gray, alignment: .left)
        
        bookCase = MakeUILabelKit.shared.makeLabel("-", size: CGSize(width: 100, height: 15), addView: self)
        MakeUILabelKit.shared.textDecoration(bookCase, fontSize: 12, fontName: nil, color: UIColor.gray, alignment: .left)
        
        // autoLayout
        autoKit.setAutoLayout(20, Trailing: nil, Top: 14, Bottom: 14, Width: 70, Height: 100, TargetView: titleImgV, MainView: self)
        
        autoKit.setAutoLayout(nil, Trailing: 20, Top: 14, Bottom: nil, Width: nil, Height: nil, TargetView: titleLabel, MainView: self)
        autoKit.setHeightNotEqualSize(targetView: titleLabel, standardSize: 25, isBig: true)
        autoKit.setViewTerm(10, leftView: titleImgV, rightView: titleLabel, mainView: self)
        
        autoKit.Trailing(writerLabel, MainView: self, TrailingSize: 20)
        autoKit.setViewTerm(10, leftView: titleImgV, rightView: writerLabel, mainView: self)
        autoKit.setViewTerm(5, topView: titleLabel, bottomView: writerLabel, mainView: self)
        autoKit.EqualHeight(writerLabel, Height: 15)
        
        autoKit.Trailing(bookCase, MainView: self, TrailingSize: 20)
        autoKit.setViewTerm(10, leftView: titleImgV, rightView: bookCase, mainView: self)
        autoKit.setViewTerm(5, topView: writerLabel, bottomView: bookCase, mainView: self)
        autoKit.EqualHeight(bookCase, Height: 15)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initData(item: GoogleBookInfo) {
        self.titleLabel.text = item.title
        self.writerLabel.text = item.writer
        self.bookCase.text = "eBook"
    }
}
