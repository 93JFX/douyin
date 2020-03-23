//
//  ScaleAnimateButton.swift
//  myDouyin
//
//  Created by jfx on 2019/12/4.
//  Copyright © 2019 zkbc. All rights reserved.
//

import UIKit
class ScaleAnimateButton: UIButton {
    override func willMove(toSuperview newSuperview: UIView?) {
        super.willMove(toSuperview: newSuperview)
        // 添加一个点击事件
        addTarget(self, action: #selector(toggleSelected), for: .touchUpInside)
    }
    @objc func toggleSelected()  {
        isSelected.toggle()
    }
    override var isSelected: Bool{
        get {
           return super.isSelected
        }
        set {
            self.transform = .init(scaleX: 0.8, y: 0.8)
//            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0.1, options: [.beginFromCurrentState,.transitionCrossDissolve], animations: {
////                super.isSelected = newValue
//                super.transform = .identity
//            })
            UIView.animate(withDuration: 0.3) {
                self.transform = .identity
            }
        }
    }
}
