//
//  BaseView.swift
//  googleBooks
//
//  Created by 김현지 on 3/2/24.
//

import UIKit
import EDToolKit

class BaseView: UIViewController {
    
    var mainWidth: CGFloat = 0
    var mainHeight: CGFloat = 0
    var mainV:  UIView!
    
    let autoKit = AutoLayoutKit.shared
    let safeKit = SafeLayoutManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    /** personal function */
    func initView() {
        
    }
}
