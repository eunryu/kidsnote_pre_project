//
//  ErrorInfo.swift
//  googleBooks
//
//  Created by 김현지 on 3/7/24.
//

import UIKit

/// HTTP 결과 타입, 메시지 및 코드 반환함
enum ApiResultType {
    /// 불명
    case none
    /// URL 오류, 정확한 URL 이 아님
    case urlError
    /// Http 통신 중 오류, 데이터 제대로 못받음
    case httpError
    /// 데이터가 비어있음
    case dataEmpty
    /// JSON  -> NSDic 변환 중 에러
    case jsonError
    /// 결과코드가 빈값임
    case resCodeBlk
    /// API 자체 오류
    case apiError
    /// 성공
    case httpOK
    
    /// 메시지 및 코드 반환
    func info() -> (code: String, msg: String) {
        switch self {
        case .none:
            return ("-9999", "무선인터넷 접속 오류나 통신사 오류로\n서비스 접속이 지연되고 있습니다.\n잠시 후 다시 이용해 주세요.\n [ code: -9999 ]")
            
        case .urlError:
            return ("9000", "무선인터넷 접속 오류나 통신사 오류로\n서비스 접속이 지연되고 있습니다.\n잠시 후 다시 이용해 주세요.\n [ code: 9000 ]")
            
        case .httpError:
            return ("9001", "무선인터넷 접속 오류나 통신사 오류로\n서비스 접속이 지연되고 있습니다.\n잠시 후 다시 이용해 주세요.\n [ code: 9001 ]")
            
        case .dataEmpty:
            return ("9002", "무선인터넷 접속 오류나 통신사 오류로\n서비스 접속이 지연되고 있습니다.\n잠시 후 다시 이용해 주세요.\n [ code: 9002 ]")
            
        case .jsonError:
            return ("9003", "무선인터넷 접속 오류나 통신사 오류로\n서비스 접속이 지연되고 있습니다.\n잠시 후 다시 이용해 주세요.\n [ code: 9003 ]")
            
        case .resCodeBlk:
            return ("9999", "무선인터넷 접속 오류나 통신사 오류로\n서비스 접속이 지연되고 있습니다.\n잠시 후 다시 이용해 주세요.\n [ code: 9999 ]")

        case .apiError:
            return ("9004", "API 메시지에 따름")
            
        case .httpOK:
            return ("0000", "성공")
        }
    }
}
