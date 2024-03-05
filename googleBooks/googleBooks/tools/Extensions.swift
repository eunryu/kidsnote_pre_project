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
