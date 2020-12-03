//
//  UIView+RTL.swift
//  LZRTLSiwftDemo
//
//  Created by 李君 on 2020/11/16.
//

import UIKit

extension UIView {

    func resetFrameToFitRTL() {
        self.setRtlFrame(frame: frame)
    }
    
    func setRtlFrame(frame: CGRect) {
        self.rtl_setFrame(frame: frame, width: self.superview?.frame.size.width ?? 320)
    }
    
    func rtl_setFrame(frame: CGRect, width: CGFloat) {
        
        let delegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
        var frameTemp = frame
        if delegate.isRTL {
            if self.superview == nil {
                return
            }
            let x = CGFloat(width) - frameTemp.origin.x - frameTemp.size.width
            frameTemp.origin.x = x
        }
        self.frame = frameTemp
    }

}
