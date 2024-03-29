//
//  DetailBookInfoCell.swift
//  googleBooks
//
//  Created by 김현지 on 3/5/24.
//

import UIKit

/// 상세보기 헤더
class DetailBookInfoCell: BaseTableViewCell {
    
    var bookImgV: UIImageView!
    var bookTitleLabel: UILabel!
    var bookWriterLabel: UILabel!
    var bookInfoLabel: UILabel!
    
    override func initView() {
        super.initView()
        
        bookImgV = MakeUIImageViewKit.shared.makeImageView(image: UIImage(resource: .no), size: CGSize(width: 70, height: 100), addView: self)
        bookImgV.layer.cornerRadius = 4
        bookImgV.layer.masksToBounds = true
        
        bookTitleLabel = MakeUILabelKit.shared.makeLabel("-", size: CGSize(width: 100, height: 20), addView: self)
        bookTitleLabel.numberOfLines = 0
        MakeUILabelKit.shared.textDecoration(bookTitleLabel, fontSize: 15, fontName: nil, color: .blk333, alignment: .left)
        
        bookWriterLabel = MakeUILabelKit.shared.makeLabel("-", size: CGSize(width: 100, height: 16), addView: self)
        MakeUILabelKit.shared.textDecoration(bookWriterLabel, fontSize: 12, fontName: nil, color: .blk666, alignment: .left)
        
        bookInfoLabel = MakeUILabelKit.shared.makeLabel("-", size: CGSize(width: 100, height: 16), addView: self)
        MakeUILabelKit.shared.textDecoration(bookInfoLabel, fontSize: 12, fontName: nil, color: .blk666, alignment: .left)
        
        let grayBorder = MakeUIViewKit.shared.makeBorderView(borderWidth: 100, borderColor: .borderGray, addView: self)
        
        // autoLayout
        autoKit.setAutoLayout(20, Trailing: nil, Top: 30, Bottom: 30, Width: 70, Height: 100, TargetView: bookImgV, MainView: self)
        
        autoKit.setAutoLayout(nil, Trailing: 20, Top: 30, Bottom: nil, Width: nil, Height: nil, TargetView: bookTitleLabel, MainView: self)
        autoKit.setViewTerm(20, leftView: bookImgV, rightView: bookTitleLabel, mainView: self)
        autoKit.setHeightNotEqualSize(targetView: bookTitleLabel, standardSize: 25, isBig: true)
        
        autoKit.setAutoLayout(nil, Trailing: 20, Top: nil, Bottom: nil, Width: nil, Height: 16, TargetView: bookWriterLabel, MainView: self)
        autoKit.setViewTerm(20, leftView: bookImgV, rightView: bookWriterLabel, mainView: self)
        autoKit.setViewTerm(5, topView: bookTitleLabel, bottomView: bookWriterLabel, mainView: self)
        
        autoKit.setAutoLayout(nil, Trailing: 20, Top: nil, Bottom: nil, Width: nil, Height: 16, TargetView: bookInfoLabel, MainView: self)
        autoKit.setViewTerm(20, leftView: bookImgV, rightView: bookInfoLabel, mainView: self)
        autoKit.setViewTerm(5, topView: bookWriterLabel, bottomView: bookInfoLabel, mainView: self)
        
        autoKit.setAutoLayout(0, Trailing: 0, Top: nil, Bottom: 0, Width: nil, Height: 1, TargetView: grayBorder, MainView: self)
    }
    
    func initData(data: GoogleBookInfo) {
        CallManager.loadImage(imgURL: data.titleImgUrl, imgV: self.bookImgV)
        
        bookTitleLabel.text = data.title
        bookWriterLabel.text = data.writer
        bookInfoLabel.text = "eBook/\(data.pageCnt)페이지"
    }
}
