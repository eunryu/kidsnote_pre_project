//
//  GoogleBookViewModel.swift
//  googleBooks
//
//  Created by 김현지 on 3/7/24.
//

import UIKit
import RxSwift

class GoogleBookViewModel : CallDelegate {
    
    private let callM = CallManager.shared
    
    var listReload = PublishSubject<[GoogleBookInfo]>()

    func searhcGoogleBook(searchMsg: String) {
        let param: NSDictionary = ["q": searchMsg]
        let reqInfo = RequestInfo(pathType: .bookSearchApi, callType: .get, param: param, header: nil)
        
        callM.callDel = self
        callM.call(reqInfo: reqInfo)
    }
    
    /** Http Delegate */
    func callResultAction(resInfo: ResponseData) {
        callM.callDel = nil
        
        if "0000".elementsEqual(resInfo.resCode) {
            // 성공 분기
            if resInfo.pathType == .bookSearchApi {
                var array: [GoogleBookInfo] = []
                
                if resInfo.dataBodyDic.count > 0 {
                    let itemArray = resInfo.dataBodyDic.checkBlankArray(key: "items")
                    if itemArray.count > 0 {
                        for item in itemArray {
                            if let itemDic = item as? NSDictionary {
                                array.append(GoogleBookInfo(data: itemDic))
                            }
                        }
                    }
                }
                
                self.listReload.onNext(array)
            }
        }
    }
}
