//
//  TypeManager.swift
//  googleBooks
//
//  Created by 은냥 on 3/3/24.
//

import UIKit

enum ApiType: String {
    case real = "https://www.googleapis.com"
}

enum PathType: String {
    case none = ""
    case bookSearchApi = "/books/v1/volumes"
}

enum ResDataType {
    case none
    case dic
    case array
}

enum CallType {
    case get
    case post
}

enum TabType {
    case ebook
    case audioBook
}

enum CustomButtonType {
    case onlyTitle
    case imgWithTitle
}

enum BlankType {
    case notLoad
    case dataBlank
}

enum PopupType {
    case msg
    case toast
    case confirm
}

/**
 날짜 타입
 */
enum DateType: String {
    case apiDate = "yyyy-MM-dd"
    case showDate = "yyyy년 MM월 dd일"
}
