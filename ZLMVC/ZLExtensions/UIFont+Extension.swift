//
//  UIFont+Extension.swift
//  ZLMVC
//
//  Created by Zilong.Zhou on 2024/6/7.
//

import UIKit

extension UIFont {
    class func auto(size: CGFloat) -> UIFont {
        return UIFont.systemFont(ofSize: size * .screenWidth / .currentWidth)
    }

    class func autoBold(size: CGFloat) -> UIFont {
        return UIFont.boldSystemFont(ofSize: size * .screenWidth / .currentWidth)
    }
}

