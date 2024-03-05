//
//  CustomButton.swift
//  googleBooks
//
//  Created by 김현지 on 3/5/24.
//

import UIKit

class CustomButton: UIView {
    
    var btnImgV: UIImageView!
    var btnTitleLabel: UILabel!
    
    private let autoKit = AutoLayoutKit.shared
    private let safeKit = SafeLayoutManager.shared
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class CustomButtonInfo {
    var btnImg: UIImage?
    var title: String
    
    init(btnImg: UIImage? = nil, title: String) {
        self.btnImg = btnImg
        self.title = title
    }
}
