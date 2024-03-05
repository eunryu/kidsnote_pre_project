//
//  BaseTableViewCell.swift
//  googleBooks
//
//  Created by 김현지 on 3/5/24.
//

import UIKit

class BaseTableViewCell: UITableViewCell {
    
    let autoKit = AutoLayoutKit.shared
    let safeKit = SafeLayoutManager.shared
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.initView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open func initView() {
        
    }
}
