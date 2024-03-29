//
//  GoogleBookInfo.swift
//  googleBooks
//
//  Created by 김현지 on 3/7/24.
//

import UIKit

class GoogleBookInfo {
    // 외부
    var bookId: String
    var titleImgUrl: String
    var title: String
    var writer: String
    var  bookType: String
    
    // 내부 디테일
    var pageCnt: Int
    var rating: Int
    var ratingCnt: Int
    var publishedDate: String
    var publisher: String
    
    var shortDescription: String
    var originDescription: String
    
    var sampleUrl: String
    
    init() {
        self.bookId = ""
        self.titleImgUrl = ""
        self.title = ""
        self.writer = ""
        self.bookType = ""
        
        self.pageCnt = 0
        self.rating = 0
        self.ratingCnt = 0
        self.publishedDate = ""
        self.publisher = ""
        
        self.shortDescription = ""
        self.originDescription = ""
        
        self.sampleUrl = ""
    }
    
    init(data: NSDictionary) {
        self.bookId = data.checkBlankStringValue(key: "id", defStr: "")
        self.titleImgUrl = data.checkBlankStringValue(key: "", defStr: "")
        self.title = ""
        self.writer = ""
        self.bookType = ""
        
        self.pageCnt = 0
        self.rating = 0
        self.ratingCnt = 0
        self.publishedDate = ""
        self.publisher = ""
        
        self.shortDescription = ""
        self.originDescription = ""
        
        self.sampleUrl = ""
        
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
            
            let imgDic = bookInfoDic.checkBlankDictionary(key: "imageLinks")
            if imgDic.count > 0 {
                self.titleImgUrl = imgDic.checkBlankStringValue(key: "thumbnail", defStr: "")
            }
            
            self.pageCnt = bookInfoDic.checkBlankInteger(key: "pageCount")
            self.rating = bookInfoDic.checkBlankInteger(key: "averageRating")
            self.ratingCnt = bookInfoDic.checkBlankInteger(key: "ratingsCount")
            self.publishedDate = bookInfoDic.checkBlankStringValue(key: "publishedDate", defStr: "")
            self.publisher = bookInfoDic.checkBlankStringValue(key: "publisher", defStr: "")
            
            let searchInfoDic = data.checkBlankDictionary(key: "searchInfo")
            self.shortDescription = searchInfoDic.checkBlankStringValue(key: "textSnippet", defStr: "")
            self.originDescription = bookInfoDic.checkBlankStringValue(key: "description", defStr: "")
        }
        
        let accessDic = data.checkBlankDictionary(key: "accessInfo")
        self.sampleUrl = accessDic.checkBlankStringValue(key: "webReaderLink", defStr: "")
    }
}
