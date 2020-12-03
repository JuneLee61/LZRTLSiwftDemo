//
//  UIImage+RTL.swift
//  LZRTLSiwftDemo
//
//  Created by 李君 on 2020/11/16.
//

import UIKit

extension UIImage  {

    public func rtl_imageFlippenForRightToLeftLayoutDirection(isRight: Bool) -> UIImage {
        if isRight {
            return UIImage.init(cgImage: self.cgImage!, scale: self.scale, orientation: .upMirrored)
        }
        return self
    }

}
