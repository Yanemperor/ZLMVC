//
//  UIColor+Extension.swift
//  ZLMVC
//
//  Created by Zilong.Zhou on 2024/6/6.
//

import UIKit

extension ThemeColorPicker {

    static var theme: ThemeColorPicker {
        return ["#00abeb", "#00abeb"]
    }

    static var bg: ThemeColorPicker {
        return ["#ffffff", "#1C1C1C"]
    }

    static var table: ThemeColorPicker {
        return ["#f5f5f5", "#121212"]
    }

    static var title: ThemeColorPicker {
        return ["#333333", "#acacac"]
    }

    static var text: ThemeColorPicker {
        return ["#666666", "#666666"]
    }

    static var detail: ThemeColorPicker {
        return ["#999999", "#333333"]
    }

    static var line: ThemeColorPicker {
        return ["#ececec", "#333333"]
    }
}

extension UIColor {
    static var theme: UIColor {
        return UIColor(hexString: "#00abeb")!
    }

    static var bg: UIColor {
        return UIColor(hexString: "#ffffff")!
    }

    static var head: UIColor {
        return UIColor(hexString: "#111111")!
    }

    static var title: UIColor {
        return UIColor(hexString: "#333333")!
    }

    static var text: UIColor {
        return UIColor(hexString: "#666666")!
    }

    static var detail: UIColor {
        return UIColor(hexString: "#999999")!
    }
}
