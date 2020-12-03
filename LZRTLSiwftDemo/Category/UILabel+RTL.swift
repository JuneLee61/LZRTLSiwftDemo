//
//  UILabel+RTL.swift
//  LZRTLSiwftDemo
//
//  Created by 李君 on 2020/11/16.
//

import UIKit

extension UILabel {

    public class func initializeMethod() {
        self.rtl_MethodSwizzling(fromMethod: #selector(setter: UILabel.textAlignment), toMethod: #selector(rtl_setTextAlignment(textAlignment:)))
    }

    class func rtl_MethodSwizzling(fromMethod: Selector, toMethod: Selector) {
        guard let method1 = class_getInstanceMethod(self, fromMethod) else { return  }
        guard let method2 = class_getInstanceMethod(self, toMethod) else { return  }
        method_exchangeImplementations(method1, method2)
    }

    @objc func rtl_setTextAlignment(textAlignment: NSTextAlignment) {
        let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
        var alignment = textAlignment
        if appDelegate.isRTL {
            if textAlignment == .natural || textAlignment == .left {
                alignment = .right
            }else if textAlignment == .right {
                alignment = .left
            }
        }
        self.rtl_setTextAlignment(textAlignment: alignment)
    }
}
