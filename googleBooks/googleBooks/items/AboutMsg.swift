//
//  AboutMsg.swift
//  googleBooks
//
//  Created by 김현지 on 3/7/24.
//

import UIKit

class PopInfo {
    var type: PopupType
    var title: String
    var msg: String
    var okBtn: PopBtnInfo
    var otherBtn: PopBtnInfo?
    
    init(type: PopupType, title: String, msg: String, okBtn: PopBtnInfo, otherBtn: PopBtnInfo? = nil) {
        self.type = type
        self.title = title
        self.msg = msg
        self.okBtn = okBtn
        self.otherBtn = otherBtn
    }
}

class PopBtnInfo {
    var title: String
    var action: (() -> Void)
    
    init(title: String, action: @escaping () -> Void) {
        self.title = title
        self.action = action
    }
}
