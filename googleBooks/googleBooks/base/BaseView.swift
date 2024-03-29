//
//  BaseView.swift
//  googleBooks
//
//  Created by 은냥 on 3/2/24.
//

import UIKit

class BaseView: UIViewController {
    
    var mainWidth: CGFloat = 0
    var mainHeight: CGFloat = 0
    var mainV:  UIView!
    
    let autoKit = AutoLayoutKit.shared
    let safeKit = SafeLayoutManager.shared
    
    var isFirst: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainV = self.view
        mainV.frame = self.view.bounds
        
        mainWidth = self.view.frame.width
        mainHeight = self.view.frame.height
        
        self.initView()
        self.initModel()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if isFirst {
            self.firstAction()
            isFirst = false
        } else {
            self.viewReloadAction()
        }
    }
    
    /** personal function */
    // 뷰 초기화
    func initView() {
        
    }
    
    // 모델
    func initModel() {
        
    }
    
    // 뷰 들어와서 하는 액션
    func firstAction() {
        
    }
    
    // 뷰 리로드 액션
    func viewReloadAction() {
        
    }
    
    // 공통함수
    func showPopup(info: PopInfo) {
        if info.type == .msg {
            let alert = UIAlertController(title: info.title, message: info.msg, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: info.okBtn.title, style: .default, handler: { alert in
                info.okBtn.action()
            }))
            self.present(alert, animated: true)
        }
    }
}
