//
//  ContentView.swift
//  googleBooks
//
//  Created by 김현지 on 3/7/24.
//

import UIKit

class ContentView: BaseView {
    
    var naviBar: UIView!
    var naviLabel: UILabel!
    var backBtn: UIButton!
    
    override func initView() {
        super.initView()
        
        naviBar = UIView(frame: CGRect(x: 0, y: 0, width: mainWidth, height: 60))
        naviBar.translatesAutoresizingMaskIntoConstraints = false
        self.mainV.addSubview(naviBar)
        
        naviLabel = MakeUILabelKit.shared.makeLabel("도서정보", size: CGSize(width: 100, height: 30), addView: naviBar)
        MakeUILabelKit.shared.textDecoration(naviLabel, fontSize: 16, fontName: nil, color: .blk333, alignment: .center)
        
        backBtn = MakeUIButtonKit.shared.makeButton(nImage: UIImage(resource: .iconBack), pImage: UIImage(resource: .iconBack), size: CGSize(width: 26, height: 26), addView: naviBar)
        
        safeKit.basicLayout(left: 0, right: 0, targetView: naviBar, baseView: self.mainV)
        safeKit.singleLayout(type: .top, value: 0, targetView: naviBar, baseView: self.mainV)
        autoKit.EqualHeight(naviBar, Height: 60)
        
        autoKit.setCenterLayout(true, Y: true, TargetView: naviLabel, MainView: naviBar)
        autoKit.setEqualWidthAndHeight(100, height: 30, targetView: naviLabel)
        
        autoKit.CenterY(backBtn, terms: 0, MainView: naviBar)
        autoKit.Leading(backBtn, MainView: naviBar, LeadingSize: 16)
        autoKit.setEqualWidthAndHeight(26, height: 26, targetView: backBtn)
        
        // action
        backBtn.addTarget(self, action: #selector(backAction(sender: )), for: .touchUpInside)
    }
    
    /** Back Action */
    @objc func backAction(sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
