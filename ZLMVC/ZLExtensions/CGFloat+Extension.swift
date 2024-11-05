//
//  CGFloat+Extension.swift
//  ZLMVC
//
//  Created by Zilong.Zhou on 2024/6/7.
//

import UIKit

func auto(size: CGFloat) -> CGFloat {
    var num = size
    num = num * UIScreen.main.bounds.size.width / .currentWidth
    return num
}

extension CGFloat {
    static func auto(size: CGFloat) -> CGFloat {
        var num = size
        num = num * UIScreen.main.bounds.size.width / .currentWidth
        return num
    }

    static var max: CGFloat {
        get {
            return CGFloat.greatestFiniteMagnitude
        }
    }

    static var mini: CGFloat {
        get {
            return CGFloat.leastNormalMagnitude
        }
    }

    static var screenWidth: CGFloat {
        get {
            return UIScreen.main.bounds.size.width
        }
    }

    static var screenHeight: CGFloat {
        get {
            return UIScreen.main.bounds.size.height
        }
    }

    static var currentWidth: CGFloat {
        get {
            return 375.0
        }
    }

}
