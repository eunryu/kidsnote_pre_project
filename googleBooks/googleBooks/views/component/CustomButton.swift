//
//  CustomButton.swift
//  googleBooks
//
//  Created by 김현지 on 3/5/24.
//

import UIKit

class CustomButton: UIView {
    
    var btnImgV: UIImageView?
    var btnTitleLabel: UILabel!
    
    private let autoKit = AutoLayoutKit.shared
    private let safeKit = SafeLayoutManager.shared
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setCustomButton(info: CustomButtonInfo) {
        btnTitleLabel = MakeUILabelKit.shared.makeLabel(info.title, size: CGSize(width: 100, height: 30), addView: self)
        autoKit.EqualHeight(btnTitleLabel, Height: 30)
        autoKit.setWidthNotEqualSize(targetView: btnTitleLabel, standardSize: 10, isBig: true)
        
        if info.type == .imgWithTitle, let btnImg = info.btnImg {
            btnImgV = MakeUIImageViewKit.shared.makeImageView(image: btnImg, size: CGSize(width: 24, height: 24), addView: self)
            
            autoKit.setCenterLayout(true, Y: true, Xterms: -16, Yterms: nil, TargetView: btnTitleLabel, MainView: self)
            autoKit.setEqualWidthAndHeight(24, height: 24, targetView: btnImg)
            autoKit.CenterY(btnImgV!, MainView: self)
            autoKit.setViewTerm(8, leftView: btnImgV!, rightView: btnTitleLabel, mainView: self)
        } else {
            autoKit.setCenterLayout(true, Y: true, TargetView: btnTitleLabel, MainView: self)
        }
    }
    
    func setBtnDeco(bgColor: UIColor, txtColor: UIColor, useBorder: Bool) {
        self.backgroundColor = bgColor
        self.btnTitleLabel.textColor = txtColor
        
        if useBorder {
            self.layer.borderColor = UIColor.borderGray.cgColor
            self.layer.borderWidth = 1
        }
        
        self.layer.cornerRadius = 4
        self.layer.masksToBounds = true
    }
}

class CustomButtonInfo {
    var type: CustomButtonType
    var title: String
    var btnImg: UIImage?
    
    init(type: CustomButtonType, title: String, btnImg: UIImage? = nil) {
        self.type = type
        self.title = title
        self.btnImg = btnImg
    }
}
