//
//  TabMenuButton.swift
//  googleBooks
//
//  Created by 김현지 on 3/4/24.
//

import UIKit

class TabMenuButton: UIView {
    
    var tabMenuLabel: UILabel!
    var tabBorderView: UIView!
    
    let autoKit = AutoLayoutKit.shared
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        tabMenuLabel = MakeUILabelKit.shared.makeLabel("-", size: CGSize(width: 10, height: 30), addView: self)
        MakeUILabelKit.shared.textDecoration(tabMenuLabel, fontSize: 14, fontName: nil, color: UIColor.black, alignment: .center)
        
        tabBorderView = MakeUIViewKit.shared.makeView(size: CGSize(width: 20, height: 4), background: UIColor.black)
        tabBorderView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        tabBorderView.layer.cornerRadius = 4
        tabBorderView.layer.masksToBounds = true
        self.addSubview(tabBorderView)
        
        autoKit.EqualHeight(tabMenuLabel, Height: 30)
        autoKit.setWidthNotEqualSize(targetView: tabMenuLabel, standardSize: 10, isBig: true)
        autoKit.setCenterLayout(true, Y: true, TargetView: tabMenuLabel, MainView: self)
        
        autoKit.Bottom(tabBorderView, MainView: self, BottomSize: 0)
        autoKit.EqualHeight(tabBorderView, Height: 4)
        autoKit.equalViewLeadTrail(targetView: tabBorderView, standardView: tabMenuLabel, mainView: self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setTitle(title: String) {
        self.tabMenuLabel.text = title
    }
    
    func changeBtnWithState(state: Bool) {
        if state {
            tabMenuLabel.textColor = UIColor.borderBottomEnable
            tabBorderView.backgroundColor = UIColor.borderBottomEnable
        } else {
            tabMenuLabel.textColor = UIColor.blk666
            tabBorderView.backgroundColor = UIColor.borderBottomNotEnable
        }
    }
}
