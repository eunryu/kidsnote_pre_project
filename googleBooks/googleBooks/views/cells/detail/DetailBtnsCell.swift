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
    
    override func initView() {
        super.initView()
        
        btnsMainBox = UIStackView(frame: CGRect(x: 0, y: 0, width: 0, height: 60))
        btnsMainBox.axis = .horizontal
        btnsMainBox.distribution = .fillEqually
        btnsMainBox.spacing = 10
        self.addSubview(btnsMainBox)
        
        infoImgV = MakeUIImageViewKit.shared.makeImageView(image: UIImage(), size: CGSize(width: 30, height: 30), addView: self)
        infoMsgLabel = MakeUILabelKit.shared.makeLabel("Google Play 웹사이트에서 구매한 책을 이 앱에서 읽을 수 있습니다.", size: CGSize(width: 0, height: 0), addView: self)
        MakeUILabelKit.shared.textDecoration(infoMsgLabel, fontSize: 12, fontName: nil, color: .blk666, alignment: .left)
        infoMsgLabel.numberOfLines = 0
        
        autoKit.setAutoLayout(30, Trailing: 30, Top: 26, Bottom: nil, Width: nil, Height: 60, TargetView: btnsMainBox, MainView: self)
        autoKit.setAutoLayout(30, Trailing: nil, Top: nil, Bottom: nil, Width: 30, Height: 30, TargetView: infoImgV, MainView: self)
        autoKit.equalViewTop(targetView: infoImgV, standardView: infoMsgLabel, mainView: self)
        
        autoKit.setViewTerm(20, leftView: infoImgV, rightView: infoMsgLabel, mainView: self)
        autoKit.setAutoLayout(nil, Trailing: 30, Top: nil, Bottom: 36, Width: nil, Height: nil, TargetView: infoMsgLabel, MainView: self)
        autoKit.setHeightNotEqualSize(targetView: infoMsgLabel, standardSize: 30, isBig: true)
        autoKit.setViewTerm(30, topView: btnsMainBox, bottomView: infoMsgLabel, mainView: self)
    }
}
