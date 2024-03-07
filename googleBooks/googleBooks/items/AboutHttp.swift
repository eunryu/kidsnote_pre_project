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
    var pathType: PathType
    /// Api 콜 타입
    var callType: CallType
    /// 파라미터
    var param: NSDictionary
    /// 헤더 : 인증정보 등
    var header: NSDictionary
    
    init(pathType: PathType, callType: CallType, param: NSDictionary, header: NSDictionary? = [:]) {
        self.pathType = pathType
        self.callType = callType
        self.param = param
        
        if let headerParam = header {
            self.header = headerParam
        } else {
            self.header = [:]
        }
    }
}

// Response
class ResponseData {
    var pathType: PathType
    var resCode: String
    var resMsg: String
    
    var dataType: ResDataType
    var dataBody: String // jsonString
    var dataBodyDic: NSDictionary
    var dataBodyArray: NSArray
    
    init(pathType: PathType, resCode: String, resMsg: String, dataBody: String) {
        self.pathType = pathType
        self.resCode = resCode
        self.resMsg = resMsg
        
        self.dataType = .none
        self.dataBody = dataBody
        self.dataBodyDic = [:]
        self.dataBodyArray = []
        
        // json 변환
        let dic = ToolManager.shared.convertJSONToDictionary(jsonString: dataBody)
        if dic.count > 0 {
            self.dataType = .dic
            self.dataBodyDic = dic
        } else {
            let array = ToolManager.shared.convertJSONToArray(jsonString: dataBody)
            if array.count > 0 {
                self.dataType = .array
                self.dataBodyArray = array
            }
        }
    }
    
    init() {
        self.pathType = .none
        self.resCode = ""
        self.resMsg = ""
        self.dataBody = ""
        
        self.dataType = .none
        self.dataBodyDic = [:]
        self.dataBodyArray = []
    }
}
