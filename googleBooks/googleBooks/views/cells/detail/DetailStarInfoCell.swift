//
//  DetailStarInfoCell.swift
//  googleBooks
//
//  Created by 김현지 on 3/6/24.
//

import UIKit

class DetailStarInfoCell: BaseTableViewCell {
    
    var titleLabel: UILabel!
    var arrowV: UIImageView!
    var ratingBox: UIView!
    
    var ratingLabel: UILabel!
    var ratingCntLabel: UILabel!
    var ratingImg: UIImageView!
    
    override func initView() {
        super.initView()
        
        titleLabel = MakeUILabelKit.shared.makeLabel("평점 및 리뷰", size: CGSize(width: 150, height: 25), addView: self)
        MakeUILabelKit.shared.textDecoration(titleLabel, fontSize: 20, fontName: nil, color: .blk333, alignment: .left)

        arrowV = MakeUIImageViewKit.shared.makeImageView(image: UIImage(resource: .iconArrowRight), size: CGSize(width: 16, height: 16), addView: self)
        
        ratingBox = MakeUIViewKit.shared.makeView(size: CGSize(width: 300, height: 50), background: .white)
        self.addSubview(ratingBox)
        
        autoKit.setAutoLayout(16, Trailing: 16, Top: 20, Bottom: nil, Width: nil, Height: 25, TargetView: titleLabel, MainView: self)
        autoKit.setAutoLayout(16, Trailing: 16, Top: nil, Bottom: 10, Width: nil, Height: 50, TargetView: ratingBox, MainView: self)
        autoKit.setViewTerm(16, topView: titleLabel, bottomView: ratingBox, mainView: self)
        
        autoKit.setEqualWidthAndHeight(16, height: 16, targetView: arrowV)
        autoKit.equalViewCenterVertical(targetView: arrowV, standardView: titleLabel, mainView: self)
        autoKit.Trailing(arrowV, MainView: self, TrailingSize: 16)
        
        // 레이팅바
        ratingLabel = MakeUILabelKit.shared.makeLabel("5.0", size: CGSize(width: 80, height: 30), addView: ratingBox)
        MakeUILabelKit.shared.textDecoration(ratingLabel, fontSize: 20, fontName: nil, color: .blk333, alignment: .left)
        
        ratingCntLabel = MakeUILabelKit.shared.makeLabel("Google Play 평점 0개", size: CGSize(width: 100, height: 20), addView: ratingBox)
        MakeUILabelKit.shared.textDecoration(ratingCntLabel, fontSize: 12, fontName: nil, color: .blk333, alignment: .left)
        
        autoKit.setAutoLayout(0, Trailing: nil, Top: 0, Bottom: nil, Width: 80, Height: 30, TargetView: ratingLabel, MainView: ratingBox)
        autoKit.setAutoLayout(0, Trailing: nil, Top: nil, Bottom: 0, Width: 150, Height: 20, TargetView: ratingCntLabel, MainView: ratingBox)
    }
    
    func initData(info: GoogleBookInfo) {
        if info.rating == 0 {
            ratingLabel.text = "0.0"
        } else {
            ratingLabel.text = "\(info.rating)"
        }
        
        ratingCntLabel.text = "Google Play 평점 \(info.ratingCnt)개"
    }
}
