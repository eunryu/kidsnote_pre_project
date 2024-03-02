//
//  ToolManager.swift
//  googleBooks
//
//  Created by 김현지 on 3/3/24.
//

import UIKit

class ToolManager {
    static let shared = ToolManager()
    
    /// JSON to Dictionary
    func convertJSONToDictionary(jsonString: String) -> NSDictionary {
        var returnDic: NSDictionary = [:]
        
        let jsonData = jsonString.data(using: .utf8)
        do {
            let jsonAny = try JSONSerialization.jsonObject(with: jsonData!, options: .fragmentsAllowed)
            
            if let jsonDic = jsonAny as? NSDictionary {
                returnDic = jsonDic
            }
        } catch {
            
        }
        
        return returnDic
    }
    
    /// JSON String To Array
    func convertJSONToArray(jsonString: String) -> NSArray {
        var returnDic: NSArray = []
        
        let jsonData = jsonString.data(using: .utf8)
        do {
            let jsonAny = try JSONSerialization.jsonObject(with: jsonData!, options: .fragmentsAllowed)
            
            if let jsonDic = jsonAny as? NSArray {
                returnDic = jsonDic
            }
        } catch {
            
        }
        
        return returnDic
    }
    
    /// Dictionary to JSON
    func convertDictionaryToString(jsonString: NSDictionary) -> String {
        var returnStr = ""
        
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: jsonString, options: .prettyPrinted)
            
            if let convertStr =  String(data: jsonData, encoding: .utf8) {
                returnStr =  convertStr
            }
        } catch {
            
        }
        return returnStr
    }
    
    /// 빈값 체크, 딕셔너리 체크 제외한 애들
    func checkBlankString(checkValue: String?, defaultStr: String) -> String {
        var returnStr = ""
        
        if !"".elementsEqual(defaultStr) && (defaultStr as NSString).length > 0 {
            returnStr = defaultStr
        }
        
        if checkValue != nil && !"".elementsEqual(checkValue!) && (checkValue! as NSString).length > 0 {
            returnStr = checkValue!
        }
        
        return returnStr
    }
    
    /// String 형변환
    func convertStringToInt(str: String) -> Int {
        var resultInt = 0
        
        if let result = Int(str) {
            resultInt = result
        }
        
        return resultInt
    }
}
