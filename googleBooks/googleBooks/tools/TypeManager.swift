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
