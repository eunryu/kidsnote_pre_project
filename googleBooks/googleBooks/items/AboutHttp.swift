//
//  AboutHttp.swift
//  googleBooks
//
//  Created by 은냥 on 3/3/24.
//

import UIKit

/// 리퀘스트 인포 모음
class RequestInfo {
    
    /// API 콜 타입
    var callType: PathType
    /// 파라미터
    var param: NSDictionary
    /// 헤더 : 인증정보 등
    var header: NSDictionary
    
    init(callType: PathType, param: NSDictionary, header: NSDictionary) {
        self.callType = callType
        self.param = param
        self.header = header
    }
}
