//
//  CallManager.swift
//  googleBooks
//
//  Created by 김현지 on 3/7/24.
//

import UIKit

protocol CallDelegate {
    func callResultAction(resInfo: ResponseData)
}

class CallManager {
    static let shared = CallManager()
    var callDel: CallDelegate?
    
    func call(reqInfo: RequestInfo) {
        let sessionConfig = URLSessionConfiguration.default
        sessionConfig.timeoutIntervalForRequest = 10
        
        if let callReq = ToolManager.shared.makeCallUrlRequest(info: reqInfo) {
            URLSession(configuration: sessionConfig).dataTask(with: callReq) { loadData, response, error in
                var code = ""
                var msg = ""
                var bodyJSON = ""
                
                if let resCheck = response as? HTTPURLResponse {
                    if resCheck.statusCode == 200 {
                        // 성공
                        var resType: ApiResultType = .none
                        if let data = loadData, let dataString = String(data: data, encoding: .utf8) {
                            bodyJSON = dataString
                            resType = .httpOK
                        } else {
                            resType = .dataEmpty
                        }
                        
                        code = resType.info().code
                        msg = resType .info().msg
                    } else {
                        // 실패
                        code = "9999"
                        if let err = error {
                            msg = err.localizedDescription
                        } else {
                            msg = "통신 중 오류가 발생하였습니다."
                        }
                    }
                    
                    if let del = self.callDel {
                        DispatchQueue.main.async {
                            let result = ResponseData(pathType: reqInfo.pathType, resCode: code, resMsg: msg, dataBody: bodyJSON)
                            del.callResultAction(resInfo: result)
                        }
                    }
                }
            }.resume()
        } else {
            if let del = self.callDel {
                DispatchQueue.main.async {
                    let resType: ApiResultType = .urlError
                    let result = ResponseData(pathType: reqInfo.pathType, resCode: resType.info().code, resMsg: resType.info().msg, dataBody: "")
                    del.callResultAction(resInfo: result)
                }
            }
        }
    }
}
