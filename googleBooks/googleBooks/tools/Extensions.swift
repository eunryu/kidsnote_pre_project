//
//  Extensions.swift
//  googleBooks
//
//  Created by 김현지 on 3/4/24.
//

import UIKit
import UIColor_Hex_Swift

extension UIColor {
    static let blk333 = UIColor("#333333")
    static let blk666 = UIColor("#666666")
    static let blk999 = UIColor("#999999")
    
    static let borderBottomEnable = UIColor("#1E90FF")
    static let borderBottomNotEnable = UIColor("#ffffff")
    
    static let borderGray = UIColor("#e0dfe1")
    static let contentGray = UIColor("#999a9d")
    
    static let cmmBlue = UIColor("#6bb2ee")
}

//MARK: String
public extension String{
    var localized:String{
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
    }
    func localizedWithComment(_ comment:String) -> String{
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: comment)
    }
}


/// 딕셔너리 익스텐션 모음
extension NSDictionary {
    
    /// String 공백 확인
    func checkBlankStringValue(key: String, defStr: String) -> String {
        var value = ""
        
        if !"".elementsEqual(defStr) {
            value = defStr
        }
        
        if self.value(forKey: key) != nil && self.value(forKey: key) as? String != nil {
            value = self.value(forKey: key) as! String
        }
        
        // <null> 로 오면 빈값처리
        if "<null>".elementsEqual(value) {
            value = ""
        }
        
        return value
    }
    
    /// boolean 변환
    func checkBool(key: String, defBool: Bool, trueString: String) -> Bool {
        var value: Bool = defBool
        let valueStr = self.checkBlankStringValue(key: key, defStr: "")
        
        if !"".elementsEqual(valueStr) {
            if trueString.elementsEqual(valueStr) {
                value = true
            } else {
                value = false
            }
        }
        
        return value
    }
    
    /// 인티져 변환
    func checkBlankInteger(key: String) -> Int {
        var value = 0
        
        if self.value(forKey: key) != nil && self.value(forKey: key) as? Int != nil {
            value = self.value(forKey: key) as! Int
        }
        
        return value
    }
    
    /// 딕셔너리 변환 및 공백확인
    func checkBlankDictionary(key: String) -> NSDictionary {
        var value: NSDictionary = [:]
        
        if self.value(forKey: key) != nil && self.value(forKey: key) as? NSDictionary != nil {
            value = self.value(forKey: key) as! NSDictionary
        }
        
        return value
    }
    
    /// array 변환 및 공백여부 확인
    func checkBlankArray(key: String) -> NSArray {
        var value: NSArray = []
        
        if self.value(forKey: key) != nil && self.value(forKey: key) as? NSArray != nil {
            value = self.value(forKey: key) as! NSArray
        }
        
        return value
    }
}
