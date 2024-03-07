//
//  GoogleBookInfo.swift
//  googleBooks
//
//  Created by 김현지 on 3/7/24.
//

import UIKit

class GoogleBookInfo {
    var bookId: String
    var titleImgUrl: String
    var title: String
    var writer: String
    var  bookType: String
    
    init() {
        self.bookId = ""
        self.titleImgUrl = ""
        self.title = ""
        self.writer = ""
        self.bookType = ""
    }
    
    init(data: NSDictionary) {
        self.bookId = data.checkBlankStringValue(key: "id", defStr: "")
        self.titleImgUrl = data.checkBlankStringValue(key: "", defStr: "")
        self.title = ""
        self.writer = ""
        self.bookType = ""
        
        let bookInfoDic = data.checkBlankDictionary(key: "volumeInfo")
        if bookInfoDic.count > 0 {
            self.title = bookInfoDic.checkBlankStringValue(key: "title", defStr: "")
            
            let writers = bookInfoDic.checkBlankArray(key: "authors")
            if writers.count > 0 {
                var writerString = ""
                for item in writers {
                    if let itemStr = item as? String {
                        if "".elementsEqual(writerString) {
                            writerString = itemStr
                        } else {
                            writerString = "\(writerString), \(itemStr)"
                        }
                    }
                }
                
                self.writer = writerString
            }
            
            let imgDic = data.checkBlankDictionary(key: "imageLinks")
            if imgDic.count > 0 {
                self.titleImgUrl = imgDic.checkBlankStringValue(key: "thumbnail", defStr: "")
            }
        }
    }
}
